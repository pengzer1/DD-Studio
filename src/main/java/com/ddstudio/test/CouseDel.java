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
import com.ddstudio.test.model.MBTIDTO;
import com.ddstudio.test.repository.TestDAO;

@WebServlet("/test/coursedel.do")
public class CouseDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		TestDAO dao = new TestDAO();

		ArrayList<CourseDTO> clist = dao.listCourse();

		JSONArray arr = new JSONArray();

		for (CourseDTO dto : clist) {
		    JSONObject obj = new JSONObject();
		    
		    obj.put("course_seq", dto.getCourse_seq());
		    obj.put("name", dto.getName());
		    obj.put("img", dto.getImg());
            
		    arr.add(obj);
		}

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		PrintWriter writer = resp.getWriter();
		writer.write(arr.toString());
		writer.close();

		//System.out.println(arr);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		TestDAO dao = new TestDAO();

		String courseSeq = request.getParameter("courseSeq");

		int result = dao.deleteCourse(courseSeq);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		PrintWriter writer = response.getWriter();
		writer.write(String.valueOf(result));
		writer.close();
	}

}
