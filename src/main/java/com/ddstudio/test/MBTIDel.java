package com.ddstudio.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.test.repository.TestDAO;

/**
 * MBTI별 추천 정보를 삭제하는 서블릿 클래스입니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/test/mbtidel.do")
public class MBTIDel extends HttpServlet {

	/**
	 * MBTI별 추천 삭제 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// MBTI별 추천 삭제 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/mbti/del.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * MBTI별 추천 정보를 삭제하는 POST 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
		String mbti_seq = req.getParameter("mbti_seq"); // 삭제할 MBTI별 추천 정보 번호

        TestDAO dao = new TestDAO();
        
        // MBTI별 추천 정보 삭제
        int result = dao.MBTIDel(mbti_seq);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print("{\"result\":" + result + "}");
    }

}
