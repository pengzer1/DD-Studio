package com.ddstudio.guide;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 놀이공원 이용 안내를 페이지를 보여주는 클래스입니다.
 * @author leeje
 *
 */
@WebServlet("/guide/park.do")
public class Park extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/guide/park.jsp");
		dispatcher.forward(req, resp);
	}
}