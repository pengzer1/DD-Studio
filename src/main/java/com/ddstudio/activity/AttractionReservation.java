package com.ddstudio.activity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			resp.sendRedirect("/ddstudio/user/login.do");
			return;
		}
		
		if (session.getAttribute("lv").toString().equalsIgnoreCase("2")) {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('This function is only for normal user.');history.back();</script>");
			writer.close();
			return;
		}
			
		//seq로 어트랙션 정보 가져오기
		ActDAO dao = new ActDAO();
		
		AttractionDTO dto = dao.getAttraction(seq);
		
		req.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/reservation.jsp");
		dispatcher.forward(req, resp);
		
		

	}
}