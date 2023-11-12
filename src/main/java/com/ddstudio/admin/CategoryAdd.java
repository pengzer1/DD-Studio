package com.ddstudio.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.ddstudio.admin.model.CategoryDTO;
import com.ddstudio.admin.repository.CategoryDAO;

@WebServlet("/admin/categoryadd.do")
public class CategoryAdd extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/category/add.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//1.
			String name=req.getParameter("name");
			
			//2.
			CategoryDAO dao = new CategoryDAO();
			CategoryDTO dto = new CategoryDTO();
			
			dto.setName(name);
			
			int result=dao.add(dto);
			
			//3.
			if (result == 1) {  //성공시
				resp.sendRedirect("/toy/board/list.do");
			}
			
		} catch (Exception e) {
			System.out.println("CategoryAdd.doPost");
			e.printStackTrace();
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed');history.back();</script>");
		writer.close();
		
	}
}
