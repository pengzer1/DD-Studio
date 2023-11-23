package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.AttractionCloseDTO;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.repository.ActDAO;

/**
 * 어트랙션 페이지로 이동하는 서블릿 클래스입니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/attraction.do")
public class Attraction extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Attraction.java
		//- 조건 검색기능 O > 페이지 구분 X (조건 검색: 운휴일정)
		
		req.removeAttribute("close");
		String close = req.getParameter("close");
		
		if (close == null || close.equals("")) {
			close = "";
		}
		
		//close = ""
		//close = "open"
		//close = "close"
		
		//어트랙션 정보 가져오기
		ActDAO dao = new ActDAO();

		ArrayList<AttractionDTO> list = dao.attractionList(close);

		//4. 데이터 전송
		req.setAttribute("list", list);
		req.setAttribute("close", close);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/list.jsp");
		dispatcher.forward(req, resp);

	}
	
}
