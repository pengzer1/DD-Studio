package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.InquiryDTO;
import com.ddstudio.member.repository.InquiryDAO;

/**
 * 문의내역 자세히보기를 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/history/inquiry/detail.do")
public class InquiryDetail extends HttpServlet {

	/**
	 * 문의내역 자세히보기를 출력하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//InquiryDetail.java
		
		String seq = req.getParameter("seq");
		
		InquiryDAO dao = new InquiryDAO();
		
		InquiryDTO dto = dao.detail(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/history/inquiry/detail.jsp");
		dispatcher.forward(req, resp);
	}
}
