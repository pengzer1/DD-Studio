package com.ddstudio.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

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
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 어트랙션을 추가하는 기능을 담당하는 서블릿 클래스입니다.
 * 어트랙션 정보, 위치, 이미지, 어트랙션의 해시태그를 데이터베이스의 각 테이블에 추가합니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/attractionadd.do")
public class AttractionAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionAdd.java
		
		//해시태그 리스트 전달하기 > whitelist용
		ActDAO dao = new ActDAO();
		
		ArrayList<HashTagDTO> list = dao.getHashtagList();
		
		//위에서 받은 ArrayList JSON 형식으로 jsp 전달하기
		// > 해야하는데 일단 무지성으로 해보쟈
		
		int flag = 0;
		String temp = "[";
		
		for (HashTagDTO dto : list) {
				temp += "\"" + dto.getName() + "\",";
				flag ++;
				if (flag == list.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		
		//System.out.println(temp);
		
		req.setAttribute("taglist", temp);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//어트랙션 추가 처리
		//- 이미지는 이미지 DB에 넣어주기
		//- 위치는 위치 DB에 넣어주기
		//- 해시태그는 해시태그 DB에 넣어주기
		//- 나머지는 어트랙션 DB에 넣어주기
		
		//req.getParameter 작동 불가!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		ActDAO dao = new ActDAO();
		AttractionDTO dto = new AttractionDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		String attraction_seq = "";
		
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/attraction"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
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
			
			//System.out.println(tags);
			//[{"value":"aaa"},{"value":"bbb"},{"value":"ccc"}]
			//tags = tags.substring(1, tags.length()-1).replace("{\"value\":\"", "").replace("\"}", "");
			
			//0. dto에 담아주기
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
			
		
			//1. 동일한 위치 탐색하여 없으면 위치 테이블에 추가
			int result = dao.addLocation(lat, lng);
			
			if (result == 1) { //위치 추가 성공
				
				String location_seq = dao.getLocationSeq(lat, lng);
				dto.setLocation_seq(location_seq);
				
//				System.out.println("location_seq: " + location_seq);
				
				//2. 어트랙션 테이블에 추가
				result = dao.addAttraction(dto);
				
//				System.out.println("dao.addAttraction 결과: " + ((result == 1)? "성공" : "실패"));
				
				if (result == 1) { //어트랙션 테이블 추가 성공
					
					attraction_seq = dao.getAttractionSeq();
//					System.out.println("attraction_seq: " + attraction_seq);

					//3. 어트랙션 이미지 테이블에 추가
					Enumeration<?> files = multi.getFileNames();
					while (files.hasMoreElements()) {
					    String fname = (String) files.nextElement();
					    String filename = multi.getFilesystemName(fname);
					    // 파일명을 이용하여 다양한 작업 수행
					    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
					    fileList.add(filename);
					}
					
					result = dao.addAttractionImg(fileList, attraction_seq);
					
//					System.out.println("fileList: " + fileList.toString());
//					System.out.println("dao.addAttractionImg 결과: " + ((result > 0)? "성공" : "실패"));
					
					if (result > 0) { //어트랙션 이미지 추가 성공
						
						//4. 어트랙션 해시태그 테이블에 추가
//						System.out.println("입력 받은 해시 태그: " + taglist.toString());
						ArrayList<String> seqlist = dao.getHashtagSeq(taglist);
						
						result = dao.addAttractionHashtag(seqlist, attraction_seq);
						
//						System.out.println("입력한 해시태그의 tblHashtag seq: " + seqlist.toString());
//						System.out.println("addAttractionHashtag 결과: " + ((result > 0)? "성공" : "실패"));
						
						if (result > 0) { //어트랙션 해시태그 추가 성공
							
							//**최종 등록 성공!!!!!**
							resp.sendRedirect("/ddstudio/activity/attraction.do");
						
						} else { //어트랙션 해시태그 추가 실패
							
							resp.setContentType("text/html; charset=UTF-8");
							
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('어트랙션 해시태그 추가에 실패했습니다.');history.back();</script>");
							writer.close();
							
						}
					
					} else { //어트랙션 이미지 추가 실패
					
						resp.setContentType("text/html; charset=UTF-8");
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('어트랙션 이미지 추가에 실패했습니다.');history.back();</script>");
						writer.close();
						
					}
					
				} else { //어트랙션 테이블 추가 실패
					
					resp.setContentType("text/html; charset=UTF-8");
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('어트랙션 테이블 등록에 실패했습니다.');history.back();</script>");
					writer.close();
					
				}
				
				
			} else { //위치 추가 실패
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('동일한 위치에 장소가 존재합니다. 다른 위치를 선택해주세요.');history.back();</script>");
				writer.close();
				
			}
			
		} catch (Exception e) {
			System.out.println("at AttractionAdd.doPost");
			e.printStackTrace();
		}
	
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();

	}
	
}
	