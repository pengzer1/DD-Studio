package com.ddstudio.guide;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.guide.repository.ConvenientDAO;

@WebServlet("/guide/guide.do")
public class Guide extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//어트랙션 & 편의시설 -> Convenient에 메서드 생성하기
		
		
		
		//1.
		ConvenientDAO dao = new ConvenientDAO();
		
		//ArrayList<LocationDTO> list = dao.listPlace();
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/guide/guide.jsp");
		dispatcher.forward(req, resp);
	}
}
