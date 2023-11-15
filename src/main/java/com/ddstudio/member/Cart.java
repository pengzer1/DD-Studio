package com.ddstudio.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.UserCartDTO;
import com.ddstudio.member.repository.UserCartDAO;

@WebServlet("/member/cart/list.do")
public class Cart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Cart.java
		String email = req.getSession().getAttribute("email").toString();
		
		UserCartDAO dao = new UserCartDAO();
		
		ArrayList<UserCartDTO> dto = dao.view(email);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/cart/list.jsp");
		dispatcher.forward(req, resp);
	}
}
