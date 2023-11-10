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
import com.ddstudio.member.model.VocDTO;
import com.ddstudio.member.repository.InquiryDAO;
import com.ddstudio.member.repository.VocDAO;

@WebServlet("/member/history/inquiry/inquiry.do")
public class InquiryHistory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// InquiryHistory.java
		// 마이페이지에서 이용문의, 칭찬/불편/건의 내용이 추가되어 보여주는 페이지
		// 1.
		String option = req.getParameter("option");

		// 2.
		
		if (option.equals("tblInquiry")) {
			InquiryDAO inquiryDao = new InquiryDAO();
			ArrayList<InquiryDTO> inquiryList = inquiryDao.get();

			req.setAttribute("list", inquiryList);
			
		} else {
			VocDAO VocDao = new VocDAO();
			ArrayList<VocDTO> VocList = VocDao.get();
			
			req.setAttribute("list", VocList);
		}
		

		req.setAttribute("option", option);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/member/history/inquiry/inquiry.jsp");
		dispatcher.forward(req, resp);

	}

}
