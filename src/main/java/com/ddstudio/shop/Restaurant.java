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

@WebServlet("/shop/restaurant/list.do")
public class Restaurant extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ShopDAO dao = new ShopDAO();
		
		ArrayList<RestaurantDTO> list = dao.list();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/restaurant/list.jsp");
		dispatcher.forward(req, resp);
	}

}