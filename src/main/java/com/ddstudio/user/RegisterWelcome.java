package com.ddstudio.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 회원가입 환영 페이지로 이동하는 서블릿 클래스입니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/user/registerwelcome.do")
public class RegisterWelcome extends HttpServlet {

	/**
	 * 회원가입 환영 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원가입 환영 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/register-welcome.jsp");
		dispatcher.forward(req, resp);
	}

}
