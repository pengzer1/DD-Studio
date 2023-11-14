package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.admin.model.ThemeDTO;
import com.ddstudio.activity.model.LocationDTO;

@WebServlet("/activity/attraction.do")
public class Attraction extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Attraction.java

		//Step 1. 페이지 구분 없이 일단 어트랙션 테이블, 어트랙션 이미지 테이블 가지고 와서 jsp로 보내주기
		
		
		//tkfkdgo 아래 지워버려 없어도 됑!
		//0. 세션객체에 관리자 lv 담아서 전달하기
//		HttpSession session = req.getSession();
//		
//		String lv = session.getAttribute("lv").toString();
//		
//		session.setAttribute("lv", lv);
		
		ActDAO dao = new ActDAO();

		ArrayList<AttractionDTO> list = dao.attractionList();

		//조건 검색용
		//1. 테마 가져오기
		ArrayList<ThemeDTO> themeList = dao.themeList();

		//2. 위치 가져오기
		ArrayList<LocationDTO> locationList = dao.locationList();
		
		//3. 운휴일정 가져오기
		
		
		//4. 데이터 전송
		req.setAttribute("list", list);
		req.setAttribute("themeList", themeList);
		req.setAttribute("locationList", locationList);
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/list.jsp");
		dispatcher.forward(req, resp);

	}
}
