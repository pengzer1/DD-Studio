package com.ddstudio.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 사용자 로그아웃을 처리하는 서블릿 클래스입니다.
 * 사용자의 세션에서 인증 티켓을 제거하고, 메인 페이지로 이동합니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/user/logout.do")
public class Logout extends HttpServlet {

	/**
	 * 로그아웃을 처리하는 GET 메서드입니다.
	 * 사용자의 세션에서 인증 티켓을 제거하고, 메인 페이지로 이동합니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 인증 티켓 제거
		req.getSession().removeAttribute("email");
		req.getSession().removeAttribute("seq");
		req.getSession().removeAttribute("name");
		req.getSession().removeAttribute("lv");
		
		resp.sendRedirect("/ddstudio/index.do");
	}

}
