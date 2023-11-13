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

import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.admin.repository.HashTagDAO;

@WebServlet("/admin/hashtagdel.do")
public class HashTagDel extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 보내기
		
		HashTagDAO dao = new HashTagDAO();
		
		ArrayList<HashTagDTO> list = dao.list();
		
		req.setAttribute("list", list);  //jsp로 list보내기
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/hashtag/del.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.
		String name= req.getParameter("hashtag_name");
		
		//2.
		HashTagDAO dao = new HashTagDAO();
		
		HashTagDTO dto = new HashTagDTO();
		dto.setName(name);
		
		int result = dao.del(dto);
		
		//3. 피드백
		if (result == 1) {  //성공하면 돌아갈 페이지
			resp.sendRedirect("/ddstudio/admin/hashtag.do");
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
		
		
	}
}