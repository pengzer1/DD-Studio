package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.admin.model.ThemeDTO;
import com.ddstudio.activity.model.LocationDTO;

@WebServlet("/activity/attractionadd.do")
public class AttractionAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionAdd.java
		
		//넘겨야 하는 정보
		//- 위치: select box에서 선택
		//- 테마: select box에서 선택
		//- 해시태그: select box에서 선택
		
		ActDAO dao = new ActDAO();
		
		//1. 위치 가져오기
		ArrayList<LocationDTO> locationList = dao.locationList();
		
		//2. 테마 가져오기
		ArrayList<ThemeDTO> themeList = dao.themeList();
		
		//3. 해시태그 가져오기
		ArrayList<HashTagDTO> hashtagList = dao.hashtagList();
		
		//4. 데이터 전송
		req.setAttribute("locationList", locationList);
		req.setAttribute("themeList", themeList);
		req.setAttribute("hashtagList", hashtagList);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//어트랙션 추가 처리
		
	
	
	}
}