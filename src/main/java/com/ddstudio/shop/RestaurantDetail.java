package com.ddstudio.shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.shop.model.RestaurantCloseDTO;
import com.ddstudio.shop.model.RestaurantDTO;
import com.ddstudio.shop.model.RestaurantImgDTO;
import com.ddstudio.shop.repository.ShopDAO;

@WebServlet("/shop/restaurant/detail.do")
public class RestaurantDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ShopDAO dao = new ShopDAO();
		
		RestaurantDTO dto = dao.restaurantDedtail(req.getParameter("seq"));
		
		ArrayList<RestaurantImgDTO> imgList = dao.restaurantImgs(req.getParameter("seq"));
		
		RestaurantCloseDTO closeDTO = dao.restaurantClose(req.getParameter("seq"));
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("closeDTO", closeDTO);
		req.setAttribute("imgList", imgList);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/restaurant/detail.jsp");
		dispatcher.forward(req, resp);
	}

}