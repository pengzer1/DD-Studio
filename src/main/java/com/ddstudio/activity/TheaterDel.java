package com.ddstudio.activity;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/activity/theaterdel.do")
public class TheaterDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//TheaterDel.java
		
		String seq = req.getParameter("seq");

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/theaterdel.jsp");
		dispatcher.forward(req, resp);

	}
}
