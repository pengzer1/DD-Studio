package com.ddstudio.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.user.repository.UserDAO;

/**
 * 이메일 중복 검사 기능을 수행하는 서블릿 클래스입니다.
 * 사용자가 입력한 이메일이 이미 등록되어 있는지 확인합니다.
 * 
 * @author 이승원
 */
@WebServlet("/user/duplicatecheck.do")
public class DuplicateCheck extends HttpServlet {

	/**
	 * POST 메서드로 전송된 요청을 처리하여 이메일 중복 여부를 검사합니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email"); // 아이디 (이메일)
		
		UserDAO dao = new UserDAO();
		
		// 이메일 중복 검사
		int message = dao.check(email);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
	
		// 중복 여부 메시지
		writer.printf("{ \"message\": %d }", message);
		writer.close();
	}
}
