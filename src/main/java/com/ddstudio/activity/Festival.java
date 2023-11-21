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
		//- 조건검색: 날짜별 조회
		
		String date = req.getParameter("date");
		
		if (date == null || date.equalsIgnoreCase("")) {
			date = "";
		}
		
		//date = ""
		//date = 날짜
		
		//페스티벌 정보 가져오기
		ActDAO dao = new ActDAO();
		
		ArrayList<FestivalDTO> list = dao.festivalList(date);
		
		//데이터 전송
		req.setAttribute("list", list);
		req.setAttribute("date", date);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/list.jsp");
		dispatcher.forward(req, resp);

	}
}