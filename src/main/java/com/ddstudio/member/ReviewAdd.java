package com.ddstudio.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ddstudio.member.repository.ReviewDAO;

@WebServlet("/member/review/add.do")
public class ReviewAdd extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/review/add.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// ReviewAdd.java

		String email = req.getSession().getAttribute("email").toString();

		// 폼으로부터 전송된 데이터 받기
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");

		// 리뷰 테이블에 추가하는 DAO 호출
		ReviewDAO dao = new ReviewDAO();
		
	/*	int user_book_seq = dao.seqGet(email); //select user_book_seq from 회원/예매 where ticket_book_seq = 2
		
		boolean success = dao.add(subject, content, user_book_seq);
		
		req.setAttribute("dto", dto);

		if (success) {
			// 성공했을 경우 다시 리뷰 목록 페이지로 이동
			resp.sendRedirect("/ddstudio/member/review/info.do");
		} else {
			// 실패했을 경우 JavaScript alert 창을 띄우고 이전 페이지로 이동
			   resp.setContentType("text/html;charset=UTF-8");
			   PrintWriter out = resp.getWriter();
			   out.println("<script>alert('리뷰 작성에 실패했습니다.');</script>");
			   out.println("history.back();");
			   out.close();
			
		}
	}*/
	}
}