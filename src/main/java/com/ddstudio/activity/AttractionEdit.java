package com.ddstudio.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.AttractionHashtagDTO;
import com.ddstudio.activity.model.AttractionImgDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;

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
		
		AttractionDTO dto = dao.getAttraction(seq);
		
		LocationDTO location_dto = dao.getAttractionLocation(seq);
		
		ArrayList<AttractionImgDTO> list = dao.attractionImgList(seq);
		
		ArrayList<HashTagDTO> taglist = dao.getHashtagList();
		
		//ArrayList<AttractionHashtagDTO> hashtag_list = dao.attractionHashtagList(seq);
		
		int flag = 0;
		String temp = "[";
		
		for (HashTagDTO tag : taglist) {
				temp += "\"" + tag.getName() + "\",";
				flag ++;
				if (flag == taglist.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("location_dto", location_dto);
		req.setAttribute("list", list);
		req.setAttribute("taglist", temp);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//수정하기
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String capacity = req.getParameter("capacity");
		String restriction = req.getParameter("restriction");
		String is_test = req.getParameter("is_test");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		
		ActDAO dao = new ActDAO();
		
		AttractionDTO dto = new AttractionDTO();
		
		dto.setAttraction_seq(seq);
		dto.setName(name);
		dto.setCapacity(capacity);
		dto.setRestriction(restriction);
		dto.setIs_test(is_test);
		dto.setLat(lat);
		dto.setLng(lng);
		
		int result = dao.addLocation(dto);
		
		if (result == 1) {
			
			String location_seq = dao.getLocationSeq(dto);
			dto.setLocation_seq(location_seq);
			result = dao.editAttraction(dto, seq);
			
			if (result == 1) {
				
				resp.sendRedirect("/ddstudio/activity/attraction.do");
				
			} else {
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('Edit Attraction failed'); history.back();</script>");
				writer.close();
			}
			
//		} else {
//			
//			PrintWriter writer = resp.getWriter();
//			writer.print("<script>alert('Add Location failed'); history.back();</script>");
//			writer.close();
//			
//		}
		
		
		
		
		}
	}
}