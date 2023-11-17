package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.MovieDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/movie.do")
public class Movie extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Movie.java
		//- 조건 검색: 날짜별 선택 > 일단 버려
		
		req.removeAttribute("date");
		String date = req.getParameter("date");
		
		if (date == null || date.equalsIgnoreCase("")) {
			date = "";
		}
		
		//date = ""
		//date = 각 날짜
		
		ActDAO dao = new ActDAO();
		
		ArrayList<MovieDTO> list = dao.movieList();
		
		req.setAttribute("list", list);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/list.jsp");
		dispatcher.forward(req, resp);

	}
}