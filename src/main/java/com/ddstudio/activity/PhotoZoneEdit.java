package com.ddstudio.activity;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.PhotoZoneDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/photozoneedit.do")
public class PhotoZoneEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PhotoZoneEdit.java
		//- 이름, 정보, 위치
		
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		PhotoZoneDTO dto = dao.getPhotozone(seq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/photozone/edit.jsp");
		dispatcher.forward(req, resp);

	}
}
