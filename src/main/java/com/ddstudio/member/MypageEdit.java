package com.ddstudio.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.MypageEditDTO;
import com.ddstudio.member.repository.MypageEditDAO;

/**
 * 회원정보 수정을 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/mypage/edit.do")
public class MypageEdit extends HttpServlet {

	/**
	 * 회원정보를 출력하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// MypageEdit.java

		// 1.

		String email = req.getSession().getAttribute("email").toString();

		// 2.
		MypageEditDAO dao = new MypageEditDAO();

		MypageEditDTO dto = dao.get(email);

		// 3.
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/mypage/edit.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * POST 메서드로 전송된 요청을 처리하여 회원정보 수정을 수행합니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1.
		String email = req.getSession().getAttribute("email").toString();
		
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String birth = req.getParameter("birth");

		// 2.
		MypageEditDAO dao = new MypageEditDAO();

		MypageEditDTO dto = new MypageEditDTO();
		dto.setName(name);
		dto.setBirth(birth);
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setEmail(email);
		
//		System.out.println(name);
//		System.out.println(birth);
//		System.out.println(tel);
//		System.out.println(address);

		int result = dao.edit(dto);

		// 3.
		if (result == 1) {

			resp.sendRedirect("/ddstudio/member/mypage/info.do");

		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}

	}

}