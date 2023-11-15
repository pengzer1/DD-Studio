package com.ddstudio.activity;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/activity/attractionhashtag.do")
public class AttractionHashtag extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionHashtag.java
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attractionhashtag.jsp");
		dispatcher.forward(req, resp);

	}
}
