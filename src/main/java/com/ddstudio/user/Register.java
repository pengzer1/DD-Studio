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
			MultipartRequest multi = new MultipartRequest(req,
					req.getRealPath("/asset/pic"), 
					1024 * 1024 * 10,
					"UTF-8",
					new DefaultFileRenamePolicy());
	
			String email = multi.getParameter("email");
			String pw = multi.getParameter("pw");
			String name = multi.getParameter("name");
			String birth = multi.getParameter("birth");
			String tel = multi.getParameter("tel");
			String address = multi.getParameter("post-code") + " " + multi.getParameter("address-basis") + " " + multi.getParameter("address-detail");
		
			UserDTO dto = new UserDTO();
	
			dto.setEmail(email);
			dto.setPw(pw);
			dto.setName(name);
			dto.setBirth(birth);
			dto.setTel(tel);
			dto.setAddress(address);
			
			System.out.println(email);
			System.out.println(pw);
			System.out.println(name);
			System.out.println(birth);
			System.out.println(tel);
			System.out.println(address);
			
			UserDAO dao = new UserDAO();
			
			int result = dao.register(dto);
			
			if (result == 1) {
				resp.sendRedirect("/ddstudio/index.do");
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