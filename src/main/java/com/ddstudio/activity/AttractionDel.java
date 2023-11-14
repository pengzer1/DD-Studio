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
		//Step 1. 기존 어트랙션명 + (운영종료) 텍스트 추가
		//Step 2. 위치정보번호 > 0번으로 변경(위치 0: 운영종료)
		//Step 3. 테마번호 > 0번으로 변경(테마 0: 운영종료)
		//Step 4. 테스트채택 'n'으로 변경
		//Step 5. 어트/해시 태그 삭제

		
		//1. 넘긴 seq 받아오기
		String seq = req.getParameter("seq");
		
		//2. DB 작업 > DELETE
		ActDAO dao = new ActDAO();

		int result = dao.delAttraction(seq);
		
		//3. 피드백
		if (result == 1) { //삭제 성공 시, 어트랙션 목록보기로 이동
			resp.sendRedirect("/ddstudio/activity/attraction.do");
		} else { //삭제 실패 시, 경고창 띄우고 이전 페이지로 이동
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			
			writer.close();
		}
	
	
	}
}