package com.ddstudio.activity;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/attractiondetail.do")
public class AttractionDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionDetail.java
		
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		AttractionDTO dto = dao.get(seq);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attractiondetail.jsp");
		dispatcher.forward(req, resp);

	}
}
