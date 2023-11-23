package com.ddstudio.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.model.PhotoZoneDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 포토존을 수정하는 기능을 담당하는 서블릿 클래스입니다.
 * 포토존 정보, 위치, 이미지를 데이터베이스의 각 테이블에 업데이트합니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/photozoneedit.do")
public class PhotoZoneEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PhotoZoneEdit.java
		//- 이름, 정보, 위치
		
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		PhotoZoneDTO dto = dao.getPhotozone(seq);
		
		LocationDTO location_dto = dao.getPhotozoneLocation(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("location_dto", location_dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/photozone/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//수정하기 작업
		//*주의사항: 위치가 변경되지 않으면 null 오류 발생*
		//- 이미지 > 이미지 DB에 추가(기존꺼 삭제는 안됨. 첨부한 이미지는 계속 추가만 가능)
		//- 위치 > 위치 DB
		//- 나머지 > 포토존 DB
		
		ActDAO dao = new ActDAO();
		PhotoZoneDTO dto = new PhotoZoneDTO();
		ArrayList<String> fileList = new ArrayList<String>();
	
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/photozone"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String seq = multi.getParameter("seq");
			String name = multi.getParameter("name");
			String info = multi.getParameter("info");
			String lat = multi.getParameter("lat");
			String lng = multi.getParameter("lng");
			String images1 = multi.getParameter("images1");
			String images2 = multi.getParameter("images2");
			String images3 = multi.getParameter("images3");
			
			//0. dto에 담아주기
			dto.setPhotozone_seq(seq);
			dto.setName(name);
			dto.setInfo(info);
			dto.setLat(lat);
			dto.setLng(lng);
			
			
			System.out.println(seq);
			System.out.println(name);
			System.out.println(info);
			System.out.println(lat);
			System.out.println(lng);
			
			
			//1. 기존 위치 번호 가져와서 위치 정보 수정하기
			LocationDTO location_dto = dao.getPhotozoneLocation(seq);
			
			System.out.println(location_dto.getLat());
			System.out.println(location_dto.getLng());
			
			
			//NEW 위치로 덮어주기
			location_dto.setLat(lat);
			location_dto.setLng(lng);
			
			int result = dao.updateLocation(location_dto);
			
			if (result == 1) { //위치 수정 성공
				
				//2. 포토존 테이블에 수정
				result = dao.editPhotozone(dto);
				
				System.out.println("dao.EditPhotozone 결과: " + ((result == 1)? "성공" : "실패"));
				
				if (result == 1) { //포토존 테이블 수정 성공
					
					//4. 포토존 이미지 테이블에 추가
					Enumeration<?> files = multi.getFileNames();
					while (files.hasMoreElements()) {
						String fname = (String) files.nextElement();
						String filename = multi.getFilesystemName(fname);
						// 파일명을 이용하여 다양한 작업 수행
						// filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
						if (filename != null) {
							fileList.add(filename);
						}
					}
						
					//파일이 1개 이상 추가된 경우 이미지 테이블 추가
					if(fileList.size() > 0) {
						
						result = dao.addPhotozoneImg(fileList, seq);
						
						System.out.println("fileList: " + fileList.toString());
						System.out.println("dao.addPhotozoneImg 결과: " + ((result > 0)? "성공" : "실패"));
						
						if (result > 0) { //이미지 테이블 추가 성공
							
							//**최종 수정 성공!!!!!**
							resp.sendRedirect("/ddstudio/activity/photozonedetail.do?seq=" + seq);
							
						} else { //이미지 테이블 추가 실패
							
							resp.setContentType("text/html; charset=UTF-8");
							
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('포토존 이미지 추가에 실패했습니다.');history.back();</script>");
							writer.close();
							
						}
							
					} else { //추가된 파일이 없는 경우 바로 수정 완료
						
						resp.sendRedirect("/ddstudio/activity/photozonedetail.do?seq=" + seq);
						
					}
						
				} else { //포토존 테이블 수정 실패
					
					resp.setContentType("text/html; charset=UTF-8");
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('포토존 테이블 수정에 실패했습니다.');history.back();</script>");
					writer.close();
					
				}
				
			} else { //위치 수정 실패
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('위치 수정에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		} catch (Exception e) {
			System.out.println("at PhotoZoneEdit.doPost");
			e.printStackTrace();
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();
		
		
		
	
	}
}
