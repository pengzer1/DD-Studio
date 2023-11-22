package com.ddstudio.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.user.repository.UserDAO;

/*
 * 해시태그 검색을 위한 서블릿 클래스입니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/user/searchhashtag.do")
public class SearchHashtag extends HttpServlet {

	/**
	 * GET 메서드로 요청이 들어올 때 호출되는 메서드입니다.
	 * 해시태그 목록을 클라이언트에 전송합니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAO userDAO = new UserDAO();

			// 해시태그 목록
			ArrayList<String> hashtagList = userDAO.getHashtagList();

			// StringBuilder를 사용하여 JSON 형식의 문자열을 생성
			// JSON 배열 형태인 "["로 시작하여 각 해시태그를 쌍따옴표로 묶어 문자열에 추가
			// 해시태그가 목록의 마지막이 아니라면 쉼표(,) 추가
			StringBuilder hashtagJson = new StringBuilder("[");
			for (int i = 0; i < hashtagList.size(); i++) {
				hashtagJson.append("\"").append(hashtagList.get(i)).append("\"");
				if (i < hashtagList.size() - 1) {
					hashtagJson.append(",");
				}
			}
			hashtagJson.append("]");

			// System.out.println(hashtagJson);

			// 클라이언트에 전송
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write(hashtagJson.toString());

		} catch (Exception e) {
			e.printStackTrace();
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}
}
