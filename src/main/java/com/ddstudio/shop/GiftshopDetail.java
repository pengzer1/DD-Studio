package com.ddstudio.shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.shop.model.GiftShopCloseDTO;
import com.ddstudio.shop.model.GiftShopDTO;
import com.ddstudio.shop.model.GiftShopImgDTO;
import com.ddstudio.shop.model.ItemDTO;
import com.ddstudio.shop.repository.ShopDAO;

@WebServlet("/shop/giftshop/detail.do")
public class GiftshopDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ShopDAO dao = new ShopDAO();
		
		GiftShopDTO dto = dao.giftShopDetail(req.getParameter("seq"));
		
		GiftShopCloseDTO closeDTO = dao.giftShopClose(req.getParameter("seq"));
		
		ArrayList<GiftShopImgDTO> imgList = dao.giftShopImgs(req.getParameter("seq"));
		
		ArrayList<ItemDTO> list = dao.itemList(req.getParameter("seq"));
		
		req.setAttribute("dto", dto);
		req.setAttribute("closeDTO", closeDTO);
		req.setAttribute("list", list);
		req.setAttribute("imgList", imgList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/giftshop/detail.jsp");
		dispatcher.forward(req, resp);
	}

}