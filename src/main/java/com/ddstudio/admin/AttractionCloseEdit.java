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
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.CategoryDTO;
import com.ddstudio.admin.repository.CategoryDAO;

@WebServlet("/admin/attractioncloseedit.do")
public class AttractionCloseEdit extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ActDAO dao = new ActDAO();
		
		ArrayList<AttractionCloseDTO> list = dao.closeattractionList();
	
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/close/attractioncloseedit.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//어트랙션seq, 시작일, 종료일 받아서 가져오기
		
		//1. 데이터 가져오기
		String attraction_seq=req.getParameter("attraction");
		String start_date=req.getParameter("start_date");
		String end_date=req.getParameter("end_date");
				
		//2. AttractionClose 테이블에 수정 후 저장하기
		ActDAO dao = new ActDAO();
				
		AttractionCloseDTO dto = new AttractionCloseDTO();  //어트랙션 운휴 테이블을 선언하고  (DB에 수정해서 넣을 예정)
		//예쁘게 담아주기
		dto.setAttraction_seq(attraction_seq);
		dto.setStart_date(start_date);
		dto.setEnd_date(end_date);
				
		int result=dao.attcloseedit(dto);  //DAO에 어트랙션 운휴 테이블에 수정한 데이터를 저장해줄 메서드 만들기
				
		//3. 피드백
		if (result == 1) {  //성공하면 돌아갈 페이지
			resp.sendRedirect("/ddstudio/admin/attractionclose.do");
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
	}
	
}
