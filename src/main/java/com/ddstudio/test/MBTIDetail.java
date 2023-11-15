// MBTIDetail.java
package com.ddstudio.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.ddstudio.test.model.MBTIDTO;
import com.ddstudio.test.repository.TestDAO;

@WebServlet("/test/mbtidetail.do")
public class MBTIDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/mbti/detail.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mbti = req.getParameter("mbti");

		TestDAO dao = new TestDAO();
		MBTIDTO mbtiDetails = dao.get(mbti);

		JSONObject mbtiResult = new JSONObject();

		if (mbtiDetails != null) {
			mbtiResult.put("mbti_seq", mbtiDetails.getMbti_seq());
			mbtiResult.put("result", mbtiDetails.getResult());
			mbtiResult.put("mbti", mbtiDetails.getMbti());
			mbtiResult.put("course_seq", mbtiDetails.getCourse_seq());
			mbtiResult.put("course_name", mbtiDetails.getCourse_name());
			mbtiResult.put("course_img", mbtiDetails.getCourse_img());
			mbtiResult.put("attraction_seq", mbtiDetails.getAttraction_seq());
			mbtiResult.put("attraction_name", mbtiDetails.getAttraction_name());
			mbtiResult.put("attraction_img", mbtiDetails.getAttraction_img());
		}

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		//System.out.println(mbtiResult);
		
		try (PrintWriter writer = resp.getWriter()) {
			writer.write(mbtiResult.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
