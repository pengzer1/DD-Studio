package com.ddstudio.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.UserBuyDTO;
import com.ddstudio.member.repository.UserBuyDAO;

/**
 * 구매내역을 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/purchase/history.do")
public class PurchaseHistory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// PurchaseHistory.java
		// 1.

		String email = req.getSession().getAttribute("email").toString();

		// 2.
		UserBuyDAO dao = new UserBuyDAO();

		ArrayList<UserBuyDTO> list = dao.get(email);
		
		ArrayList<UserBuyDTO> plist = dao.pget(email);

		// 3.
		req.setAttribute("list", list);
		
		req.setAttribute("plist", plist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/purchase/history.jsp");
		dispatcher.forward(req, resp);
	}
}