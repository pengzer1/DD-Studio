package com.ddstudio.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.user.model.UserDTO;
import com.ddstudio.user.repository.UserDAO;

/*
 * 사용자 로그인을 처리하는 서블릿 클래스입니다.
 * 사용자가 입력한 이메일과 비밀번호 정보를 확인하여 로그인 여부를 판단하고, 로그인에 성공하면 세션에 사용자 정보를 저장한 후 메인 페이지로 이동합니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/user/login.do")
public class Login extends HttpServlet {

	/**
	 * 로그인 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/login.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * POST 메서드로 전송된 로그인 요청을 처리합니다.
	 * 사용자가 입력한 이메일과 비밀번호를 확인하여 로그인 여부를 판단하고, 로그인에 성공하면 세션에 사용자 정보를 저장한 후 메인 페이지로 이동합니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email"); // 이메일 (아이디)
		String pw = req.getParameter("pw"); // 비밀번호

		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();

		dto.setEmail(email);
		dto.setPw(pw);

		// 로그인
		UserDTO result = dao.login(dto);

		if (result != null) {
			// 로그인 성공
			// 인증 티켓 발급 (세션에 정보 저장)
			req.getSession().setAttribute("email", email);
			req.getSession().setAttribute("seq", result.getUser_seq());
			req.getSession().setAttribute("name", result.getName());
			req.getSession().setAttribute("lv", result.getLv());

			resp.sendRedirect("/ddstudio/index.do");

		} else {
			// 로그인 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
	}
}
