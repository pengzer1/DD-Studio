package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.repository.CartDAO;

@WebServlet("/member/purchase/view.do")
public class Purchase extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Purchase.java

		String[] userCartSeqStr = req.getParameterValues("user_book_seq");

		int result = 0;

		CartDAO dao = new CartDAO();

		// 여러 상품을 주문하기 위해 배열을 순회합니다.
		for (String user_cart_seq : userCartSeqStr) {
			result += dao.order(user_cart_seq);
		}
	}
}
