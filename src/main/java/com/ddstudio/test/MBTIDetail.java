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

/**
 * MBTI별 추천 상세 정보를 처리하는 서블릿 클래스입니다.
 * 사용자가 선택한 MBTI에 대한 상세 정보를 JSON 형식으로 응답합니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/test/mbtidetail.do")
public class MBTIDetail extends HttpServlet {

	/**
	 * MBTI별 추천 상세 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req  HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// MBTI별 추천 상세 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/mbti/detail.jsp");
		dispatcher.forward(req, resp);
	}
	
	/**
	 * 선택한 MBTI에 대한 상세 정보를 응답하는 POST 메서드입니다.
	 * 
	 * @param req  HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
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
