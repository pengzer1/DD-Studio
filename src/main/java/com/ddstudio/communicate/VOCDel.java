package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/vocdel.do")
public class VOCDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/voc/del.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		CommuDAO dao = new CommuDAO();
		
		int result = dao.deleteVOC(seq);
		
		if (result == 1) {
			
			resp.sendRedirect("/ddstudio/communicate/voc.do");
			
		} else {
			
			PrintWriter writer = resp.getWriter();
			
			writer.println("<script>");
			writer.println("alert('failed');");
			writer.println("history.back();");
			writer.println("</script>");
			
			writer.close();
			
		}
		
	}

}
