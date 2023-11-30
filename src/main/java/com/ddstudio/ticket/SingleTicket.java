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

/**
 * 개인 예매 서블릿입니다.
 * 개인 예매를 추가 하는 기능을 처리합니다.
 * @author pega0
 *
 */
@WebServlet("/ticket/single-reservation.do")
public class SingleTicket extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
     * 
     * 개인 예매 추가 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
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