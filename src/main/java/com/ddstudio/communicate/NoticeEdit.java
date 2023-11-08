package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.NoticeDTO;
import com.ddstudio.communicate.repository.CommuDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/communicate/notice/edit.do")
public class NoticeEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		CommuDAO dao = new CommuDAO();
		
		NoticeDTO dto = dao.getNotice(seq);
		
		dto.setSubject(dto.getSubject().replace("\"", "&quot;"));
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/notice/edit.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 50, "UTF-8", new DefaultFileRenamePolicy());
			
			String seq = req.getParameter("seq");
			String subject = req.getParameter("subject");
			String content = req.getParameter("content");
			String file = multi.getFilesystemName("file");
			String fix = req.getParameter("fix");
	
			NoticeDTO dto = new NoticeDTO();
			
			dto.setSeq(seq);
			dto.setSubject(subject);
			dto.setContent(content);
			
			if (file != null && !file.equals("")) {
				
				dto.setAttach(file);
				
			} else {
				
				dto.setAttach(null);
				
			}
	
			dto.setFix(fix);
			
			CommuDAO dao = new CommuDAO();
			
			int result = dao.editNotice(dto);
	
			if (result == 1) {
					
				resp.sendRedirect("/ddstudio/communicate/notice/detail.do?seq=" + seq);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
			
		PrintWriter writer = resp.getWriter();
		
		writer.println("<script>");
		writer.println("alert('Failed');");
		writer.println("history.back();");
		writer.println("</script>");
		
		writer.close();
		
	}

}
