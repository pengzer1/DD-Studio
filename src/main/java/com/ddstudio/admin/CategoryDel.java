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

@WebServlet("/admin/categorydel.do")
public class CategoryDel extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 보내기
		
		CategoryDAO dao = new CategoryDAO();
		
		//카테고리를 보여주는 list를 카테고리dto에 list로 저장
		ArrayList<CategoryDTO> list = dao.list();
		
		req.setAttribute("list", list);  //카테고리 테이블 리스트 보내기
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/category/del.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String category_seq=req.getParameter("category_name");
		
		CategoryDAO dao = new CategoryDAO();
		
		CategoryDTO dto = new CategoryDTO();
		dto.setCategory_seq(category_seq);
		
		int result = dao.del(dto);
		
		if (result == 1) {  //성공하면 돌아갈 페이지
			resp.sendRedirect("/ddstudio/admin/category.do");
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
	}
}
