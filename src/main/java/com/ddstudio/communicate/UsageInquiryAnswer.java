package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.InquiryDTO;
import com.ddstudio.communicate.repository.CommuDAO;

/**
 * UsageInquiryAnswer 서블릿은 사용자의 문의사항에 답변을 추가, 수정 또는 삭제하는 기능을 담당합니다.
 * 
 * @author 차수민
 */
@WebServlet("/communicate/usageinquiryanswer.do")
public class UsageInquiryAnswer extends HttpServlet {
	
	/**
     * HTTP GET 요청을 처리하여 사용자의 문의사항에 답변을 추가, 수정 또는 삭제하는 기능을 수행합니다.
     * 
     * @param req  클라이언트의 HttpServletRequest 객체입니다.
     * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
     * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
     * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
     */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String answer = req.getParameter("answer");
		String action = req.getParameter("action");
		
		req.setAttribute("seq", seq);
		req.setAttribute("answer", answer);
		req.setAttribute("action", action);
		
		this.doPost(req, resp);
		
	}

	/**
     * HTTP POST 요청을 처리하여 사용자의 문의사항에 답변을 추가, 수정 또는 삭제하는 기능을 수행합니다.
     * 
     * @param req  클라이언트의 HttpServletRequest 객체입니다.
     * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
     * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
     * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
     */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String answer = req.getParameter("answer");
		String action = req.getParameter("action");

		InquiryDTO dto = new InquiryDTO();
		
		dto.setInquiry_seq(seq);
		dto.setAnswer(answer);
		
		CommuDAO dao = new CommuDAO();
		
		int result = 0;
		
		result = dao.updateInquiryAnswer(action, dto);
		
		if (result == 1) {
			
			if (action.equals("add") || action.equals("edit")) {
				
				resp.sendRedirect("/ddstudio/communicate/usageinquirydetail.do?seq=" + seq);
				
			} else {
				
				resp.sendRedirect("/ddstudio/communicate/usageinquiry.do");
				
			}
			
		} else {
			
			PrintWriter writer = resp.getWriter();
			
			writer.println("<script>");
			writer.println("alert('failed');");
			writer.println("history.back();");
			writer.println("</script>");
			
			writer.close();
			
		}

	}
	
}
