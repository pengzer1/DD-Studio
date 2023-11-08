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

@WebServlet("/communicate/notice/add.do")
public class NoticeAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/notice/add.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 50, "UTF-8", new DefaultFileRenamePolicy());
			
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String file = multi.getFilesystemName("file");
			String fix = multi.getParameter("fix");
			
			NoticeDTO dto = new NoticeDTO();

			dto.setSubject(subject);
			dto.setContent(content);
			
			if (file != null && !file.equals("")) {
				
				dto.setAttach(file);
				
			} else {
				
				dto.setAttach(null);
				
			}

			dto.setFix(fix);
			
			CommuDAO dao = new CommuDAO();
			
			int result = dao.addNotice(dto);
			
			if (result == 1) {
				
				resp.sendRedirect("/ddstudio/communicate/notice/list.do");
				
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
