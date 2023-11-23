package com.ddstudio.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.admin.repository.HashTagDAO;
/**
 * 관리자가 해시태그를 추가하는 클래스
 * @author leeje
 *
 */
@WebServlet("/admin/hashtagadd.do")
public class HashTagAdd extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/hashtag/add.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.
		req.setCharacterEncoding("utf-8");
		String name=req.getParameter("name");
		
		//2.
		HashTagDAO dao = new HashTagDAO();
		
		HashTagDTO dto = new HashTagDTO();
		dto.setName(name);  //예쁘게 포장해서 넘겨주기
		
		int result=dao.add(dto);
		
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
