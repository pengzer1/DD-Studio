package com.ddstudio.guide;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.guide.model.ConvenientDTO;
import com.ddstudio.guide.repository.ConvenientDAO;

@WebServlet("/guide/convenientdetail.do")
public class ConvenientDetail extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ConvenientDAO dao = new ConvenientDAO();
		
		ArrayList<ConvenientDTO> list = dao.list();
		
		req.setAttribute("list", list);
		
		// System.out.println(list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/guide/convenient/detail.jsp");
		dispatcher.forward(req, resp);
	}
}
