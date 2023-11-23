package com.ddstudio.guide;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Bus 클래스입니다.
 * 버스 리스트를 불러옵니다.
 */
@WebServlet("/guide/bus.do")
public class Bus extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/guide/bus/list.jsp");
		dispatcher.forward(req, resp);
	}
}
