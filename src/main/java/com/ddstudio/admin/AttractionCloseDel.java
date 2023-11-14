package com.ddstudio.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.AttractionCloseDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/admin/attractionclosedel.do")
public class AttractionCloseDel extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ActDAO dao = new ActDAO();
		
		ArrayList<AttractionCloseDTO> list = dao.closeattractionList();
		
		req.setAttribute("list", list);		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/close/attractionclosedel.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.
		String attraction_close_seq = req.getParameter("attraction");
		
		//2.
		ActDAO dao = new ActDAO();
		
		AttractionCloseDTO dto = new AttractionCloseDTO();
		dto.setAttraction_close_seq(attraction_close_seq);
		
		int result = dao.del(dto);
		
		//3.
		if (result == 1) {  //성공하면 돌아갈 페이지
			resp.sendRedirect("/ddstudio/admin/attractionclose.do");
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
	}
}
