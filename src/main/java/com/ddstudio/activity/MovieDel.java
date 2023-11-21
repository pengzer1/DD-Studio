package com.ddstudio.activity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/moviedel.do")
public class MovieDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MovieDel.java
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/del.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//- tblMovieHashtag 삭제
		//- tblMoviePlay 삭제
		//- tblMovie 삭제

		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		int result = 0;
		
		//1. 영화해시태그 삭제
		//- 영화 해시태그가 기 존재하는지 확인(개수 확인)
		int cnt = dao.countMovieHashtag(seq);
		
		if (cnt > 0) { //기 존재 해시태그 삭제
			result = dao.delMovieHashtag(seq);
		
			if (result == 0) {
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('영화 해시태그 삭제에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		}
		//기 존재 해시태그 없는 경우 바로 다음 단계
		
		//2. 영화상영 테이블 삭제
		result = dao.delMoviePlay(seq);
		
		if (result == 1) {
			
			result = dao.delMovie(seq);
			
			if (result == 1) {
				
				resp.sendRedirect("/ddstudio/activity/movie.do");
				
			} else {
				
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('영화 테이블 삭제에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
			
		} else {
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('영화상영 테이블 삭제에 실패했습니다.');history.back();</script>");
			writer.close();
		}
		
		
	
	
	}
}