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
	        String address;
	        
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
			
	        /*
	        System.out.println(email); 
	        System.out.println(pw);
	        System.out.println(name);
			System.out.println(birth);
			System.out.println(tel);
	        System.out.println(address);
	        */

			UserDAO dao = new UserDAO();

			int result = dao.register(dto);

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