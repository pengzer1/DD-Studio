package com.ddstudio.communicate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.VOCDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/vocdetail.do")
public class VOCDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		CommuDAO dao = new CommuDAO();

		VOCDTO dto = dao.getVOC(seq);
		
		String subject = dto.getSubject();
		
		subject = subject.replace("<", "&lt;");
		subject = subject.replace(">", "&gt;");
		
		dto.setSubject(subject);
		
		String content = dto.getContent();
		
		if (content != null) {
			
		    content = content.replace("<", "&lt;");
		    content = content.replace(">", "&gt;");
		    
		    content = content.replace("\r\n", "<br>");

		    dto.setContent(content);
		    
		} else {
			
		    dto.setContent("");
		    
		}
		
		String visitDate = dto.getRegdate();
		
		visitDate = visitDate.substring(0, 10);
		
		dto.setVisit_date(visitDate);

		String regdate = dto.getRegdate();
		
		regdate = regdate.substring(0, 10);
		
		dto.setRegdate(regdate);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/voc/detail.jsp");

		dispatcher.forward(req, resp);

	}

}
