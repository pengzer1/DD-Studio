package com.ddstudio.communicate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.FAQDTO;
import com.ddstudio.communicate.model.NoticeDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/faq.do")
public class FAQ extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type = req.getParameter("type");

		String word = req.getParameter("word");
		String searchStatus = "n";
		
		if (word == null || word.equals("")) {
			
			searchStatus = "n";
			
		} else {
			
			searchStatus = "y";
			
		}
		
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("type", type);
		
		map.put("word", word);
		map.put("searchStatus", searchStatus);
		
		int currentPage = 0;
		
		String page = req.getParameter("page");
		
		if (page == null || page.equals("")) {
			
			currentPage = 1;
			
		} else {
			
			currentPage = Integer.parseInt(page);
			
		}

		int faqPerPage = 10;

		int startIndex = ((currentPage - 1) * faqPerPage) + 1;

		int endIndex = startIndex + faqPerPage - 1;
		
		map.put("startIndex", String.format("%d", startIndex));
		map.put("endIndex", String.format("%d", endIndex));
		
		CommuDAO dao = new CommuDAO();
		
		ArrayList<FAQDTO> list = dao.getFAQList(map);
		
		for (FAQDTO dto : list) {
			
			String question = dto.getQuestion();
			
			question = question.replace("<", "&lt;");
			question = question.replace(">", "&gt;");
			
			dto.setQuestion(question);
			
			String answer = dto.getAnswer();
			
			answer = answer.replace("<", "&lt;");
			answer = answer.replace(">", "&gt;");
			
			dto.setAnswer(answer);
			
		}

		int blockSize = 5;

		int pageNumber = ((currentPage - 1) / blockSize) * blockSize + 1;
		
		StringBuilder sb = new StringBuilder();
		
		int totalFAQ = dao.getTotalFAQ(map);
		
		int totalPages = (int)Math.ceil((double)totalFAQ / faqPerPage);
		
		if (pageNumber != 1) {
			
			sb.append(String.format("<a href='/ddstudio/communicate/faq.do?page=%d&type=%s' id='previous-button'><span class='material-symbols-outlined'>navigate_before</span></a>", pageNumber - 1, type));
			
		}
		
		int loop = 1;
		
		while (!(loop > blockSize || pageNumber > totalPages)) {
			
			if (pageNumber == currentPage) {
				
				sb.append(String.format("<a href='#!' id='current-page'>%d</a>", pageNumber));
				
			} else {
				
				sb.append(String.format("<a href='/ddstudio/communicate/faq.do?page=%d&type=%s' id='other-pages'>%d</a>", pageNumber, type, pageNumber));
				
			}
			
			loop++;
			pageNumber++;
			
		}
		
		if (pageNumber <= totalPages) {
			
			sb.append(String.format("<a href='/ddstudio/communicate/faq.do?page=%d&type=%s' id='next-button'><span class='material-symbols-outlined'>navigate_next</span></a>", pageNumber, type));
			
		}

		req.setAttribute("list", list);
		
		req.setAttribute("map", map);

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalFAQ", totalFAQ);
		req.setAttribute("totalPages", totalPages);

		req.setAttribute("pageBar", sb.toString());

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/faq/list.jsp");

		dispatcher.forward(req, resp);

	}

}
