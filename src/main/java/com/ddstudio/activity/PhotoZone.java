package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.PhotoZoneDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/photozone.do")
public class PhotoZone extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PhotoZone.java
		//- 조건 검색 기능 X, 페이지 구분 X
		
		ActDAO dao = new ActDAO();
		
		/*ArrayList<PhotoZoneDTO> list = dao.photozoneList();
		
		req.setAttribute("list", list);*/

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/photozone/list.jsp");
		dispatcher.forward(req, resp);

	}
}