package com.ddstudio.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *  관리자가 관리하는 기능들의 목록 리스트를 보여주는 페이지로 이동하는 클래스
 * @author leeje
 *
 */
@WebServlet("/admin/adminpage.do")
public class AdminPage extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminpage.jsp");
		dispatcher.forward(req, resp);
	}
}
