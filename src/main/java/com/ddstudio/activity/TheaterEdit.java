package com.ddstudio.activity;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.TheaterDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/theateredit.do")
public class TheaterEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//TheaterEdit.java
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		TheaterDTO dto = dao.getTheater(seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/theateredit.jsp");
		dispatcher.forward(req, resp);

	}
}
