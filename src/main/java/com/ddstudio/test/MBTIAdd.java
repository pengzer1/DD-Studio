package com.ddstudio.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.test.model.MBTIDTO;
import com.ddstudio.test.repository.TestDAO;

/**
 * MBTI별 추천 정보를 추가하는 서블릿 클래스입니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/test/mbtiadd.do")
public class MBTIAdd extends HttpServlet {

	/**
	 * MBTI별 추천 추가 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// MBTI별 추천 추가 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/mbti/add.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * MBTI별 추천 정보를 추가하는 POST 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			
			// MBTI별 추천 추가할 데이터
			String mbti = req.getParameter("mbti");
			String resultMessage = req.getParameter("result");
			String courseSeq = req.getParameter("course-name");
			String attractionSeq = req.getParameter("attraction-name");

			MBTIDTO dto = new MBTIDTO();
			dto.setMbti(mbti);
			dto.setResult(resultMessage);
			dto.setCourse_seq(courseSeq);
			dto.setAttraction_seq(attractionSeq);

			TestDAO dao = new TestDAO();

			// MBTI별 추천 정보 추가
			int result = dao.mbtiAdd(dto);

			// System.out.println(result);

			// 응답 데이터를 JSON 형식으로 생성
			String jsonResponse = "{\"result\": " + result + "}";
			resp.getWriter().write(jsonResponse);

		} catch (Exception e) {
			// 에러 발생
			e.printStackTrace();
			resp.getWriter().write("{\"result\": 0}");
		}

	}

}
