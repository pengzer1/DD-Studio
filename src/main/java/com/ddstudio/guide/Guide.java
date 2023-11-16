package com.ddstudio.guide;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.guide.model.ConvenientDTO;
import com.ddstudio.guide.repository.ConvenientDAO;

@WebServlet("/guide/guide.do")
public class Guide extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ConvenientDAO cdao = new ConvenientDAO();
		
		ArrayList<AttractionDTO> alist = cdao.attractionList();
		ArrayList<ConvenientDTO> clist = cdao.list();
		
		req.setAttribute("alist", alist);
		req.setAttribute("clist", clist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/guide/guide.jsp");
		dispatcher.forward(req, resp);
	}
}
