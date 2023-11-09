package com.ddstudio.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.user.repository.UserDAO;

@WebServlet("/user/duplicatecheck.do")
public class DuplicateCheck extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		UserDAO dao = new UserDAO();
		
		//System.out.println(email);
		
		int message = dao.check(email);

		//System.out.println(message);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
	
		writer.printf("{ \"message\": %d }", message);
		
		writer.close();
		
	}

}