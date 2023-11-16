package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.FAQDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/faqadd.do")
public class FAQAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/faq/add.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String type = req.getParameter("type");
			String question = req.getParameter("question");
			String answer = req.getParameter("answer");
			
			FAQDTO dto = new FAQDTO();

			dto.setType(type);
			dto.setQuestion(question);
			dto.setAnswer(answer);
			
			CommuDAO dao = new CommuDAO();
			
			int result = dao.addFAQ(dto);
			
			if (result == 1) {
				
				resp.sendRedirect("/ddstudio/communicate/faq.do");
				
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
