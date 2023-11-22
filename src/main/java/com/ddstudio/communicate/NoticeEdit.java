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

/**
 * NoticeEdit 서블릿은 선택한 공지사항의 수정 기능을 제공합니다.
 * 
 * 작성자: 차수민
 */
@WebServlet("/communicate/noticeedit.do")
public class NoticeEdit extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리하여 선택한 공지사항의 수정 페이지로 이동합니다.
	 * 
	 * @param req  클라이언트의 HttpServletRequest 객체입니다.
	 * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
	 * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
	 * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
	 */
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
	
	/**
	 * HTTP POST 요청을 처리하여 선택한 공지사항을 수정합니다.
	 * 
	 * @param req  클라이언트의 HttpServletRequest 객체입니다.
	 * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
	 * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
	 * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String seq = req.getParameter("seq");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String file = multi.getFilesystemName("file");
			String fix = multi.getParameter("fix");
	
			NoticeDTO dto = new NoticeDTO();
			
			dto.setNotice_seq(seq);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setAttach(file);
			dto.setFix(fix);
			
			CommuDAO dao = new CommuDAO();
			
			int result = dao.editNotice(dto);
	
			if (result == 1) {
					
				resp.sendRedirect("/ddstudio/communicate/noticedetail.do?seq=" + seq);
				
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
