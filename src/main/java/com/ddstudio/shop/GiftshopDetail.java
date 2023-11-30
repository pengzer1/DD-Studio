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

/**
 * 기프트샵 상세 서블릿 입니다.
 * 선택한 기프트샵의 상세 정보를 보여주는 기능을 처리합니다.
 * @author pega0
 *
 */
@WebServlet("/shop/giftshop/detail.do")
public class GiftshopDetail extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
	 * 
	 * 기프트샵 상세 정보를 가져오고, 요청과 응답 객체에 필요한 속성을 설정한 후 JSP 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		ShopDAO dao = new ShopDAO();
		
		GiftShopDTO dto = dao.giftShopDetail(req.getParameter("seq"));
		
		GiftShopCloseDTO closeDTO = dao.giftShopClose(req.getParameter("seq"));
		
		ArrayList<GiftShopImgDTO> imgList = dao.giftShopImgs(req.getParameter("seq"));
		
		ArrayList<ItemDTO> list = dao.itemList(req.getParameter("seq"));
		
		req.setAttribute("seq", seq);
		req.setAttribute("dto", dto);
		req.setAttribute("closeDTO", closeDTO);
		req.setAttribute("list", list);
		req.setAttribute("imgList", imgList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/giftshop/detail.jsp");
		dispatcher.forward(req, resp);
	}

}