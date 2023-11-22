package com.ddstudio.activity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.model.TheaterDTO;
import com.ddstudio.activity.repository.ActDAO;

/**
 * 영화관을 수정하는 기능을 담당하는 서블릿 클래스입니다.
 * 영화관 정보를 데이터베이스에 수정합니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/theateredit.do")
public class TheaterEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//TheaterEdit.java
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		TheaterDTO dto = dao.getTheater(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("seq", seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/theateredit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		
		ActDAO dao = new ActDAO();
		
		TheaterDTO dto = new TheaterDTO();
		
		dto.setTheater_seq(seq);
		dto.setName(name);
		dto.setLat(lat);
		dto.setLng(lng);
		
		//1. 기존 위치 번호 가져와서 위치 정보 수정하기
		LocationDTO location_dto = dao.getTheaterLocation(seq);
		
		String location_seq = location_dto.getLocation_seq();
		dto.setLocation_seq(location_seq);
		
		//NEW 위치로 덮어주기
		location_dto.setLat(lat);
		location_dto.setLng(lng);
		
		int result = dao.updateLocation(location_dto);
		
		if (result == 1) {
			
			result = dao.editTheater(dto);
			
			if (result == 1) {
				
				resp.sendRedirect("/ddstudio/activity/theater.do");
				
				
			} else {
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('영화관 정보 수정에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
			
		} else {
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('위치 수정에 실패했습니다.');history.back();</script>");
			writer.close();
			
		}
		
				
	
	
	}
}
