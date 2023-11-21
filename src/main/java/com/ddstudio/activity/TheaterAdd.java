package com.ddstudio.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.TheaterDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/theateradd.do")
public class TheaterAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//TheaterAdd.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/theateradd.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		
		ActDAO dao = new ActDAO();
		
		TheaterDTO dto = new TheaterDTO();
		
		dto.setName(name);
		dto.setLat(lat);
		dto.setLng(lng);
		
		//1. 동일한 위치 탐색하여 없으면 위치 테이블에 추가
		int result = dao.addLocation(lat, lng);
		
		if (result == 1) { //위치 추가 성공
			
			String location_seq = dao.getLocationSeq(lat, lng);
			dto.setLocation_seq(location_seq);
			
			//2. 영화관 테이블에 추가
			result = dao.addTheater(dto);
			
			if (result == 1) { //영화관 테이블 추가 성공
				
				//**최종 등록 성공!!!!!**
				resp.sendRedirect("/ddstudio/activity/movie.do");
				
				
			} else { //영화관 테이블 추가 실패
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('영화관 테이블 등록에 실패했습니다.');history.back();</script>");
				writer.close();
			}
			
		} else { //위치 추가 실패
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('동일한 위치에 장소가 존재합니다. 다른 위치를 선택해주세요.');history.back();</script>");
			writer.close();
		}
	
	
	}
}