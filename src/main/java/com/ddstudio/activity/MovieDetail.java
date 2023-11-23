package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.MovieDTO;
import com.ddstudio.activity.model.MovieHashtagDTO;
import com.ddstudio.activity.repository.ActDAO;

/**
 * 영화의 상세 페이지로 이동하는 서블릿 클래스입니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/moviedetail.do")
public class MovieDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MovieDetail.java
		String seq = req.getParameter("seq");
		
		//1. 해당 영화 해시태그 가져오기
		//2. 해당 영화 정보 가져오기
		//3. 해당 영화가 상영중인 영화관 정보 가져오기
		
		ActDAO dao = new ActDAO();
		
		//1. 해당 영화 해시태그 가져오기
		ArrayList<MovieHashtagDTO> hashtagList = dao.movieHashtagList(seq);
		
		//2. 해당 영화 정보 가져오기
		MovieDTO dto = dao.getMovie(seq);
		
		//3. 해당 영화가 상영중인 영화관 정보 가져오기(tblTheater + tblLocation) > 2번에서 다 가져옴
		//TheaterDTO theater_dto = dao.getTheater(seq);
		
		
		req.setAttribute("hashtagList", hashtagList);
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/detail.jsp");
		dispatcher.forward(req, resp);

	}
}
