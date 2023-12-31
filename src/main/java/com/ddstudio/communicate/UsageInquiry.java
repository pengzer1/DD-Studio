package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.communicate.model.InquiryDTO;
import com.ddstudio.communicate.repository.CommuDAO;

/**
 * UsageInquiry 서블릿은 사용자 레벨에 따라 문의사항을 처리하는 기능을 담당합니다.
 * 
 * @author 차수민
 */
@WebServlet("/communicate/usageinquiry.do")
public class UsageInquiry extends HttpServlet {

	/**
     * HTTP GET 요청을 처리하여 사용자 레벨에 따라 적절한 화면으로 이동합니다.
     * 
     * @param req  클라이언트의 HttpServletRequest 객체입니다.
     * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
     * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
     * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
     */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String lv = (String)session.getAttribute("lv");
		
		if (lv == null) {
			
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.println("<script>");
            writer.println("if (confirm('로그인 후 이용 가능합니다.\\n로그인 페이지로 이동하시겠습니까?')) {");
            writer.println("location.href='/ddstudio/user/login.do?';");
            writer.println("} else {");
            writer.println("history.back();");
            writer.println("}");
            writer.println("</script>");
			
			writer.close();
			
		}
		
		String email = (String)session.getAttribute("email");

		if (lv.equals("1")) {
			
			CommuDAO dao = new CommuDAO();
			
			InquiryDTO dto = dao.getUserInfo(email);
			
			req.setAttribute("seq", dto.getUser_seq());
			req.setAttribute("name", dto.getName());

			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/usage-inquiry/add.jsp");

			dispatcher.forward(req, resp);
			
		}
		
		if (lv.equals("2")) {
			
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

			int inquiriesPerPage = 10;

			int startIndex = ((currentPage - 1) * inquiriesPerPage) + 1;

			int endIndex = startIndex + inquiriesPerPage - 1;
			
			map.put("startIndex", String.format("%d", startIndex));
			map.put("endIndex", String.format("%d", endIndex));
			
			CommuDAO dao = new CommuDAO();
			
			ArrayList<InquiryDTO> list = dao.getInquiryList(map);
			
			for (InquiryDTO dto : list) {
				
				String subject = dto.getSubject();
				
				if (subject.length() > 25) {
					
					subject = subject.substring(0, 25) + " ...";
					
				}
				
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
			
			int totalInquiries = dao.getTotalInquiries(map);
			
			int totalPages = (int)Math.ceil((double)totalInquiries / inquiriesPerPage);
			
			if (pageNumber != 1) {
				
				sb.append(String.format("<a href='/ddstudio/communicate/usageinquiry.do?page=%d' id='previous-button'><span class='material-symbols-outlined'>navigate_before</span></a>", pageNumber - 1));
				
			}
			
			int loop = 1;
			
			while (!(loop > blockSize || pageNumber > totalPages)) {
				
				if (pageNumber == currentPage) {
					
					sb.append(String.format("<a href='#!' id='current-page'>%d</a>", pageNumber));
					
				} else {
					
					sb.append(String.format("<a href='/ddstudio/communicate/usageinquiry.do?page=%d' id='other-pages'>%d</a>", pageNumber, pageNumber));
					
				}
				
				loop++;
				pageNumber++;
				
			}
			
			if (pageNumber <= totalPages) {
				
				sb.append(String.format("<a href='/ddstudio/communicate/usageinquiry.do?page=%d' id='next-button'><span class='material-symbols-outlined'>navigate_next</span></a>", pageNumber));
				
			}

			req.setAttribute("list", list);
			
			req.setAttribute("map", map);

			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalInquiries", totalInquiries);
			req.setAttribute("totalPages", totalPages);

			req.setAttribute("pageBar", sb.toString());
				
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/usage-inquiry/list.jsp");

			dispatcher.forward(req, resp);
			
		}

	}

}
