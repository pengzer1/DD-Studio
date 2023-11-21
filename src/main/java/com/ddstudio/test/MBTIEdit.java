package com.ddstudio.test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.test.model.MBTIDTO;
import com.ddstudio.test.repository.TestDAO;

/**
 * MBTI별 추천 정보를 수정하는 기능을 담당하는 서블릿 클래스입니다.
 * 사용자에게 MBTI 정보를 전달하고 수정 페이지로 이동합니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/test/mbtiedit.do")
public class MBTIEdit extends HttpServlet {

	/**
	 * MBTI별 추천 수정 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req  HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// MBTI별 추천 수정 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/mbti/edit.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * MBTI 정보를 가져와 수정하는 POST 메서드입니다.
	 * 
	 * @param req  HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		try {
			
			TestDAO dao = new TestDAO();
			
			// MBTI별 추천 정보 가져오기
			ArrayList<MBTIDTO> mbtiList = dao.getAllMBTI();
			
			// request 객체에 MBTI 정보를 attribute로 설정
			req.setAttribute("mbtiList", mbtiList);

			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/mbti/edit.jsp");
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
