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

import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.AttractionHashtagDTO;
import com.ddstudio.activity.model.AttractionImgDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 어트랙션을 수정하는 기능을 담당하는 서블릿 클래스입니다.
 * 어트랙션 정보, 위치, 이미지, 어트랙션의 해시태그를 데이터베이스의 각 테이블에 수정합니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/attractionedit.do")
public class AttractionEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionEdit.java
		
		//1. 넘긴 seq 받아오기
		String seq = req.getParameter("seq");
		
		//2. DB 접근 > 해당 seq의 어트랙션 정보 가져오기
		// - tblAttraction
		// - tblAttractionImg
		// - tblAttractionHashtag
		
		ActDAO dao = new ActDAO();
		
		//어트랙션 정보
		AttractionDTO dto = dao.getAttraction(seq);
		
		//어트랙션 위치 정보
		LocationDTO location_dto = dao.getAttractionLocation(seq);
		
		//어트랙션 이미지 정보
		ArrayList<AttractionImgDTO> img_list = dao.attractionImgList(seq);
		
		//해시태그 목록 가져오기(whitelist)
		ArrayList<HashTagDTO> taglist = dao.getHashtagList();
		
		int flag = 0;
		String temp = "[";
		
		for (HashTagDTO tag : taglist) {
				temp += "\"" + tag.getName() + "\",";
				flag ++;
				if (flag == taglist.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		req.setAttribute("taglist", temp);
		
		//해당 어트랙션에 입력한 태그(value) 가져오기
		ArrayList<AttractionHashtagDTO> hashtag_list = dao.attractionHashtagList(seq);
		
		flag = 0;
		temp = "[";
		
		for (AttractionHashtagDTO tag : hashtag_list) {
				temp += "\"" + tag.getHashtag_name() + "\",";
				flag ++;
				if (flag == hashtag_list.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		req.setAttribute("valuelist", temp);
		
		req.setAttribute("dto", dto);
		req.setAttribute("location_dto", location_dto);
		req.setAttribute("img_list", img_list);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//수정하기 작업
		//*주의사항: 위치가 변경되지 않으면 null 오류 발생*
		//- 이미지 > 이미지 DB에 추가(기존꺼 삭제는 안됨. 첨부한 이미지는 계속 추가만 가능)
		//- 위치 > 위치 DB
		//- 해시태그 > 해시태그 DB
		//- 나머지 > 어트랙션 DB
		
		ActDAO dao = new ActDAO();
		AttractionDTO dto = new AttractionDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/attraction"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String seq = multi.getParameter("seq");
			String name = multi.getParameter("name");
			String capacity = multi.getParameter("capacity");
			String restriction = multi.getParameter("restriction");
			String is_test = multi.getParameter("is_test");
			String lat = multi.getParameter("lat");
			String lng = multi.getParameter("lng");
			String tags = multi.getParameter("tags");
			String images1 = multi.getParameter("images1");
			String images2 = multi.getParameter("images2");
			String images3 = multi.getParameter("images3");
			
			//0. dto에 담아주기
			dto.setAttraction_seq(seq);
			dto.setName(name);
			dto.setCapacity(capacity);
			dto.setRestriction(restriction);
			dto.setIs_test(is_test);
			dto.setLat(lat);
			dto.setLng(lng);
			
			//** tags로 받은 JSON 형식 ArrayList<String>으로 변환
			JSONParser parser = new JSONParser();
			JSONArray arr =  (JSONArray)parser.parse(tags);
			
			ArrayList<String> taglist = new ArrayList<String>(); 
			
			for (Object obj : arr) {
				taglist.add(((JSONObject)obj).get("value").toString());
			}
			
			//1. 기존 위치 번호 가져와서 위치 정보 수정하기
			LocationDTO location_dto = dao.getAttractionLocation(seq);
			
			//NEW 위치로 덮어주기
			location_dto.setLat(lat);
			location_dto.setLng(lng);
			
			int result = dao.updateLocation(location_dto);
			
			if (result == 1) { //위치 수정 성공
				
				//2. 어트랙션 테이블에 수정
				result = dao.editAttraction(dto);
				
				System.out.println("dao.EditAttraction 결과: " + ((result == 1)? "성공" : "실패"));
				
				if (result == 1) { //어트랙션 테이블 수정 성공
					
					//3-1. 어트랙션 해시태그 테이블 기존 내용 삭제
					
					//3-1-1. 어트랙션 해시태그가 기 존재하는지 확인(개수 확인)
					int cnt = dao.countAttractionHashtag(seq);
					
					if (cnt > 0) { //기 존재 해시태그 삭제
						result = dao.delAttractionHashtag(seq);
						
						if (result == 0) {
							
							resp.setContentType("text/html; charset=UTF-8");
							
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('어트랙션 해시태그 삭제에 실패했습니다.');history.back();</script>");
							writer.close();
							
						}
						
					}
					
					//기 존재 해시태그 없는 경우 바로 다음~ 해시태그 테이블에 추가하기
					
					//3-2. 어트랙션 해시태그 테이블에 추가
					System.out.println("입력 받은 해시 태그: " + taglist.toString());
					ArrayList<String> seqlist = dao.getHashtagSeq(taglist);
					
					result = dao.addAttractionHashtag(seqlist, seq);
					
					System.out.println("입력한 해시태그의 tblHashtag seq: " + seqlist.toString());
					System.out.println("addAttractionHashtag 결과: " + ((result > 0)? "성공" : "실패"));
					
					if (result > 0) { //어트랙션 해시태그 추가 성공
						
						//4. 어트랙션 이미지 테이블에 추가
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
							
							result = dao.addAttractionImg(fileList, seq);
							
							System.out.println("fileList: " + fileList.toString());
							System.out.println("dao.addAttractionImg 결과: " + ((result > 0)? "성공" : "실패"));
							
							if (result > 0) { //이미지 테이블 추가 성공
								
								//**최종 수정 성공!!!!!**
								resp.sendRedirect("/ddstudio/activity/attractiondetail.do?seq=" + seq);
								
								
							} else { //이미지 테이블 추가 실패
								
								resp.setContentType("text/html; charset=UTF-8");
								
								PrintWriter writer = resp.getWriter();
								writer.print("<script>alert('어트랙션 이미지 추가에 실패했습니다.');history.back();</script>");
								writer.close();
								
							}
							
						} else { //추가된 파일이 없는 경우 바로 수정 완료
							
							resp.sendRedirect("/ddstudio/activity/attractiondetail.do?seq=" + seq);
							
						}
						
					} else { //어트랙션 해시태그 추가 실패
						
						resp.setContentType("text/html; charset=UTF-8");
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('어트랙션 해시태그 추가에 실패했습니다.');history.back();</script>");
						writer.close();
						
					}
					
				} else { //어트랙션 테이블 수정 실패
					
					resp.setContentType("text/html; charset=UTF-8");
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('어트랙션 테이블 수정에 실패했습니다.');history.back();</script>");
					writer.close();
					
				}
				
			} else { //위치 수정 실패
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('위치 수정에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		} catch (Exception e) {
			System.out.println("at AttractionEdit.doPost");
			e.printStackTrace();
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();
		
	}
}