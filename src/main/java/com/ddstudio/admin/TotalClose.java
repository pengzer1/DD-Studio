package com.ddstudio.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 운휴를 관리하는 리스트들을 보여주는 클래스
 * @author leeje
 *
 */
@WebServlet("/admin/totalclose.do")
public class TotalClose extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/close/totalclose.jsp");
		dispatcher.forward(req, resp);
	}
}
