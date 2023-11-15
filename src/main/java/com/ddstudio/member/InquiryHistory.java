package com.ddstudio.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ddstudio.member.model.InquiryDTO;
import com.ddstudio.member.model.VOCDTO;
import com.ddstudio.member.repository.InquiryDAO;
import com.ddstudio.member.repository.VOCDAO;

@WebServlet("/member/history/inquiry/inquiry.do")
public class InquiryHistory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// InquiryHistory.java
		// 마이페이지에서 이용문의, 칭찬/불편/건의 내용이 추가되어 보여주는 페이지
		// 1.
		String email = req.getSession().getAttribute("email").toString();
		
		String option = req.getParameter("option");

		if (option == null || option.equals("")) {
			option = "tblInquiry";
		}
		
		// 2.
		
		//if ("tblInquiry".equals(option)) {
		if (option.equals("tblInquiry")) {
			InquiryDAO inquiryDao = new InquiryDAO();
			
			ArrayList<InquiryDTO> inquiryList = inquiryDao.get(email);

			req.setAttribute("list", inquiryList);
			
		} else {
			VOCDAO VocDao = new VOCDAO();
			
			ArrayList<VOCDTO> VocList = VocDao.get(email);
			
			req.setAttribute("list", VocList);
		}
		

		req.setAttribute("option", option);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/history/inquiry/inquiry.jsp");
		dispatcher.forward(req, resp);

	}

}
