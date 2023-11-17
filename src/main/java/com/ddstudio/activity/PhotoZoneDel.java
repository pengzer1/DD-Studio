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

@WebServlet("/activity/photozone/del.do")
public class PhotoZoneDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PhotoZoneDel.java
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/photozone/del.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//포토존 삭제 처리
		//1. 포토존 이미지 삭제
		//2-1. 포토존 위치 정보 삭제 > 0으로 변경
		//2-2. 포토존 삭제 > 포토존명 + (운영중단)
		
		ActDAO dao = new ActDAO();
		int result = 0;
		
		String seq = req.getParameter("seq");
		
		System.out.println("Photozone seq: " + seq);
		
		//1. 포토존 이미지 삭제
		//- 포토존 이미지가 기 존재하는지 확인(개수 확인)
		int cnt = dao.countPhotozoneImg(seq);
		
		System.out.println((cnt > 0 ? "이미지 존재" : "이미지 존재X"));
		
		if (cnt > 0) { //기 존재 이미지 삭제
			
			result = dao.delPhotozoneImg(seq);
			
			System.out.println("기존 포토존 이미지 삭제 완료");
			
			if (result == 0) {
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('포토존 이미지 삭제에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		}

		//3-1. 포토존 위치 정보 삭제 > 0으로 변경
		//3-2. 포토존 삭제 > 포토존명 + (운영중단)
		result = dao.delPhotozone(seq);
		
		if (result == 1) { //포토존 삭제(정보 변경) 성공
			
			//**최종 삭제 성공!!!!!**
			resp.sendRedirect("/ddstudio/activity/photozone.do");
			
		} else { //포토존 삭제(정보 변경) 실패
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('포토존 테이블에서 삭제 실패했습니다.');history.back();</script>");
			writer.close();
			
		}
		
		
	}
}
