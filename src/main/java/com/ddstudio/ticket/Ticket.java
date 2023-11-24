package com.ddstudio.ticket;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 예매 선택 서블릿 입니다.
 * 어떤 예매를 할 것인지 선택하는 기능을 처리합니다.
 * @author pega0
 *
 */
@WebServlet("/ticket/select.do")
public class Ticket extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
     * 
     * 예매 선택 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ticket/select.jsp");
		dispatcher.forward(req, resp);
	}

}