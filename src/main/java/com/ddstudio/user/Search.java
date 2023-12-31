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

import com.ddstudio.user.model.SearchDTO;
import com.ddstudio.user.repository.UserDAO;

/**
 * 검색 기능을 제공하는 서블릿 클래스입니다.
 * 
 * @author 이승원
 */
@WebServlet("/user/search.do")
public class Search extends HttpServlet {

	/**
	 * 검색 페이지로 이동하는 GET 메서드입니다.
	 * 
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 검색 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/search.jsp");
		dispatcher.forward(req, resp);
	}
	
	/**
	 * 검색 기능을 수행하는 POST 메서드입니다.
	 * @param req HttpServletRequest 객체
	 * @param resp HttpServletResponse 객체
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		PrintWriter out = resp.getWriter();

		try {
			String searchWord = req.getParameter("word"); // 검색어
			
			UserDAO dao = new UserDAO();
			
			// 검색 결과
			ArrayList<SearchDTO> searchResults = dao.search(searchWord);
			
			JSONArray jsonArray = new JSONArray();

			// 검색 결과를 JSON 객체로 변환하여 배열에 추가
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

			// JSON 배열을 응답
			out.print(jsonArray.toJSONString());
		} catch (Exception e) {
			System.out.println("Search.doPost()");
			e.printStackTrace();
		}
	}
}
