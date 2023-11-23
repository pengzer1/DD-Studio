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

/**
 * 영화관을 삭제하는 기능을 담당하는 서블릿 클래스입니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/theaterdel.do")
public class TheaterDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//TheaterDel.java
		
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/theaterdel.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		//영화관 삭제 작업 > (운영종료) 처리, 위치정보 0으로 변경
		
		ActDAO dao = new ActDAO();
		
		int result = dao.delTheater(seq);
		
		if (result == 1) { //삭제 성공
			
			resp.sendRedirect("/ddstudio/activity/theater.do");
			
		} else { //삭제 실패
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('영화관 삭제에 실패했습니다.');history.back();</script>");
			writer.close();
			
		}
	
	}
}
