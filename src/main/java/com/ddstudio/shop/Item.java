package com.ddstudio.shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.shop.model.ItemDTO;
import com.ddstudio.shop.model.ItemImgDTO;
import com.ddstudio.shop.repository.ShopDAO;

@WebServlet("/shop/item/detail.do")
public class Item extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ShopDAO dao = new ShopDAO();
		
		ItemDTO dto = dao.itemDetail(req.getParameter("seq"));
		
		ArrayList<ItemImgDTO> list = dao.itemImgs(req.getParameter("seq"));
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/item/detail.jsp");
		dispatcher.forward(req, resp);
	}

}