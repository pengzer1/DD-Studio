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

/**
 * 기프트샵 삭제 서블릿 입니다.
 * 선택한 기프트샵을 삭제 하는 기능을 처리합니다.
 * @author pega0
 *
 */
@WebServlet("/shop/giftshop/del.do")
public class GiftshopDel extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
     * 
     * 기프트샵 삭제 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/giftshop/del.jsp");
		dispatcher.forward(req, resp);
	}
	
	/**
	 * HTTP POST 요청을 처리합니다.
     * 
     * 클라이언트로부터 기프트샵 삭제 요청을 처리하고, 결과에 따라 성공 또는 실패 메시지를 표시합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		ShopDAO dao = new ShopDAO();
		
		// 1. 아이템 이름 변경하기
		
		dao.changeItemNameWithShop(seq);
		
		// 2. 기프트샵 변경하기
		
		int result = dao.changeShop(seq);
		
		if (result == 1) {
			
			resp.sendRedirect("/ddstudio/shop/giftshop.do");
			
		} else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('Gift Shop Del failed'); history.back(); </script>");
			writer.close();
			
		}
		
		
	}

}