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
		//1. 페스티벌/해시태그 삭제
		//2. 페스티벌 이미지 삭제
		//3-1. 페스티벌 위치 정보 삭제 > 0으로 변경
		//3-2. 페스티벌 삭제 > 페스티벌명 + (공연중단)
		ActDAO dao = new ActDAO();
		int result = 0;
		
		String seq = req.getParameter("seq");
		
		System.out.println("Festival seq: " + seq);
		
		//1. 페스티벌/해시태그 삭제
		//- 페스티벌 해시태그가 기 존재하는지 확인(개수 확인)
		int cnt = dao.countFestivalHashtag(seq);
		
		System.out.println((cnt > 0? "해시태그 존재" : "해시태그 존재X"));
		
		if (cnt > 0) { //기 존재 해시태그 삭제
			result = dao.delFestivalHashtag(seq);
			
			System.out.println("기존 페스티벌 해시태그 삭제 완료");
			
			if (result == 0) {
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('페스티벌 해시태그 삭제에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		}
		//기 존재 해시태그 없는 경우 바로 다음 단계
		//2. 페스티벌 이미지 삭제
		//- 페스티벌 이미지가 기 존재하는지 확인(개수 확인)
		cnt = dao.countFestivalImg(seq);
		
		System.out.println((cnt > 0 ? "이미지 존재" : "이미지 존재X"));
		
		if (cnt > 0) { //기 존재 이미지 삭제
			
			result = dao.delFestivalImg(seq);
			
			System.out.println("기존 페스티벌 이미지 삭제 완료");
			
			if (result == 0) {
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('페스티벌 이미지 삭제에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		}

		//3-1. 페스티벌 위치 정보 삭제 > 0으로 변경
		//3-2. 페스티벌 삭제 > 페스티벌명 + (공연중단)
		result = dao.delFestival(seq);
		
		if (result == 1) { //페스티벌 삭제(정보 변경) 성공
			
			//**최종 삭제 성공!!!!!**
			resp.sendRedirect("/ddstudio/activity/festival.do");
			
		} else { //페스티벌 삭제(정보 변경) 실패
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('페스티벌 테이블에서 삭제 실패했습니다.');history.back();</script>");
			writer.close();
			
		}
		
	}
}