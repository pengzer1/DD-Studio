package com.ddstudio.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.member.model.ReviewDTO;
import com.ddstudio.member.model.ReviewImgDTO;
import com.ddstudio.member.repository.ReviewDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/review/add.do")
public class ReviewAdd extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);
		
		ReviewDTO dto=new ReviewDTO();
		
		req.setAttribute("review_seq", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/review/add.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
					req,
					req.getRealPath("/asset/image"),
					1024 * 1024 * 10,
					"UTF-8",
					new DefaultFileRenamePolicy()
				);
			
			String user_book_seq = multi.getParameter("seq");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			//String review_seq = multi.getParameter("review_seq");
			String img = multi.getFilesystemName("file");
			
			
			ReviewDTO dto = new ReviewDTO();
			
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setUser_book_seq(user_book_seq);
//			dto.setReview_seq(review_seq);
//			dto.setImg(img);
			
			ReviewDAO dao = new ReviewDAO();
			
			
			int result = dao.add(dto);
			
			
			String reviewSeq = dao.getReviewSeq();
			
			
			ReviewImgDTO idto = new ReviewImgDTO();
			idto.setReview_seq(reviewSeq);
			idto.setImg(img);
		
	
			result=dao.addFile(idto);
			
		} catch (Exception e) {
			System.out.println("ReviewAdd.doPost()");
			e.printStackTrace();
		}
		
		
		
		
		
	}
	
}