package com.ddstudio.communicate;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.communicate.model.ReviewDTO;
import com.ddstudio.communicate.model.ReviewImgDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/reviewdetail.do")
public class ReviewDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		String seq = req.getParameter("seq");

		CommuDAO dao = new CommuDAO();
		
		if (session.getAttribute("read") != null && session.getAttribute("read").toString().equals("n")) {

			dao.updateReadcount(seq);
			
			session.setAttribute("read", "y");
			
		}

		ReviewDTO dto = dao.getReview(seq);
		
		String subject = dto.getSubject();
		
		subject = subject.replace("<", "&lt;");
		subject = subject.replace(">", "&gt;");
		
		dto.setSubject(subject);
		
		String content = dto.getContent();
			
	    content = content.replace("<", "&lt;");
	    content = content.replace(">", "&gt;");
	    
	    content = content.replace("\n", "<br>");

	    dto.setContent(content);

		String regdate = dto.getRegdate();
		
		regdate = regdate.substring(0, 10);
		
		dto.setRegdate(regdate);
		
		String visitDate = dto.getVisit_date();
		
		visitDate = visitDate.substring(0, 10);
		
		dto.setVisit_date(visitDate);
		
		ArrayList<ReviewImgDTO> imgList = dao.getReviewImgList(seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("imgList", imgList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/review/detail.jsp");
		
		dispatcher.forward(req, resp);

	}
	
}