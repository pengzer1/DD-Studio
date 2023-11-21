package com.ddstudio.communicate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.LostPropertyDTO;
import com.ddstudio.communicate.repository.CommuDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * LostPropertyAdd 서블릿은 분실물 정보를 추가하는 기능을 제공합니다.
 * 
 * @version 1.0
 */
@WebServlet("/communicate/lostpropertyadd.do")
public class LostPropertyAdd extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리하여 분실물 정보 추가 페이지로 포워딩합니다.
	 * 
	 * @param req  클라이언트의 HttpServletRequest 객체입니다.
	 * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
	 * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
	 * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/lost-property/add.jsp");

		dispatcher.forward(req, resp);

	}
	
	/**
	 * HTTP POST 요청을 처리하여 분실물 정보를 받아와 데이터베이스에 추가합니다.
	 * 
	 * @param req  클라이언트의 HttpServletRequest 객체입니다.
	 * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
	 * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
	 * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String type = multi.getParameter("type");
			String name = multi.getParameter("name");
			String location = multi.getParameter("location");
			String date = multi.getParameter("date");
			String file = multi.getFilesystemName("file");
			
			LostPropertyDTO dto = new LostPropertyDTO();

			dto.setType(type);
			dto.setName(name);
			dto.setLocation(location);
			dto.setLost_property_date(date);
			dto.setImg(file);
			
			CommuDAO dao = new CommuDAO();
			
			int result = dao.addLostProperty(dto);
			
			if (result == 1) {
				
				resp.sendRedirect("/ddstudio/communicate/lostproperty.do");
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<script>");
		writer.println("alert('failed');");
		writer.println("history.back();");
		writer.println("</script>");
		
		writer.close();

	}

}
