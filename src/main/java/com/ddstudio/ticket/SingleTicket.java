package com.ddstudio.ticket;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.ticket.model.BenefitDTO;
import com.ddstudio.ticket.repository.TicketDAO;

@WebServlet("/ticket/single-reservation.do")
public class SingleTicket extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TicketDAO dao = new TicketDAO();
		
		ArrayList<BenefitDTO> list = dao.getBenefit();
		ArrayList<BenefitDTO> plist = dao.getCardBenefit();
		
		req.setAttribute("list", list);
		req.setAttribute("plist", plist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ticket/single-reservation.jsp");
		dispatcher.forward(req, resp);
	}

}