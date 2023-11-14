package com.ddstudio.activity;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.activity.model.LocationDTO;

@WebServlet("/activity/attractionadd.do")
public class AttractionAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionAdd.java
		
		//넘겨야 하는 정보
		//- 해시태그: select box에서 선택
		
		ActDAO dao = new ActDAO();
		
		//2. 해시태그 가져오기
		ArrayList<HashTagDTO> hashtagList = dao.hashtagList();
		
		//3. 데이터 전송
//		req.setAttribute("locationList", locationList);
//		req.setAttribute("themeList", themeList);
		req.setAttribute("hashtagList", hashtagList);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//어트랙션 추가 처리
		//- 이미지는 이미지 DB에 넣어주기
		//- 나머지는 어트랙션 DB에 넣어주기
		
	
	
	}
}