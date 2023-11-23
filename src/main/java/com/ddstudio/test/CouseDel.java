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

import com.ddstudio.test.model.CourseDTO;
import com.ddstudio.test.repository.TestDAO;

/**
 * 코스 삭제 기능을 담당하는 서블릿 클래스입니다.
 * 코스 목록을 가져와 선택한 코스를 삭제합니다.
 * 
 * @author 이승원
 */

@WebServlet("/test/coursedel.do")
public class CouseDel extends HttpServlet {

	/**
	 * 코스 목록을 가져와 JSON 형식으로 응답하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		TestDAO dao = new TestDAO();

		// 코스 정보 가져오기
		ArrayList<CourseDTO> clist = dao.listCourse();

		JSONArray arr = new JSONArray();

		// 각 코스 정보를 JSON 객체로 변환하여 배열에 추가
		for (CourseDTO dto : clist) {
		    JSONObject obj = new JSONObject();
		    
		    obj.put("course_seq", dto.getCourse_seq());
		    obj.put("name", dto.getName());
		    obj.put("img", dto.getImg());
            
		    arr.add(obj);
		}

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		// JSON 배열 전송
		PrintWriter writer = resp.getWriter();
		writer.write(arr.toString());
		writer.close();

		//System.out.println(arr);
	}
	
	/**
	 * 선택한 코스를 삭제하고 결과를 응답하는 POST 메서드입니다.
	 * 
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		TestDAO dao = new TestDAO();

		String courseSeq = request.getParameter("courseSeq"); // 삭제할 코스 번호

		// 코스 삭제
		int result = dao.deleteCourse(courseSeq);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		// 삭제 결과 전송
		PrintWriter writer = response.getWriter();
		writer.write(String.valueOf(result));
		writer.close();
	}

}
