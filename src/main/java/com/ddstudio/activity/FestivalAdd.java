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
import com.ddstudio.activity.model.FestivalDTO;
import com.ddstudio.activity.model.FestivalHashtagDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/activity/festivaladd.do")
public class FestivalAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//FestivalAdd.java
		//- 해시태그 리스트 전달 > whitelist용
		ActDAO dao = new ActDAO();
		
		ArrayList<HashTagDTO> list = dao.getHashtagList();
		
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

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//jsp에서 보낸 데이터 가져오기
		
		ActDAO dao = new ActDAO();
		FestivalDTO dto = new FestivalDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		String festival_seq = "";
	
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/festival"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String name = multi.getParameter("name");
			String time = multi.getParameter("time");
			String info = multi.getParameter("info");
			String start_date = multi.getParameter("start_date");
			String end_date = multi.getParameter("end_date");
			String lat = multi.getParameter("lat");
			String lng = multi.getParameter("lng");
			String tags = multi.getParameter("tags");
			String images1 = multi.getParameter("images1");
			String images2 = multi.getParameter("images2");
			String images3 = multi.getParameter("images3");
			
			dto.setName(name);
			dto.setTime(time);
			dto.setInfo(info);
			dto.setStart_date(start_date);
			dto.setEnd_date(end_date);
			dto.setLat(lat);
			dto.setLng(lng);
			
			JSONParser parser = new JSONParser();
			JSONArray arr =  (JSONArray)parser.parse(tags);
			
			ArrayList<String> taglist = new ArrayList<String>(); 
			
			for (Object obj : arr) {
				taglist.add(((JSONObject)obj).get("value").toString());
			}
			
			//1. 동일한 위치 탐색 후 위치 테이블 추가
			dao.addLocation(dto);
			
			String location_seq = dao.getLocationSeq(dto);
			
			if (location_seq != null) {
				dto.setLocation_seq(location_seq);
				
				int result = dao.addFestival(dto);
				
				if (result == 1) {
					
					festival_seq = dao.getFestivalSeq();
					System.out.println("festival_seq: " + festival_seq);
					
					Enumeration<?> files = multi.getFileNames();
					while (files.hasMoreElements()) {
					    String fname = (String) files.nextElement();
					    String filename = multi.getFilesystemName(fname);
					    // 파일명을 이용하여 다양한 작업 수행
					    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
					    fileList.add(filename);
					}
				
					System.out.println("fileList: " + fileList.toString());
					result = dao.addFestivalImg(fileList, festival_seq);
				
					if (result > 0) {
						
						System.out.println(taglist.toString());
						ArrayList<FestivalHashtagDTO> seqlist = dao.getHashtagSeq_festival(taglist);
						System.out.println("seqlist: " + seqlist.toString());
						
						result = dao.addFestivalHashtag(seqlist, festival_seq);
						System.out.println("addFestivalHashtag 결과: "+ result);
						
						if (result > 0) {
							
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('Successfully added!'); location.href='/ddstudio/activity/festival.do';</script>");
							writer.close();
							
							//resp.sendRedirect("/ddstudio/activity/festival.do");
						} else {
							
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('Add FestivalHashtag failed'); history.back();</script>");
							writer.close();
							
						}
						
						
					} else {
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Add FestivalImg failed'); history.back();</script>");
						writer.close();
						
					}
				
				} else {
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Add Festival failed'); history.back();</script>");
					writer.close();
				}
				
			} else {
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('location failed'); history.back();</script>");
				writer.close();
				
			}
			
		} catch (Exception e) {
			System.out.println("at FestivalAdd.doPost");
			e.printStackTrace();
		}
	
	
	}
}