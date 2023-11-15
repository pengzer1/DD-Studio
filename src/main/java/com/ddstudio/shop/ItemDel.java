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

@WebServlet("/shop/item/del.do")
public class ItemDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/item/del.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		ShopDAO dao = new ShopDAO();
		
		// 아이템 삭제 절차
		// 0. shop_seq 받아 오기
		
		String shop_seq = dao.getShopSeq(seq);
		
		// 1. 이름변경 name + (판매 종료)
		int result = dao.changeItemName(seq);
		
		if (result == 1) {
			
			resp.sendRedirect("/ddstudio/shop/giftshop/detail.do?seq=" + shop_seq);
			
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('Item Name Change failed'); history.back(); </script>");
			writer.close();
		}
		
	}

}