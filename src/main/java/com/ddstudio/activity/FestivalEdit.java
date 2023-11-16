package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.AttractionHashtagDTO;
import com.ddstudio.activity.model.FestivalDTO;
import com.ddstudio.activity.model.FestivalHashtagDTO;
import com.ddstudio.activity.model.FestivalImgDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/festivaledit.do")
public class FestivalEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//FestivalEdit.java
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		FestivalDTO dto = dao.getFestival(seq);
		
		LocationDTO location_dto = dao.getFestivalLocation(seq);
		
		ArrayList<FestivalImgDTO> img_list = dao.festivalImgList(seq);
		
		ArrayList<FestivalHashtagDTO> hashtag_list = dao.festivalHashtagList(seq);
		
		int flag = 0;
		String temp = "[";
		
		for (FestivalHashtagDTO tag : hashtag_list) {
				temp += "\"" + dto.getName() + "\",";
				flag ++;
				if (flag == hashtag_list.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("location_dto", location_dto);
		req.setAttribute("img_list", img_list);
		req.setAttribute("hashtag_list", temp);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
	
	
	
	}
}
