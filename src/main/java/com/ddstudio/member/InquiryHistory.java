	package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/history/inquiry/inquiry.do")
public class InquiryHistory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//InquiryHistory.java
		//마이페이지에서 이용문의, 칭찬/불편/건의 내용이 추가되어 보여주는 페이지

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/history/inquiry/inquiry.jsp");
		dispatcher.forward(req, resp);
	}
}
