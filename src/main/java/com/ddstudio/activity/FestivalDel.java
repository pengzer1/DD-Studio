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

@WebServlet("/activity/festivaldel.do")
public class FestivalDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//FestivalDel.java
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/del.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		int result = dao.delFestival(seq);
		
		if (result == 1) {
			
			result = dao.changeFestivalLocation(seq);
			
			if (result == 1) {
				
				result = dao.delFestivalImg(seq);
				
				if (result > 0) {
					
					result = dao.delFestivalHashtag(seq);
					
					if (result > 0) {
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Successfully deleted!'); location.href='/ddstudio/activity/festival.do';</script>");
						writer.close();
						
					} else {
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Del FestivalHashtag failed'); history.back();</script>");
						writer.close();
						
					}
					
				} else {
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Del FestivalImg failed'); history.back();</script>");
					writer.close();
					
				}
				
			} else {
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('Change FestivalLocation failed'); history.back();</script>");
				writer.close();
				
			}
			
		} else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('delFestival failed'); history.back();</script>");
			writer.close();
			
		}
	
	
	
	
	}
}