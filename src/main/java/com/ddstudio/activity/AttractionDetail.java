package com.ddstudio.activity;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.activity.model.AttractionCloseDTO;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.AttractionImgDTO;
import com.ddstudio.activity.repository.ActDAO;

@WebServlet("/activity/attractiondetail.do")
public class AttractionDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AttractionDetail.java
		
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		
		//0. 세션 정보 확인하여 세션 정보 jsp 전달 > 관리자 버튼 유무
		//1. 해당 어트랙션의 태그 가져오기
		//2. 해당 어트랙션의 이미지 여러개 가져오기
		//3. 해당 어트랙션의 정보 가져오기
		// - 운휴일정
		// - 운영시간
		// - 탑승인원
		// - 이용정보
		//4. 해당 어트랙션의 테마 가져오기
		//5. 해당 어트랙션의 위치 가져오기
		//6. 운휴 일정에 날짜 보여줄 날짜 생성하여 전달하기
		
		
		
		//2. 해당 어트랙션의 이미지 여러개 가져오기(tblAttractionImg)
		ArrayList<AttractionImgDTO> imgList = dao.attractionImgList(seq);
		//System.out.println(imgList);
		//System.out.println(seq);
		
		//3. 해당 어트랙션의 정보 가져오기(tblAttraction)
		AttractionDTO dto = dao.getAttraction(seq);
		
		//3. 해당 어트랙션의 운휴일정 가져오기(tblAttractionClose)
		AttractionCloseDTO close_dto = dao.getAttractionClose(seq);
		//System.out.println(close_dto);

		//System.out.println(dto);
		//System.out.println(close_dto);
		
		
		
		
		//6. 운휴 일정에 날짜 보여줄 날짜 생성하여 전달하기
		Date today = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("M/d");
		String now = formatter.format(today);
		
		
		
		//jsp로 객체에 담아 전달
		req.setAttribute("imgList", imgList);
		req.setAttribute("dto", dto);
		req.setAttribute("close_dto", close_dto);
		req.setAttribute("now", now);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/attraction/detail.jsp");
		dispatcher.forward(req, resp);

	}
}
