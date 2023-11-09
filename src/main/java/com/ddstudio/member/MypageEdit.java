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

@WebServlet("/member/mypage/edit.do")
public class MypageEdit extends HttpServlet {

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

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1.
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

		int result = dao.edit(dto);

		// 3.
		if (result == 1) {

			resp.sendRedirect("/ddstudio/member/mypage.do");

		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}

	}

}