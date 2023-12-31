package com.ddstudio.communicate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.VOCDTO;
import com.ddstudio.communicate.repository.CommuDAO;

/**
 * VOCDetail 서블릿은 VOC의 상세 정보를 조회하는 기능을 담당합니다.
 *
 * @author 차수민
 */
@WebServlet("/communicate/vocdetail.do")
public class VOCDetail extends HttpServlet {

	/**
     * HTTP GET 요청을 처리하여 VOC의 상세 정보 페이지로 이동합니다.
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

		VOCDTO dto = dao.getVOC(seq);
		
		String subject = dto.getSubject();
		
		subject = subject.replace("<", "&lt;");
		subject = subject.replace(">", "&gt;");
		
		dto.setSubject(subject);
		
		String content = dto.getContent();
		
		if (content != null) {
			
		    content = content.replace("<", "&lt;");
		    content = content.replace(">", "&gt;");
		    
		    content = content.replace("\n", "<br>");

		    dto.setContent(content);
		    
		} else {
			
		    dto.setContent("");
		    
		}
		
		String visitDate = dto.getRegdate();
		
		visitDate = visitDate.substring(0, 10);
		
		dto.setVisit_date(visitDate);

		String regdate = dto.getRegdate();
		
		regdate = regdate.substring(0, 10);
		
		dto.setRegdate(regdate);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/voc/detail.jsp");

		dispatcher.forward(req, resp);

	}

}
