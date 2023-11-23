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

/**
 * FAQEdit 서블릿은 FAQ를 수정하는 기능을 처리합니다.
 * 
 * @author 차수민
 */
@WebServlet("/communicate/faqedit.do")
public class FAQEdit extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리하여 수정할 FAQ의 정보를 가져와 수정 페이지로 포워딩합니다.
	 * 
	 * @param req  클라이언트의 HttpServletRequest 객체입니다.
	 * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
	 * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
	 * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		CommuDAO dao = new CommuDAO();
		
		FAQDTO dto = dao.getFAQ(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/faq/edit.jsp");

		dispatcher.forward(req, resp);

	}
	
	/**
	 * HTTP POST 요청을 처리하여 FAQ를 수정합니다.
	 * 
	 * @param req  클라이언트의 HttpServletRequest 객체입니다.
	 * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
	 * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
	 * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
	 */
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
