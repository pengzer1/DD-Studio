package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.VOCDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/vocanswer.do")
public class VOCAnswer extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String answer = req.getParameter("answer");
		String action = req.getParameter("action");
		
		req.setAttribute("seq", seq);
		req.setAttribute("answer", answer);
		req.setAttribute("action", action);
		
		this.doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String answer = req.getParameter("answer");
		String action = req.getParameter("action");

		VOCDTO dto = new VOCDTO();
		
		dto.setVoc_seq(seq);
		dto.setAnswer(answer);
		
		CommuDAO dao = new CommuDAO();
		
		int result = 0;
		
		result = dao.updateVOCAnswer(action, dto);
		
		if (result == 1) {
			
			if (action.equals("add") || action.equals("edit")) {
				
				resp.sendRedirect("/ddstudio/communicate/vocdetail.do?seq=" + seq);
				
			} else {
				
				resp.sendRedirect("/ddstudio/communicate/voc.do");
				
			}
			
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
