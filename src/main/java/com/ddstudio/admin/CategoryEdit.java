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

import com.ddstudio.admin.model.CategoryDTO;
import com.ddstudio.admin.repository.CategoryDAO;

@WebServlet("/admin/categoryedit.do")
public class CategoryEdit extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryDAO dao= new CategoryDAO();
		
		ArrayList<CategoryDTO> list = dao.list();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/category/edit.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 데이터 가져오기
		String before_name = req.getParameter("category_name");
		String after_name = req.getParameter("category");
		
		//2. DB update작업
		CategoryDAO dao = new CategoryDAO();
		
		CategoryDTO dto = new CategoryDTO();
		dto.setName(before_name);  //이전 이름을 잘 포장해서 edit메서드에 넘겨주기
		
		int result=dao.edit(dto, after_name);  //변경할 이름과 함께 매개변수로 넘겨주기
		
		if (result == 1) {  //성공하면 돌아갈 페이지
			resp.sendRedirect("/ddstudio/admin/category.do");
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
		
	}
}
