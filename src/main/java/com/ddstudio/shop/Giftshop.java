package com.ddstudio.shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.shop.model.GiftShopDTO;
import com.ddstudio.shop.repository.ShopDAO;
/**
 * 기프트샵 서블릿입니다.
 * 기프트샵 리스트를 불러오는 서블릿입니다.
 * @author pega0
 *
 */
@WebServlet("/shop/giftshop.do")
public class Giftshop extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
	 * 
	 * 기프트샵 목록을 가져오고, 요청과 응답 객체에 필요한 속성을 설정한 후 JSP 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.removeAttribute("close");
		String close = req.getParameter("close");
		
		if (close == null || close.equals("")) {
			close = "";
		}
		
		ShopDAO dao = new ShopDAO();
		
		ArrayList<GiftShopDTO> list = dao.giftShopList(close); 
		
		req.setAttribute("list", list);
		req.setAttribute("close", close);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/giftshop/list.jsp");
		dispatcher.forward(req, resp);
	}

}