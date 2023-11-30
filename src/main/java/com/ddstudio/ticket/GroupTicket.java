package com.ddstudio.ticket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.ticket.model.GroupBookDTO;
import com.ddstudio.ticket.repository.TicketDAO;

/**
 * 단체 예매 서블릿입니다.
 * 단체 예매를 추가 하는 기능을 처리합니다.
 * @author pega0
 *
 */
@WebServlet("/ticket/group-reservation.do")
public class GroupTicket extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
     * 
     * 단체 예매 추가 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ticket/group-reservation.jsp");
		dispatcher.forward(req, resp);
	}
	
	/**
	 * HTTP POST 요청을 처리합니다.
     * 
     * 클라이언트로부터 받은 단체 예매 정보를 처리하고, 결과에 따라 성공 또는 실패 메시지를 표시합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String division = req.getParameter("division");
		String region = req.getParameter("region");
		String groupName = req.getParameter("group-name");
		String address = "";
		
		String postCode = req.getParameter("post-code").trim();
        String addressBasis = req.getParameter("address-basis").trim();
        String addressDetail = req.getParameter("address-detail").trim();
        address = postCode + " " + addressBasis + " " + addressDetail;
        
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        
        String seq = req.getParameter("seq");
        
        GroupBookDTO dto = new GroupBookDTO();
        
        dto.setGroup_division(division);
        dto.setRegion(region);
        dto.setGroup_name(groupName);
        dto.setAddress(address);
        dto.setVisit_date(date);
        dto.setVisit_time(time);
        
        TicketDAO dao = new TicketDAO();
        
        int result = dao.addGroupReservation(dto);
        
        if (result == 1) {
        	String group_book_seq = dao.getGroupBookSeq(); //select max(group_book_seq) from tbl
        	
        	result = dao.addUserGroupReservation(seq, group_book_seq);
        	
        	if (result == 1) {
        		PrintWriter writer = resp.getWriter();
    			
            	resp.sendRedirect("/ddstudio/index.do");
            	writer.close();
        	} else {
        		PrintWriter writer = resp.getWriter();
    			writer.print("<script>alert('Reservation failed'); history.back(); </script>");
    			writer.close();
        	}
        	
        	
        } else {
        	PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('Reservation failed'); history.back(); </script>");
			writer.close();
        }
        
        
		
	}

}