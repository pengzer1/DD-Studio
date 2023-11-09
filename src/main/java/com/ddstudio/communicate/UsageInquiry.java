package com.ddstudio.communicate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/communicate/usageinquiry.do")
public class UsageInquiry extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String lv = (String)session.getAttribute("lv");

		if (lv.equals("2")) {
		    
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/usage-inquiry/list.jsp");

			dispatcher.forward(req, resp);
		    
		} else {

			resp.sendRedirect("/ddstudio/communicate/usageinquiryadd.do");
		    
		}

	}

}
