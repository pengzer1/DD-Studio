package com.ddstudio.guide;

import com.ddstudio.guide.model.BusDTO;
import com.ddstudio.guide.repository.BusDAO;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//편의시설

@WebServlet("/guide/convenient.do")
public class Convenient extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		BusDTO dto = new BusDTO();
		BusDAO dao = new BusDAO();
		ArrayList<BusDTO> busList = dao.busList();

		ArrayList<BusDTO> routeList = dao.routeList();



		req.setAttribute("routeList",routeList);
		req.setAttribute("busList", busList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/guide/convenient/list.jsp");
		dispatcher.forward(req, resp);
	}
}
