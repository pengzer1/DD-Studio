package com.ddstudio.ticket;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.ticket.model.TicketDTO;
import com.ddstudio.ticket.repository.TicketDAO;

@WebServlet("/ticket/reservation-check.do")
public class Ticketing extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TicketDAO dao = new TicketDAO();
		
		String date = req.getParameter("date");
		String type = req.getParameter("ticket-type");
		String adult = req.getParameter("adult");
		String teenager = req.getParameter("teenager");
		String child = req.getParameter("child");
		String benefit_seq = req.getParameter("benefit_seq");
		String benefit_name = req.getParameter("benefit_name");
		String discount_rate = req.getParameter("discount_rate");
		
		TicketDTO adultDto = dao.getAdultPrice(type);
		TicketDTO teenagerDto = dao.getTeenagerPrice(type);
		TicketDTO childDto = dao.getChildPrice(type);
		
		req.setAttribute("date", date);
		req.setAttribute("type", type);
		req.setAttribute("adult", adult);
		req.setAttribute("teenager", teenager);
		req.setAttribute("child", child);
		req.setAttribute("benefit_seq", benefit_seq);
		req.setAttribute("benefit_name", benefit_name);
		req.setAttribute("discount_rate", discount_rate);
		req.setAttribute("adultDTO", adultDto);
		req.setAttribute("teenagerDTO", teenagerDto);
		req.setAttribute("childDTO", childDto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ticket/reservation-check.jsp");
		dispatcher.forward(req, resp);
	}

}