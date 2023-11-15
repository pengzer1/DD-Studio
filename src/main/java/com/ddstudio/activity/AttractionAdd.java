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


@WebServlet("/activity/attractionadd.do")
public class AttractionAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionAdd.java
		
		//해시태그 리스트 전달하기
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
		
		System.out.println(temp);
		
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
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String name = multi.getParameter("name");
			String capacity = multi.getParameter("capacity");
			String restriction = multi.getParameter("restriction");
			String is_test = multi.getParameter("is_test");
			String lng = multi.getParameter("lng");
			String lat = multi.getParameter("lat");
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
			dto.setLng(lng);
			dto.setLat(lat);
			
			//** tags로 받은 JSON 형식 ArrayList<String>으로 변환
			JSONParser parser = new JSONParser();
			JSONArray arr =  (JSONArray)parser.parse(tags);
			
			ArrayList<String> taglist = new ArrayList<String>(); 
			
			for (Object obj : arr) {
				//System.out.println(((JSONObject)obj).get("value"));
				//taglist.add((String)(JSONObject)obj).get("value"));
				
				taglist.add(((JSONObject)obj).get("value").toString());
				
			}
			
		
			//1. 동일한 위치 탐색하여 없으면 위치 테이블에 추가
			dao.addLocation(dto);
			
			String location_seq = dao.getLocationSeq(dto);
			
			//2. 어트랙션 테이블에 추가
			if (location_seq != null) {
				dto.setLocation_seq(location_seq);
				
				int result = dao.addAttraction(dto);
				
				if(result == 1) {
					attraction_seq = dao.getAttractionSeq();
					
					Enumeration<?> files = multi.getFileNames();
					while (files.hasMoreElements()) {
					    String fname = (String) files.nextElement();
					    String filename = multi.getFilesystemName(fname);
					    // 파일명을 이용하여 다양한 작업 수행
					    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
					    fileList.add(filename);
					}
					
					result = dao.addAttractionImg(fileList, attraction_seq);
					
					if (result > 0) {
						
						ArrayList<AttractionHashtagDTO> attraction_hashtag_dto = dao.getHashtagSeq(taglist, attraction_seq);
						
						result = dao.addAttractionHashtag(attraction_hashtag_dto);
						
						if (result > 0) {
							
							resp.sendRedirect("/ddstudio/activity/attraction.do");

						} else {
							
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('Add AttractionHashtag failed'); history.back();</script>");
							writer.close();
							
						}
						
						
					} else {
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Add Attraction Img failed'); history.back();</script>");
						writer.close();
					}
					
				} else {
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Add Attraction failed'); history.back();</script>");
					writer.close();
				}
				 
				
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('location failed'); history.back();</script>");
				writer.close();
			}
			
			
		} catch (Exception e) {
			System.out.println("at AttractionAdd.doPost");
			e.printStackTrace();
		}
		
	
	
	}
}