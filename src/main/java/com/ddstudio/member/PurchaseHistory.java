package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/purchase/history.do")
public class PurchaseHistory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PurchaseHistory.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/purchase/history.jsp");
		dispatcher.forward(req, resp);
	}
}