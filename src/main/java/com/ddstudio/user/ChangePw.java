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

/**
 * 비밀번호 변경 기능을 담당하는 서블릿 클래스입니다.
 * 사용자가 입력한 이메일, 연락처, 비밀번호 정보를 처리하여 인증번호 확인 및 비밀번호 변경을 수행합니다.
 * 
 * @author 이승원
 */
@WebServlet("/user/changepw.do")
public class ChangePw extends HttpServlet {

	/**
	 * 비밀번호 변경 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 비밀번호 변경 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/change-pw.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * POST 메서드로 전송된 요청을 처리하여 인증번호 확인 및 비밀번호 변경을 수행합니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
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
