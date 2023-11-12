package com.ddstudio.test;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.test.model.CourseDTO;
import com.ddstudio.test.repository.TestDAO;
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
										req,
										req.getRealPath("/asset/image/course"),
										1024 * 1024 * 10,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
			//System.out.println(req.getRealPath("/asset/image/test/course")); //사진 저장 경로 확인
			
			String name = multi.getParameter("name");
			String img = multi.getFilesystemName("img");
			
			CourseDTO dto = new CourseDTO();
			
			dto.setName(name);
			
			//사진
			if (img != null && !img.equals("")) {
				dto.setImg(img);
			} else {
				dto.setImg("course.png");
			}
			
			TestDAO dao = new TestDAO();
			
			int result = dao.courseAdd(dto);
			
			if (result == 1) {
				resp.sendRedirect("/ddstudio/test/recommend.do");
			}			
			
		} catch (Exception e) {
			System.out.println("CourseAdd.doPost()");
			e.printStackTrace();
		}
		
		//0 또는 에러
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed');history.back();</script>");
		writer.close();
		
	}

}