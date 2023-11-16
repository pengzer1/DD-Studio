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
import com.ddstudio.admin.model.HashTagDTO;

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
		
		//해시태그 목록 불러오기
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
		
		//기존 입력된 해시태그 값 불러오기
		ArrayList<FestivalHashtagDTO> hashtag_list = dao.festivalHashtagList(seq);
		
		flag = 0;
		temp = "[";
		
		for (FestivalHashtagDTO tag : hashtag_list) {
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
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
	
	
	
	}
}
