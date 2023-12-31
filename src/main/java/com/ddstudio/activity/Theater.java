package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.TheaterDTO;
import com.ddstudio.activity.repository.ActDAO;

/**
 * 영화관 관리 페이지로 이동하는 서블릿 클래스입니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/theater.do")
public class Theater extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Theater.java
		
		ActDAO dao = new ActDAO();
		
		ArrayList<TheaterDTO> list = dao.theaterList();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/theater.jsp");
		dispatcher.forward(req, resp);

	}
}
