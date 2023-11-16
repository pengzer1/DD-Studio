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

import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.test.model.CourseDTO;
import com.ddstudio.test.repository.TestDAO;

@WebServlet("/test/mbtiobjectload.do")
public class MBTIObjectLoad extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TestDAO dao = new TestDAO();

		// CourseDTO 및 AttractionDTO 리스트 가져오기
		ArrayList<CourseDTO> clist = dao.listCourse();
		ArrayList<AttractionDTO> alist = dao.listAttraction();

		JSONArray arr = new JSONArray();

		// course
		// CourseDTO를 JSON으로 변환하여 배열에 추가
		for (CourseDTO dto : clist) {
			JSONObject obj = new JSONObject();
			obj.put("type", "course");
			obj.put("course_seq", dto.getCourse_seq());
			obj.put("course_name", dto.getName());
			arr.add(obj);
		}

		// attraction
		// AttractionDTO를 JSON으로 변환하여 배열에 추가
		for (AttractionDTO dto : alist) {
			JSONObject obj = new JSONObject();
			obj.put("type", "attraction");
			obj.put("attraction_seq", dto.getAttraction_seq());
			obj.put("attraction_name", dto.getName());
			arr.add(obj);
		}

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		// JSON 배열 전송
		PrintWriter writer = resp.getWriter();
		writer.write(arr.toString());
		writer.close();
	}

}