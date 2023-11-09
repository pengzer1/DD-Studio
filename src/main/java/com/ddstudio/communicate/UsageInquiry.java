package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.communicate.repository.CommuDAO;
import com.test.ajax.repository.AjaxDAO;

@WebServlet("/communicate/usageinquiry.do")
public class UsageInquiry extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String email = (String)session.getAttribute("email");
		String lv = (String)session.getAttribute("lv");

		CommuDAO dao = new CommuDAO();
		
		String name = dao.getName(email);

		if (lv.equals("1")) {
			
			resp.sendRedirect("/ddstudio/communicate/usageinquiryadd.do?name=" + name);

		} else if (lv.equals("2")) {

			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/usage-inquiry/list.jsp");

			dispatcher.forward(req, resp);
		    
		}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		
		AjaxDAO dao = new AjaxDAO();
		
		int result = dao.check(id);

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{\"result\": %d}", result);
		
		writer.close();

	}

}
