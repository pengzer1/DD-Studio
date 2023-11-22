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
 * 회원가입을 처리하는 서블릿 클래스입니다.
 * 회원 정보를 입력받아 등록하고, 성공 시 회원가입 환영 페이지로 이동합니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/user/register.do")
public class Register extends HttpServlet {

	/**
	 * 회원가입 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원가입 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/register.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * 회원 정보를 입력받아 등록하는 POST 메서드입니다.
	 * 회원 등록 성공 시 회원가입 환영 페이지로 이동하고, 실패 시 에러 알림창을 띄웁니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			// 회원 정보
			String email = req.getParameter("email");
	        String pw = req.getParameter("pw");
	        String name = req.getParameter("name");
	        String birth = req.getParameter("birth");
	        String tel = req.getParameter("tel");
	        String address;
	        
	        // 주소 처리
	        if (req.getParameter("post-code").trim().isEmpty()) {
		        address = "default"; //주소를 입력하지 않은 경우 (미기재)
	        } else {
		        String postCode = req.getParameter("post-code").trim();
		        String addressBasis = req.getParameter("address-basis").trim();
		        String addressDetail = req.getParameter("address-detail").trim();
		        address = postCode + " " + addressBasis + " " + addressDetail;
	        }
	        
			UserDTO dto = new UserDTO();

			dto.setEmail(email);
			dto.setPw(pw);
			dto.setName(name);
			dto.setBirth(birth);
			dto.setTel(tel);
	        dto.setAddress(address);
			
			UserDAO dao = new UserDAO();

			// 회원 등록
			int result = dao.register(dto);

			// 회원 등록 성공 시 환영 페이지로 이동
			if (result == 1) {
				resp.sendRedirect("/ddstudio/user/registerwelcome.do");
				return;
			}

		} catch (Exception e) {
			System.out.println("Register.doPost()");
			e.printStackTrace();
		}

		// 0 또는 에러
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed');history.back();</script>");
		writer.close();
	}
}
