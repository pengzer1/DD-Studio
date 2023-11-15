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

@WebServlet("/shop/restaurant/del.do")
public class RestaurantDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/restaurant/del.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		ShopDAO dao = new ShopDAO();
		
		// 레스토랑 삭제
		int result = dao.changeRestaurant(seq);
		
		if (result == 1) {
			resp.sendRedirect("/ddstudio/shop/restaurant.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('Item Name Change failed'); history.back(); </script>");
			writer.close();
		}
		
	}

}