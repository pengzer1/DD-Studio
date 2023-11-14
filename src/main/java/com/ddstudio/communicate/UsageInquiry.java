package com.ddstudio.communicate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.communicate.model.InquiryDTO;
import com.ddstudio.communicate.repository.CommuDAO;

@WebServlet("/communicate/usageinquiry.do")
public class UsageInquiry extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String email = (String)session.getAttribute("email");
		String lv = (String)session.getAttribute("lv");
		
		if (email == null) {
			
			resp.sendRedirect("/ddstudio/index.do");
			
		} else {
			
			CommuDAO dao = new CommuDAO();
			
			InquiryDTO dto = dao.getUserInfo(email);
			
			req.setAttribute("seq", dto.getUser_seq());
//			req.setAttribute("name", dto.getName());
			
			String file = "";

			if (lv.equals("1")) {

				file = "add.jsp";

			} else if (lv.equals("2")) {

				file = "list.jsp";
			    
			}
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/usage-inquiry/" + file);

			dispatcher.forward(req, resp);
			
		}

	}

}
