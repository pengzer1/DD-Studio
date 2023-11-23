package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.VOCDTO;
import com.ddstudio.member.repository.VOCDAO;

/**
 * 칭찬/불편/건의 자세히보기를 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/history/voc/detail.do")
public class VOCDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//VOCDetail.java
		
		String seq = req.getParameter("seq");
		
		VOCDAO dao = new VOCDAO();
		
		VOCDTO dto = dao.detail(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/history/voc/detail.jsp");
		dispatcher.forward(req, resp);
	}
}
