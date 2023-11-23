package com.ddstudio.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.member.model.UserCartDTO;
import com.ddstudio.member.repository.UserCartDAO;

/**
 * 상품 구매를 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/purchase/view.do")
public class Purchase extends HttpServlet {

	/**
	 * POST 메서드로 전송된 요청을 처리하여 상품 구매를 수행합니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Purchase.java
		HttpSession session = req.getSession();

		String name = (String) session.getAttribute("name");
		String email = (String) session.getAttribute("email");

		String item_seq = req.getParameter("item_seq");
		String itemName = req.getParameter("name");
		String ea = req.getParameter("num");
		String price = req.getParameter("price");

		int totalPrice = 0;

		String[] user_cart_seq = req.getParameterValues("reservationCheckbox");

		UserCartDAO dao = new UserCartDAO();

		ArrayList<UserCartDTO> list = dao.getSelectCart(email, user_cart_seq);

		if (list != null) {
			for (UserCartDTO dto : list) {

				totalPrice += Integer.parseInt(dto.getPrice()) * Integer.parseInt(dto.getEa());

			}
		}

		UserCartDTO dto = new UserCartDTO();

		dto.setItem_seq(item_seq);
		dto.setName(itemName);
		dto.setEa(ea);
		dto.setPrice(price);

		if (list == null) {
			totalPrice = Integer.parseInt(dto.getPrice()) * Integer.parseInt(dto.getEa());
		}

		req.setAttribute("name", name);
		req.setAttribute("email", email);
		req.setAttribute("totalPrice", totalPrice);

		req.setAttribute("list", list);
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/purchase/view.jsp");
		dispatcher.forward(req, resp);
	}
}
