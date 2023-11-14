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

@WebServlet("/test/mbtilistload.do")
public class MBTIListLoad extends HttpServlet {

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter out = resp.getWriter();
		
		try {
			TestDAO dao = new TestDAO();
			ArrayList<MBTIDTO> mbtiList = dao.getAllMBTI();
			
			JSONArray jsonArray = new JSONArray();
			
			for (MBTIDTO mbti : mbtiList) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("mbti_seq", mbti.getMbti_seq());
				jsonObject.put("result", mbti.getResult());
				jsonObject.put("mbti", mbti.getMbti());
				jsonObject.put("course_seq", mbti.getCourse_seq());
				jsonObject.put("course_name", mbti.getCourse_name());
				jsonObject.put("course_img", mbti.getCourse_img());
				jsonObject.put("attraction_seq", mbti.getAttraction_seq());
				jsonObject.put("attraction_name", mbti.getAttraction_name());
				jsonObject.put("attraction_img", mbti.getAttraction_img());
				
				jsonArray.add(jsonObject);
			}
			
			out.print(jsonArray.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}
}
