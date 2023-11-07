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

@WebServlet("/user/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/login.jsp");
		dispatcher.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1.
		String email = req.getParameter("email"); 
		String pw = req.getParameter("pw");
		
		//2.
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		dto.setEmail(email);
		dto.setPw(pw);
		
		UserDTO result = dao.login(dto);
		
		if (result != null) {
			//로그인 성공
			//인증 티켓 발급
			req.getSession().setAttribute("email", email);
			req.getSession().setAttribute("name", result.getName());
			req.getSession().setAttribute("lv", result.getLv());
			
			resp.sendRedirect("/ddstudio/index.do");
			
		} else {
			//로그인 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
	}
}