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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/user/register.do")
public class Register extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/register.jsp");
		dispatcher.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String email = req.getParameter("email");
	        String pw = req.getParameter("pw");
	        String name = req.getParameter("name");
	        String birth = req.getParameter("birth");
	        String tel = req.getParameter("tel");
	        
			UserDTO dto = new UserDTO();

			dto.setEmail(email);
			dto.setPw(pw);
			dto.setName(name);
			dto.setBirth(birth);
			dto.setTel(tel);

			/*
			 * System.out.println(email); System.out.println(pw); System.out.println(name);
			 * System.out.println(birth); System.out.println(tel);
			 */
			
			// 주소 정보를 입력한 경우에만 데이터 삽입
	        if (req.getParameter("post-code") != null) {
		        String postCode = req.getParameter("post-code");
		        String addressBasis = req.getParameter("address-basis");
		        String addressDetail = req.getParameter("address-detail");
		        String address = postCode + " " + addressBasis + " " + addressDetail;
				
		        dto.setAddress(address);
				
		        System.out.println(address);
	        }

			UserDAO dao = new UserDAO();

			int result = dao.register(dto);

			if (result == 1) {
				resp.sendRedirect("/ddstudio/user/register-welcome.do");
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