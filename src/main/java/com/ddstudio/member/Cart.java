package com.ddstudio.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.ddstudio.member.model.CartDTO;
import com.ddstudio.member.model.UserCartDTO;
import com.ddstudio.member.repository.CartDAO;
import com.ddstudio.member.repository.UserCartDAO;

/**
 * 장바구니를 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/cart/list.do")
public class Cart extends HttpServlet {

	/**
	 * 장바구니를 출력하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getSession().getAttribute("email").toString();

		UserCartDAO dao = new UserCartDAO();

		ArrayList<UserCartDTO> list = dao.view(email);
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/cart/list.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * POST 메서드로 전송된 요청을 처리하여 장바구니 추가를 수행합니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//
		HttpSession session = req.getSession();

		String item_seq = req.getParameter("item_seq");
		int ea = Integer.parseInt(req.getParameter("num"));
		String user_seq = (String) session.getAttribute("seq");

		CartDAO dao = new CartDAO();

		CartDTO dto = new CartDTO();
		dto.setItem_seq(item_seq);
		dto.setEa(ea);

		int result = dao.cartAdd(dto);

		if (result == 1) {

			String cart_seq = dao.getCartSeq();

			result = dao.addUserCart(user_seq, cart_seq);

			if (result == 1) {
				JSONObject obj = new JSONObject();
				obj.put("result", result);

				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				PrintWriter writer = resp.getWriter();
				writer.print(obj.toString());
				writer.close();
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('cart failed'); history.back(); </script>");
				writer.close();
			}
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('cart failed'); history.back(); </script>");
			writer.close();
		}

	}

}