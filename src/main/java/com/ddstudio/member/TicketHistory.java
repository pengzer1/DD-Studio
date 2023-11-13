package com.ddstudio.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.UserBookDTO;
import com.ddstudio.member.repository.UserBookDAO;

@WebServlet("/member/history/ticket.do")
public class TicketHistory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//TicketHistory.java

		//1.
		String email = req.getSession().getAttribute("email").toString();
		
		//2.
		UserBookDAO dao = new UserBookDAO();
		
		ArrayList<UserBookDTO> list = dao.get(email);
		
		/* dto.setIntro(dto.getIntro().replace("\r\n","<br>")); */
		
		//3.
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/history/ticket.jsp");
		dispatcher.forward(req, resp);
	}
}