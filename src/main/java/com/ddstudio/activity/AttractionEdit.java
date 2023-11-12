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
import com.ddstudio.activity.model.AttractionImgDTO;
import com.ddstudio.activity.repository.ActDAO;

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
		
		ActDAO dao = new ActDAO();
		
		AttractionDTO dto = dao.getAttraction(seq);
		
		ArrayList<AttractionImgDTO> list = dao.attractionImgList(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//수정하기
		
	}
}
