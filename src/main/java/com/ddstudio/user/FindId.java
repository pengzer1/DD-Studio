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
		// 아이디 찾기 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/find-id.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name"); // 이름
		String tel = req.getParameter("tel"); // 전화번호

		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setName(name);
		dto.setTel(tel);
		
		// 입력한 정보로 아이디 찾기
		UserDTO result = dao.findId(dto);

		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();

		// 회원 정보가 있을 경우 아이디 전달
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