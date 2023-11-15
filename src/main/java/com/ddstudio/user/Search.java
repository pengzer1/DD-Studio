package com.ddstudio.user;

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

import com.ddstudio.user.repository.SearchDTO;
import com.ddstudio.user.repository.UserDAO;

@WebServlet("/user/search.do")
public class Search extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/search.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		PrintWriter out = resp.getWriter();

		try {
			String searchWord = req.getParameter("word");
			UserDAO dao = new UserDAO();
			ArrayList<SearchDTO> searchResults = dao.search(searchWord);

			JSONArray jsonArray = new JSONArray();

			for (SearchDTO result : searchResults) {
				JSONObject jsonObject = new JSONObject();
				
				jsonObject.put("attractionName", result.getAttractionName());
				jsonObject.put("mbtiResult", result.getMbtiResult());
				jsonObject.put("mbtiMbti", result.getMbtiMbti());
				jsonObject.put("courseName", result.getCourseName());
				jsonObject.put("hashtagName", result.getHashtagName());
				jsonObject.put("restaurantName", result.getRestaurantName());
				jsonObject.put("restaurantMenu", result.getRestaurantMenu());
				jsonObject.put("categoryName", result.getCategoryName());
				jsonObject.put("shopName", result.getShopName());
				jsonObject.put("shopInfo", result.getShopInfo());
				jsonObject.put("itemName", result.getItemName());
				jsonObject.put("itemInfo", result.getItemInfo());
				jsonObject.put("convenientName", result.getConvenientName());
				jsonObject.put("festivalName", result.getFestivalName());
				jsonObject.put("festivalInfo", result.getFestivalInfo());
				jsonObject.put("theaterName", result.getTheaterName());
				jsonObject.put("movieName", result.getMovieName());
				jsonObject.put("noticeSubject", result.getNoticeSubject());
				jsonObject.put("noticeContent", result.getNoticeContent());
				jsonObject.put("benefitName", result.getBenefitName());
				jsonObject.put("benefitType", result.getBenefitType());
				jsonObject.put("faqCategory", result.getFaqCategory());
				jsonObject.put("faqQuestion", result.getFaqQuestion());
				jsonObject.put("faqAnswer", result.getFaqAnswer());

				jsonArray.add(jsonObject);
				// System.out.println(jsonObject);
			}

			out.print(jsonArray.toJSONString());
		} catch (Exception e) {
			System.out.println("Search.doPost()");
			e.printStackTrace();
		}
	}
}
