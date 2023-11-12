package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.activity.model.AttractionCloseDTO;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.admin.model.ThemeDTO;

@WebServlet("/activity/attraction.do")
public class Attraction extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Attraction.java
		//- 조건 검색기능 O > 페이지 구분 X
		
		//어트랙션 정보 가져오기
		ActDAO dao = new ActDAO();

		ArrayList<AttractionDTO> list = dao.attractionList();

		//조건 검색 select box용 테마 가져오기
		ArrayList<ThemeDTO> themeList = dao.themeList();

		//4. 데이터 전송
		req.setAttribute("list", list);
		req.setAttribute("themeList", themeList);
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/list.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//- 선택한 테마(조건) 가져오기
		//- 선택한 운휴일정(조건) 가져오기(정상운영/운휴)
	
	
	
	}
}
