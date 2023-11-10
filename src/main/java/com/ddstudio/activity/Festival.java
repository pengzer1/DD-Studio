package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.FestivalDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/festival.do")
public class Festival extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Festival.java
		
		//A. festival.do > 목록보기(조건: 페스티벌 기간 내 오늘 날짜 포함)
		//- tblFestival > list 불러오기
		//- 조건검색: 진행 여부별, 위치별 조회
		
		//1. 
		
		ActDAO dao = new ActDAO();
		
		ArrayList<FestivalDTO> list = dao.festivalList();
		
		//데이터 전송
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/list.jsp");
		dispatcher.forward(req, resp);

	}
}