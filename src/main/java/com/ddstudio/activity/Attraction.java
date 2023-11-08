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
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/attraction.do")
public class Attraction extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Attraction.java

		//Step 1. 페이지 구분 없이 일단 어트랙션 테이블, 어트랙션 이미지 테이블 가지고 와서 jsp로 보내주기
		
		ActDAO dao = new ActDAO();
		
		ArrayList<AttractionDTO> list = dao.list();
		
		//System.out.println(list);
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/list.jsp");
		dispatcher.forward(req, resp);

	}
}
