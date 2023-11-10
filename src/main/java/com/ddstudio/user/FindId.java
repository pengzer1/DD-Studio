package com.ddstudio.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.user.repository.UserDAO;

@WebServlet("/user/findid.do")
public class FindId extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String tel = req.getParameter("tel");

		UserDAO dao = new UserDAO();
		int message = dao.findId(name, tel);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
	
		writer.printf("{ \"message\": %d }", message);
		writer.close();
		
	}
	
}