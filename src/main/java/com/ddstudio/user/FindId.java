package com.ddstudio.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.ddstudio.user.model.UserDTO;
import com.ddstudio.user.repository.UserDAO;

@WebServlet("/user/findid.do")
public class FindId extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/find-id.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");

		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setName(name);
		dto.setTel(tel);
		
		UserDTO result = dao.findId(dto);

		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();

		JSONObject obj = new JSONObject();
		if (result != null) {
			obj.put("email", result.getEmail());
		} else {
			obj.put("email", null);
		}

		writer.write(obj.toString());
		writer.close();
		
	}
	
}