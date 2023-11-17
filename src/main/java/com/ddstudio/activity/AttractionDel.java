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

@WebServlet("/activity/attractiondel.do")
public class AttractionDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionDel.java
		
		//1. 넘긴 seq 받아오기
		String seq = req.getParameter("seq");
		
		//2. seq 전달
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/del.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//삭제 절차
		//Step 1. 어트/해시 태그 삭제
		//Step 2. 어트랙션 이미지 테이블에서 삭제
		//Step 3-1. 위치정보번호 > 0번으로 변경(위치 0: 운영종료)
		//Step 3-2. 테스트채택 'n'으로 변경
		//Step 3-3. 기존 어트랙션명 + (운영종료) 텍스트 추가

		ActDAO dao = new ActDAO();
		int result = 0;

		//0. 넘긴 seq 받아오기
		String seq = req.getParameter("seq");
		
		System.out.println("Attraction seq: " + seq);
		
		//Step 1. 어트/해시 태그 삭제
		//- 해시태그가 기 존재하는지 확인(개수 확인)
		int cnt = dao.countAttractionHashtag(seq);
		
		System.out.println((cnt > 0? "해시태그 존재" : "해시태그 존재X"));
		
		if (cnt > 0) { //기 존재 해시태그 삭제
			result = dao.delAttractionHashtag(seq);
			
			System.out.println("기존 어트랙션 해시태그 삭제 완료");
			
			if (result == 0) {
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('어트랙션 해시태그 삭제에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		}
		
		//Step 2. 어트랙션 이미지 테이블에서 삭제
		//- 어트랙션 이미지가 기 존재하는지 확인(개수 확인)
		cnt = dao.countAttractionImg(seq);
		
		System.out.println((cnt > 0 ? "이미지 존재" : "이미지 존재X"));
		
		if (cnt > 0) { //기 존재 이미지 삭제
			
			result = dao.delAttractionImg(seq);
			
			System.out.println("기존 어트랙션 이미지 삭제 완료");
			
			if (result == 0) {
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('어트랙션 이미지 삭제에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		}
		
		//Step 3-1. 위치정보번호 > 0번으로 변경(위치 0: 운영종료)
		//Step 3-2. 테스트채택 'n'으로 변경
		//Step 3-3. 기존 어트랙션명 + (운영종료) 텍스트 추가
		
		result = dao.delAttraction(seq);
		
		if (result == 1) { //어트랙션 삭제(정보 변경) 성공
			
			//**최종 삭제 성공!!!!!**
			resp.sendRedirect("/ddstudio/activity/attraction.do");
			
		} else { //어트랙션 삭제(정보 변경) 실패
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('어트랙션 테이블에서 삭제 실패했습니다.');history.back();</script>");
			writer.close();
			
		}
		
	}
}