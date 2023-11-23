package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.ReviewDTO;
import com.ddstudio.member.repository.ReviewDAO;

/**
 * 리뷰 자세히보기를 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/review/detail.do")
public class ReviewDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// ReviewDetail.java

		String seq = req.getParameter("seq");

		ReviewDAO dao = new ReviewDAO();

		ReviewDTO dto = dao.detail(seq);

		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/review/detail.jsp");
		dispatcher.forward(req, resp);
	}
}
