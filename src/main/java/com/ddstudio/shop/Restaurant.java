package com.ddstudio.shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.shop.model.RestaurantDTO;
import com.ddstudio.shop.repository.ShopDAO;

@WebServlet("/shop/restaurant.do")
public class Restaurant extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.removeAttribute("close");
		String close = req.getParameter("close");
		
		if (close == null || close.equals("")) {
			close = "";
		}
		
		ShopDAO dao = new ShopDAO();
		
		ArrayList<RestaurantDTO> list = dao.restaurantList(close);
		
		req.setAttribute("list", list);
		req.setAttribute("close", close);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/restaurant/list.jsp");
		dispatcher.forward(req, resp);
	}

}