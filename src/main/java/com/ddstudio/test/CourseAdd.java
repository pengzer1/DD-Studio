package com.ddstudio.test;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.user.model.UserDTO;
import com.ddstudio.user.repository.UserDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/test/courseadd.do")
public class CourseAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/course/add.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			MultipartRequest multi = new MultipartRequest(
										req, //Request
										req.getRealPath("/asset/pic"), //업로드 폴더 경로
										1024 * 1024 * 10, //파일의 크기
										"UTF-8", //인코딩 방식을 바꾸기 때문에 따로 한글 처리를 하지 않아도 된다.
										new DefaultFileRenamePolicy()
									);
			//System.out.println(req.getRealPath("/asset/pic"));
			//사진 저장 경로 확인
			
			String id = multi.getParameter("id");
			String pw = multi.getParameter("pw");
			String name = multi.getParameter("name");
			String email = multi.getParameter("email");
			String pic = multi.getFilesystemName("pic"); //사진은 geteParameter로 가져오지 않으며, 파일 이름으로 가져와야 한다.
			String intro = multi.getParameter("intro");
			
			//System.out.println(intro);
			
			UserDTO dto = new UserDTO();
			
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setEmail(email);
			
			//사진
			if (pic != null && !pic.equals("")) {
				dto.setPic(pic);
			} else {
				dto.setPic("pic.png");
			}
			
			dto.setIntro(intro);
			
			UserDAO dao = new UserDAO();
			
			int result = dao.register(dto);
			
			if (result == 1) {
				resp.sendRedirect("/toy/index.do");
			}			
			
		} catch (Exception e) {
			System.out.println("Register.doPost()");
			e.printStackTrace();
		}
		
		//0 또는 에러
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed');history.back();</script>");
		writer.close();
		
	}

}