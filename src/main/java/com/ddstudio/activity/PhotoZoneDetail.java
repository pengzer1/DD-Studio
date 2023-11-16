package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.model.PhotoZoneDTO;
import com.ddstudio.activity.model.PhotoZoneImgDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/photozonedetail.do")
public class PhotoZoneDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PhotoZoneDetail.java
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		PhotoZoneDTO dto = dao.getPhotozone(seq);
		
		ArrayList<PhotoZoneImgDTO> imgList = dao.photozoneImgList(seq);
		
		LocationDTO location_dto = dao.getPhotozoneLocation(seq);
		
		
		req.setAttribute("imgList", imgList);
		req.setAttribute("dto", dto);
		req.setAttribute("location_dto", location_dto);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/photozone/detail.jsp");
		dispatcher.forward(req, resp);

	}
}