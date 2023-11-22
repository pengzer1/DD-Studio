package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.VOCDTO;
import com.ddstudio.communicate.repository.CommuDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * VOCAdd 서블릿은 VOC를 등록하는 기능을 담당합니다.
 *
 * 작성자: 차수민
 */
@WebServlet("/communicate/vocadd.do")
public class VOCAdd extends HttpServlet {

	/**
     * HTTP GET 요청을 처리하여 VOC 등록 페이지로 이동합니다.
     *
     * @param req  클라이언트의 HttpServletRequest 객체입니다.
     * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
     * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
     * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
     */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/voc/add.jsp");

		dispatcher.forward(req, resp);

	}
	
	/**
     * HTTP POST 요청을 처리하여 VOC를 등록합니다.
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

			String type = multi.getParameter("type");
			String serviceType = multi.getParameter("service-type");
			String visitDate = multi.getParameter("visit-date");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String file = multi.getFilesystemName("file");
			String seq = multi.getParameter("seq");
			
			VOCDTO dto = new VOCDTO();

			dto.setType(type);
			dto.setService_type(serviceType);
			dto.setVisit_date(visitDate);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setAttach(file);
			dto.setUser_seq(seq);
			
			CommuDAO dao = new CommuDAO();
			
			int result = dao.addVOC(dto);
			
			if (result == 1) {
				
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				
                writer.println("<script>");
                writer.println("alert('등록되었습니다.');");
                writer.println("location.href='/ddstudio/communicate/voc.do';");
                writer.println("</script>");
                
                writer.close();
				
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