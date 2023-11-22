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

/**
 * 레스토랑 상세 서블릿 입니다.
 * 선택한 레스토랑의 상세 정보를 보여주는 기능을 처리합니다.
 * @author pega0
 *
 */
@WebServlet("/shop/restaurant/detail.do")
public class RestaurantDetail extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
	 * 
	 * 레스토랑 상세 정보를 가져오고, 요청과 응답 객체에 필요한 속성을 설정한 후 JSP 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
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