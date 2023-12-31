package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.FestivalDTO;
import com.ddstudio.activity.model.FestivalHashtagDTO;
import com.ddstudio.activity.model.FestivalImgDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.repository.ActDAO;

/**
 * 페스티벌의 상세 페이지로 이동하는 서블릿 클래스입니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/festivaldetail.do")
public class FestivalDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//FestivalDetail.java
		String seq = req.getParameter("seq");
		
		//1. 해당 페스티벌 태그 가져오기
		//2. 해당 페스티벌의 이미지 여러개 가져오기
		//3. 해당 페스티벌의 정보 가져오기
		//4. 해당 페스티벌의 위치 가져오기
		
		//2. DB 접근
		ActDAO dao = new ActDAO();
		
		//1. 해당 페스티벌 태그 가져오기 > festivalhashtagDTO
		ArrayList<FestivalHashtagDTO> hashtagList = dao.festivalHashtagList(seq);
		
		//2. 해당 페스티벌의 이미지 여러개 가져오기(tblFestivalImg)
		ArrayList<FestivalImgDTO> imgList = dao.festivalImgList(seq);
		
		//3. 해당 페스티벌의 정보 가져오기(tblFestival)
		//- 이름, 시간, 정보, 시작일, 종료일
		FestivalDTO dto = dao.getFestival(seq);
		
		//4. 해당 페스티벌의 위치 가져오기(tblLocation)
		LocationDTO location_dto = dao.getFestivalLocation(seq);

		req.setAttribute("hashtagList", hashtagList);
		req.setAttribute("imgList", imgList);
		req.setAttribute("dto", dto);
		req.setAttribute("location_dto", location_dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/detail.jsp");
		dispatcher.forward(req, resp);

	}
}
