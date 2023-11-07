package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/history/ticket.do")
public class TicketHistory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//TicketHistory.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/history/ticket.jsp");
		dispatcher.forward(req, resp);
	}
}