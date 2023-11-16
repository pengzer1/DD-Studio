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

		//페스티벌 삭제 처리
		//0. 페스티벌 위치 정보 삭제 > 0으로 변경
		//1. 페스티벌 이미지 삭제
		//2. 페스티벌/해시태그 삭제
		//3. 페스티벌 삭제 > 페스티벌명 + (공연중단)
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		//0. 페스티벌 위치 정보 삭제 > 0으로 변경
		int result = dao.changeFestivalLocation(seq);
		
		if (result == 1) { //페스티벌 위치 정보 삭제 성공
			
			//1. 페스티벌 이미지 삭제
			result = dao.delFestivalImg(seq);
			
			if (result > 0) { //이미지 삭제 성공
				
				//2. 페스티벌/해시태그 삭제
				result = dao.delFestivalHashtag(seq);
				
				if (result > 0) { //페스티벌/해시태그 삭제 성공
					
					//3. 페스티벌 삭제 > 페스티벌명 + (공연중단)
					result = dao.delFestival(seq);
					
					if (result == 1) { //페스티벌 삭제 성공
						
						resp.sendRedirect("/ddstudio/activity/festival.do");
						
					} else { //페스티벌 삭제 실패
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Delete festival failed'); history.back();</script>");
						writer.close();
						
					}
					
				} else { //페스티벌/해시태그 삭제 실패
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Delete festival hashtag failed'); history.back();</script>");
					writer.close();
					
				}
				
				
				
			} else { //이미지 삭제 실패
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('Delete festival images failed'); history.back();</script>");
				writer.close();
				
			}
		
		} else { //페스티벌 위치 정보 삭제 실패
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('Delete festival location failed'); history.back();</script>");
			writer.close();
		}
		
	}
}