package com.ddstudio.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 기프트샵 운휴 관리 페이지로 이동하는 클래스
 * @author leeje
 *
 */
@WebServlet("/admin/giftshopclose.do")
public class GiftShopClose extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/close/giftshopclose.jsp");
		dispatcher.forward(req, resp);
	}
}
