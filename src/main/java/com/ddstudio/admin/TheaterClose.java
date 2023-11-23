package com.ddstudio.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 영화관 운휴를 관리하는 페이지로 이동하는 클래스
 * @author leeje
 *
 */
@WebServlet("/admin/theaterclose.do")
public class TheaterClose extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/close/theaterclose.jsp");
		dispatcher.forward(req, resp);
	}
}
