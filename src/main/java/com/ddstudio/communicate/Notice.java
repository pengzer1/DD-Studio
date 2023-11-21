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

import com.ddstudio.communicate.model.NoticeDTO;
import com.ddstudio.communicate.repository.CommuDAO;

/**
 * Notice 서블릿은 공지사항 관련 기능을 제공합니다.
 * 
 * @version 1.0
 */
@WebServlet("/communicate/notice.do")
public class Notice extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리하여 공지사항 목록을 조회하고 화면에 출력합니다.
	 * 
	 * @param req  클라이언트의 HttpServletRequest 객체입니다.
	 * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
	 * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
	 * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String category = req.getParameter("category");
		String word = req.getParameter("word");
		String searchStatus = "n";
		
		if ((category == null && word == null) || (category.equals("") && word.equals(""))) {
			
			searchStatus = "n";
			
		} else {
			
			searchStatus = "y";
			
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("category", category);
		map.put("word", word);
		map.put("searchStatus", searchStatus);
		
		int currentPage = 0;
		
		String page = req.getParameter("page");
		
		if (page == null || page.equals("")) {
			
			currentPage = 1;
			
		} else {
			
			currentPage = Integer.parseInt(page);
			
		}

		int postsPerPage = 10;

		int startIndex = ((currentPage - 1) * postsPerPage) + 1;

		int endIndex = startIndex + postsPerPage - 1;
		
		map.put("startIndex", String.format("%d", startIndex));
		map.put("endIndex", String.format("%d", endIndex));
		
		CommuDAO dao = new CommuDAO();
		
		ArrayList<NoticeDTO> list = dao.getNoticeList(map);
		
		for (NoticeDTO dto : list) {
			
			String subject = dto.getSubject();
			
			subject = subject.replace("<", "&lt;");
			subject = subject.replace(">", "&gt;");
			
			dto.setSubject(subject);
			
			String regdate = dto.getRegdate();
			
			regdate = regdate.substring(0, 10);
			
			dto.setRegdate(regdate);
			
		}

		int blockSize = 5;

		int pageNumber = ((currentPage - 1) / blockSize) * blockSize + 1;
		
		StringBuilder sb = new StringBuilder();
		
		int totalPosts = dao.getTotalPosts(map);
		
		int totalPages = (int)Math.ceil((double)totalPosts / postsPerPage);
		
		if (pageNumber != 1) {
			
			sb.append(String.format("<a href='/ddstudio/communicate/notice.do?page=%d' id='previous-button'><span class='material-symbols-outlined'>navigate_before</span></a>", pageNumber - 1));
			
		}
		
		int loop = 1;
		
		while (!(loop > blockSize || pageNumber > totalPages)) {
			
			if (pageNumber == currentPage) {
				
				sb.append(String.format("<a href='#!' id='current-page'>%d</a>", pageNumber));
				
			} else {
				
				sb.append(String.format("<a href='/ddstudio/communicate/notice.do?page=%d' id='other-pages'>%d</a>", pageNumber, pageNumber));
				
			}
			
			loop++;
			pageNumber++;
			
		}
		
		if (pageNumber <= totalPages) {
			
			sb.append(String.format("<a href='/ddstudio/communicate/notice.do?page=%d' id='next-button'><span class='material-symbols-outlined'>navigate_next</span></a>", pageNumber));
			
		}

		req.setAttribute("list", list);
		
		req.setAttribute("map", map);

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPosts", totalPosts);
		req.setAttribute("totalPages", totalPages);

		req.setAttribute("pageBar", sb.toString());
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/notice/list.jsp");

		dispatcher.forward(req, resp);

	}

}
