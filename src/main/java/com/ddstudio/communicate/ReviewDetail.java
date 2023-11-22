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

/**
 * ReviewDetail 서블릿은 리뷰 상세 정보를 표시하는 기능을 담당합니다.
 * 
 * 작성자: 차수민
 */
@WebServlet("/communicate/reviewdetail.do")
public class ReviewDetail extends HttpServlet {

	/**
     * HTTP GET 요청을 처리하여 리뷰의 상세 정보를 가져와서 표시합니다.
     * 
     * @param req  클라이언트의 HttpServletRequest 객체입니다.
     * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
     * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
     * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
     */
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

	    content = content.replace("\r\n", "<br>");

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