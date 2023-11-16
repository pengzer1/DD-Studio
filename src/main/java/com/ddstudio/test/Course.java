package com.ddstudio.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/course.do")
public class Course extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 코스 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/course/del.jsp");
		dispatcher.forward(req, resp);
	}

}