package com.ddstudio.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.activity.model.AttractionCloseDTO;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/attractionreservation.do")
public class AttractionReservation extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionReservation.java
		//seq 받아오기
		String seq = req.getParameter("seq");
		
		//로그인 정보 확인
		HttpSession session = req.getSession();
		
		if (session.getAttribute("email") == null) {
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('로그인이 필요한 페이지입니다.로그인 화면으로 이동합니다.');location.href='/ddstudio/user/login.do';</script>");
			//resp.sendRedirect("/ddstudio/user/login.do");
			return;
		}
		
		if (session.getAttribute("lv").toString().equalsIgnoreCase("2")) {

			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('관리자 계정으로는 사용할 수 없는 기능입니다.일반 사용자로 로그인 후 이용해주세요.');history.back();</script>");
			writer.close();
			return;
		}
		
		//운휴중이면 예매가 불가하도록
		ActDAO dao = new ActDAO();
		
		AttractionCloseDTO close_dto = dao.getAttractionClose(seq);
		
		if (close_dto != null) {
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('금일 운휴 어트랙션으로 예약이 불가합니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
			
		//seq로 어트랙션 정보 가져오기
		
		AttractionDTO dto = dao.getAttraction(seq);
		
		
		//예약 가능 시간을 거를 현재 시간 생성하여 전달하기
		Date today = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("H");
		String now = formatter.format(today);
		//System.out.println(now);
		
		
		//jsp로 객체에 담아 전달
		req.setAttribute("dto", dto);
		req.setAttribute("now", now);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/reservation.jsp");
		dispatcher.forward(req, resp);
		
		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//어트랙션 예약 > DB 작업
		//- attraction_seq, capacity, attraction_book_seq를 매개변수로 보내서 DB 접근!
		//- 조건: tblBookUser에서 해당하는 어트랙션의 해당 예약 시간대에 최대 10명을 넘기면 안된다!!
		String time = req.getParameter("time");
		String capacity = req.getParameter("capacity");
		String seq = req.getParameter("seq");

		//System.out.println(time);
		//System.out.println(capacity);
		//System.out.println(seq);
		
		//DAO 접근 전, tblBookUser를 돌면서 수용 인원 내에서 예약이 가능한지 확인하기!!!
		
		for ()
		
		
		//ActDAO dao = dao.reserveAttraction(seq);
	
	
	
	}
	
}