package com.ddstudio.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.member.model.UserBuyDTO;
import com.ddstudio.member.repository.UserCartDAO;

@WebServlet("/member/purchase/purchasing.do")
public class Purchasing extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String user_seq = (String) session.getAttribute("seq");

		String[] user_cart_seq = req.getParameterValues("user_cart_seq");
		String[] item_seq = req.getParameterValues("item_seq");
		String[] ea = req.getParameterValues("ea");
		String[] price = req.getParameterValues("price");
		String[] total_price = req.getParameterValues("total_price");
		
		String buy_seq;

		UserCartDAO dao = new UserCartDAO();

		UserBuyDTO dto = new UserBuyDTO();

		for (int i = 0; i < ea.length; i++) {
			dto.setUser_cart_seq(user_cart_seq[i]);
			dto.setItem_seq(item_seq[i]);
			dto.setEa(ea[i]);
			dto.setPrice(price[i]);
			dto.setBuy_option(total_price[i]);
			
			int result = dao.addBuy(dto);
			
			if (result == 1) {
				buy_seq = dao.getBuySeq();
				
				result = dao.addUserBuy(user_seq, buy_seq);
				
				if (result == 1) {
					
					result = dao.delUserCart(dto.getUser_cart_seq());
					
					if (result == 1) {
						
					} else {
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Del User Cart failed'); history.back();</script>");
						writer.close();
					}
				} else {
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Add User Buy failed'); history.back();</script>");
					writer.close();
				}
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('Add Buy failed'); history.back();</script>");
				writer.close();
			}
		}
		
		resp.setContentType("text/html; charset=UTF-8");

		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('구매 완료');location.href='/ddstudio/index.do';</script>");
		writer.close();
		
		return;

	}

}