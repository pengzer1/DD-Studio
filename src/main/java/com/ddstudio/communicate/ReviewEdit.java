package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.ReviewDTO;
import com.ddstudio.communicate.model.ReviewImgDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/reviewedit.do")
public class ReviewEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		CommuDAO dao = new CommuDAO();
		
		ReviewDTO dto = dao.getReview(seq);
		
		dto.setSubject(dto.getSubject().replace("\"", "&quot;"));

		req.setAttribute("dto", dto);
		
		ArrayList<ReviewImgDTO> imgList = dao.getReviewImgList(seq);
		
		req.setAttribute("imgList", imgList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/review/edit.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String seq = req.getParameter("seq");
			String subject = req.getParameter("subject");
			String content = req.getParameter("content");
	
			ReviewDTO dto = new ReviewDTO();
			
			dto.setReview_seq(seq);
			dto.setSubject(subject);
			dto.setContent(content);
			
			CommuDAO dao = new CommuDAO();
			
			int result = dao.editReview(dto);
	
			if (result == 1) {
					
				resp.sendRedirect("/ddstudio/communicate/reviewdetail.do?seq=" + seq);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
			
		PrintWriter writer = resp.getWriter();
		
		writer.println("<script>");
		writer.println("alert('failed');");
		writer.println("history.back();");
		writer.println("</script>");
		
		writer.close();
		
	}

}
