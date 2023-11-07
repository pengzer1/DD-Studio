package com.ddstudio.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/logout.do")
public class Logout extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//인증 티켓 제거
		req.getSession().removeAttribute("email");
		req.getSession().removeAttribute("name");
		req.getSession().removeAttribute("lv");
		
		resp.sendRedirect("/ddstudio/index.do");
		
	}

}