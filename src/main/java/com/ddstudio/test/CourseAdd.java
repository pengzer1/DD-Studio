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

/**
 * 코스를 추가하는 기능을 담당하는 서블릿 클래스입니다.
 * 이미지 파일을 업로드하고, 코스 정보를 데이터베이스에 추가합니다.
 * 
 * @author 이승원
 */
@WebServlet("/test/courseadd.do")
public class CourseAdd extends HttpServlet {

	/**
	 * 코스 추가 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 코스 추가 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/course/add.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * 코스 정보를 받아와 데이터베이스에 추가하는 POST 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			// 파일 업로드 MultipartRequest 객체
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("/asset/image/course"),
										1024 * 1024 * 10,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
			//이미지 저장 경로 확인
			//System.out.println(req.getRealPath("/asset/image/test/course"));
			
			String name = multi.getParameter("name"); // 이름
			String img = multi.getFilesystemName("img"); // 이미지
			
			CourseDTO dto = new CourseDTO();
			
			dto.setName(name);
			
			//이미지가 업로드 되었는지 확인 후 설정
			if (img != null && !img.equals("")) {
				dto.setImg(img);
			} else {
				dto.setImg("course.png"); // 기본 이미지
			}
			
			TestDAO dao = new TestDAO();
			
			// 코스 추가
			int result = dao.courseAdd(dto);
			
			// 코스 추가 성공 시 추천 페이지로 이동
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
