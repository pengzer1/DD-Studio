package com.ddstudio.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ddstudio.test.model.MBTIDTO;
import com.ddstudio.test.repository.TestDAO;

/**
 * MBTI 정보를 가져와 JSON 형식으로 응답하는 서블릿 클래스입니다.
 * MBTI 테이블에 들어 있는 정보만을 가져옵니다.
 * 
 * 작성자: 이승원
 */
@WebServlet("/test/mbti/list.do")
public class MBTIList extends HttpServlet {

	/**
	 * MBTI 정보를 가져와 JSON 형식으로 응답하는 GET 메서드입니다.
	 * 
	 * @param req  HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TestDAO dao = new TestDAO();
		
		// MBTI 정보 가져오기
		ArrayList<MBTIDTO> clist = dao.listMBTI();

		JSONArray arr = new JSONArray();
		
		// MBTI 정보를 JSON 형식으로 배열에 추가
		for (MBTIDTO dto : clist) {
		    JSONObject obj = new JSONObject();
		    obj.put("mbti", dto.getMbti());
		    arr.add(obj);
		}

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		// JSON 데이터 전송
		PrintWriter writer = resp.getWriter();
		writer.write(arr.toString());
		writer.close();
		
	}
}
