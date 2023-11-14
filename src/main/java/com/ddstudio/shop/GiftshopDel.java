package com.ddstudio.shop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.shop.repository.ShopDAO;

@WebServlet("/shop/giftshop/del.do")
public class GiftshopDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/giftshop/del.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		ShopDAO dao = new ShopDAO();
		
		// 1. 아이템 이름 변경하기
		
		dao.changeItemNameWithShop(seq);
		
		// 2. 기프트샵 변경하기
		
		int result = dao.changeShop(seq);
		
		if (result == 1) {
			
			resp.sendRedirect("/ddstudio/shop/giftshop.do");
			
		} else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('Gift Shop Del failed'); history.back(); </script>");
			writer.close();
			
		}
		
		
	}

}