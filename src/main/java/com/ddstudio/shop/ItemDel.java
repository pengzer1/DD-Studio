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
 * 아이템 삭제 서블릿 입니다.
 * 선택한 아이템을 삭제 하는 기능을 처리합니다.
 * @author pega0
 *
 */
@WebServlet("/shop/item/del.do")
public class ItemDel extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
     * 
     * 아이템 삭제 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/item/del.jsp");
		dispatcher.forward(req, resp);
	}
	
	/**
	 * HTTP POST 요청을 처리합니다.
     * 
     * 클라이언트로부터 아이템 삭제 요청을 처리하고, 결과에 따라 성공 또는 실패 메시지를 표시합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		ShopDAO dao = new ShopDAO();
		
		// 아이템 삭제 절차
		// 0. shop_seq 받아 오기
		
		String shop_seq = dao.getShopSeq(seq);
		
		// 1. 이름변경 name + (판매 종료)
		int result = dao.changeItemName(seq);
		
		if (result == 1) {
			
			resp.sendRedirect("/ddstudio/shop/giftshop/detail.do?seq=" + shop_seq);
			
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('Item Name Change failed'); history.back(); </script>");
			writer.close();
		}
		
	}

}