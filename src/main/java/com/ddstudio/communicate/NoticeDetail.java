package com.ddstudio.communicate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.NoticeDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/notice/detail.do")
public class NoticeDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		CommuDAO dao = new CommuDAO();
		
		NoticeDTO dto = dao.getNotice(seq);
		
		String subject = dto.getSubject();
		
		subject = subject.replace("<", "&lt;");
		subject = subject.replace(">", "&gt;");
		
		dto.setSubject(subject);
		
		String content = dto.getContent();

		content = content.replace("<", "&lt;");
		content = content.replace(">", "&gt;");
		
		content = content.replace("\n", "<br>");
		
		dto.setContent(content);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/notice/detail.jsp");

		dispatcher.forward(req, resp);

	}

}
