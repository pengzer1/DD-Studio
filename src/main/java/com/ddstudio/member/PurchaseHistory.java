package com.ddstudio.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.UserBuyDTO;
import com.ddstudio.member.repository.UserBuyDAO;

@WebServlet("/member/purchase/history.do")
public class PurchaseHistory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// PurchaseHistory.java
		// 1.

		String email = req.getSession().getAttribute("email").toString();

		// 2.
		UserBuyDAO dao = new UserBuyDAO();

		ArrayList<UserBuyDTO> list = dao.get(email);

		// 3.
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/purchase/history.jsp");
		dispatcher.forward(req, resp);
	}
}