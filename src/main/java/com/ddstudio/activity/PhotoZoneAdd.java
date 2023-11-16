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
			
			//1. 동일한 위치 탐색 후 위치 테이블 추가
			dao.addLocation(dto);
			
			String location_seq = dao.getLocationSeq(dto);
			
			if (location_seq != null) {
				dto.setLocation_seq(location_seq);
				
				int result = dao.addPhotozone(dto);
				
				if (result == 1) {
					
					photozone_seq = dao.getPhotozoneSeq();
					System.out.println("photozone_seq: " + photozone_seq);
					
					Enumeration<?> files = multi.getFileNames();
					while (files.hasMoreElements()) {
					    String fname = (String) files.nextElement();
					    String filename = multi.getFilesystemName(fname);
					    // 파일명을 이용하여 다양한 작업 수행
					    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
					    fileList.add(filename);
					}
				
					System.out.println("fileList: " + fileList.toString());
					result = dao.addPhotozoneImg(fileList, photozone_seq);
				
					if (result > 0) {
						
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('Successfully added!'); location.href='/ddstudio/activity/photozone.do';</script>");
							writer.close();
							
							//resp.sendRedirect("/ddstudio/activity/festival.do");
					} else {
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Add PhotozoneImg failed'); history.back();</script>");
						writer.close();
						
					}
				
				} else {
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Add Photozone failed'); history.back();</script>");
					writer.close();
				}
				
			} else {
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('location failed'); history.back();</script>");
				writer.close();
				
			}
			
		} catch (Exception e) {
			System.out.println("at PhotoZoneAdd.doPost");
			e.printStackTrace();
		}
	
	
	
	
	
	}
}