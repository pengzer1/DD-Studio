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

@WebServlet("/user/changepw.do")
public class ChangePw extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 비밀번호 변경 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/change-pw.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		String email = req.getParameter("email"); // 아이디 (이메일)
		String tel = req.getParameter("tel"); // 연락처
		String pw = req.getParameter("pw"); // 비밀번호

		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		if (pw == null || pw.trim().isEmpty()) {
			// 인증번호 확인
			dto.setEmail(email);
			dto.setTel(tel);
			
			int cnt = dao.isFindPw(dto);
		
			writer.printf("{ \"cnt\": %d }", cnt);
		} else {
			// 비밀번호 변경
			dto.setEmail(email);
			dto.setPw(pw);
			
			int message = dao.changePw(dto);
			
			writer.printf("{ \"message\": %d }", message);
		}
		
		writer.close();
	}
	
}