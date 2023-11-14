package com.ddstudio.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.test.model.MBTIDTO;
import com.ddstudio.test.repository.TestDAO;

@WebServlet("/test/mbtiadd.do")
public class MBTIAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/mbti/add.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mbti = req.getParameter("mbti");
		String resultMessage = req.getParameter("result");
		String courseSeq = req.getParameter("course-name");
		String attractionSeq = req.getParameter("attraction-name");

		// System.out.println(mbti);
		// System.out.println(resultMessage);
		// System.out.println(courseSeq);
		// System.out.println(attractionSeq);
		
		MBTIDTO dto = new MBTIDTO();
		
		dto.setMbti(mbti);
		dto.setResult(resultMessage);
		dto.setCourse_seq(courseSeq);
		dto.setAttraction_seq(attractionSeq);

		TestDAO dao = new TestDAO();
		
		int result = dao.mbtiAdd(dto);

		System.out.println(result);
		
		//0 또는 에러
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed');history.back();</script>");
		writer.close();
	}
	
}