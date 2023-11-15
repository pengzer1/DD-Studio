package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.FAQDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/faqedit.do")
public class FAQEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		CommuDAO dao = new CommuDAO();
		
		FAQDTO dto = dao.getFAQ(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/faq/edit.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			String seq = req.getParameter("seq");
			String type = req.getParameter("type");
			String question = req.getParameter("question");
			String answer = req.getParameter("answer");
	
			FAQDTO dto = new FAQDTO();

			dto.setFaq_seq(seq);
			dto.setType(type);
			dto.setQuestion(question);
			dto.setAnswer(answer);
			
			CommuDAO dao = new CommuDAO();
			
			int result = dao.editFAQ(dto);
	
			if (result == 1) {
					
				resp.sendRedirect("/ddstudio/communicate/faq.do?type=" + URLEncoder.encode(type, "UTF-8"));
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
			
		PrintWriter writer = resp.getWriter();
		
		writer.println("<script>");
		writer.println("alert('failed');");
		writer.println("history.back();");
		writer.println("</script>");
		
		writer.close();
		
	}

}
