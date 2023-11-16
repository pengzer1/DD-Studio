package com.ddstudio.activity;

import java.io.IOException;
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
		
		ArrayList<AttractionImgDTO> list = dao.attractionImgList(seq);
		
		ArrayList<AttractionHashtagDTO> hashtag_list = dao.attractionHashtagList(seq);
		
		int flag = 0;
		String temp = "[";
		
		for (AttractionHashtagDTO tag : hashtag_list) {
				temp += "\"" + dto.getName() + "\",";
				flag ++;
				if (flag == list.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		req.setAttribute("hashtag_list", temp);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//수정하기
		
	}
}
