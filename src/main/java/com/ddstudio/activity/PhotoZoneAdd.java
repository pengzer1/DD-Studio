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

import com.ddstudio.activity.model.FestivalHashtagDTO;
import com.ddstudio.activity.model.PhotoZoneDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/activity/photozoneadd.do")
public class PhotoZoneAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PhotoZoneAdd.java
		//- 해시태그 X
		//- 위치 테이블, 포토존 테이블, 포토존 이미지 테이블

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/photozone/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//포토존 추가 처리
		//- 이미지는 이미지 DB에 넣어주기
		//- 위치는 위치 DB에 넣어주기
		//- 나머지는 포토존 DB에 넣어주기
		
		ActDAO dao = new ActDAO();
		PhotoZoneDTO dto = new PhotoZoneDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		String photozone_seq = "";
		
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/photozone"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String name = multi.getParameter("name");
			String info = multi.getParameter("info");
			String lat = multi.getParameter("lat");
			String lng = multi.getParameter("lng");
			String images1 = multi.getParameter("images1");
			String images2 = multi.getParameter("images2");
			String images3 = multi.getParameter("images3");
			
			dto.setName(name);
			dto.setInfo(info);
			dto.setLat(lat);
			dto.setLng(lng);
			
			//1. 동일한 위치 탐색하여 없으면 위치 테이블에 추가
			int result = dao.addLocation(lat, lng);
			
			if (result == 1) { //위치 추가 성공
				
				String location_seq = dao.getLocationSeq(lat, lng);
				dto.setLocation_seq(location_seq);
				
				System.out.println("location_seq: " + location_seq);
				
				//2. 포토존 테이블에 추가
				result = dao.addPhotozone(dto);
			
				System.out.println("dao.addPhotozone 결과: " + ((result == 1)? "성공" : "실패"));
				
				System.out.println(dto.getLocation_seq());
				System.out.println(dto.getName());
				System.out.println(dto.getInfo());
				
				if (result == 1) { //포토존 테이블 추가 성공
					
					photozone_seq = dao.getPhotozoneSeq();
					System.out.println("photozone_seq: " + photozone_seq);

					//3. 포토존 이미지 테이블에 추가
					Enumeration<?> files = multi.getFileNames();
					while (files.hasMoreElements()) {
					    String fname = (String) files.nextElement();
					    String filename = multi.getFilesystemName(fname);
					    // 파일명을 이용하여 다양한 작업 수행
					    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
					    fileList.add(filename);
					}
			
					result = dao.addPhotozoneImg(fileList, photozone_seq);
					
					System.out.println("fileList: " + fileList.toString());
					System.out.println("dao.addPhotozoneImg 결과: " + ((result > 0)? "성공" : "실패"));
					
					if (result > 0) { //포토존 이미지 추가 성공
							
						//**최종 등록 성공!!!!!**
						resp.sendRedirect("/ddstudio/activity/photozone.do");
					
					} else { //포토존 이미지 추가 실패
					
						resp.setContentType("text/html; charset=UTF-8");
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('포토존 이미지 추가에 실패했습니다.');history.back();</script>");
						writer.close();
						
					}
					
				} else { //포토존 테이블 추가 실패
					
					resp.setContentType("text/html; charset=UTF-8");
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('포토존 테이블 등록에 실패했습니다.');history.back();</script>");
					writer.close();
					
				}
			
			
			} else { //위치 추가 실패
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('동일한 위치에 장소가 존재합니다. 다른 위치를 선택해주세요.');history.back();</script>");
				writer.close();
				
			}
			
		} catch (Exception e) {
			System.out.println("at FestivalAdd.doPost");
			e.printStackTrace();
		}
	
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();
			
	}
}