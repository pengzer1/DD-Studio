package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.repository.UserDAO;

/**
 * 회원탈퇴 재확인을 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/unregister/reconfirm.do")
public class ReUnregister extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//GoodBye.java
		
		String email = req.getSession().getAttribute("email").toString();
		
		UserDAO dao = new UserDAO();
		
		int result = dao.unregister(email);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/unregister/reconfirm.jsp");
		dispatcher.forward(req, resp);
	}
}
