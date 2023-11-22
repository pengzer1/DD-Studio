package com.ddstudio.shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.shop.model.CategoryDTO;
import com.ddstudio.shop.model.RestaurantDTO;
import com.ddstudio.shop.repository.ShopDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 레스토랑 수정 서블릿 입니다.
 * 선택한 레스토랑을 수정 하는 기능을 처리합니다.
 * @author pega0
 *
 */
@WebServlet("/shop/restaurant/edit.do")
public class RestaurantEdit extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리합니다.
     * 
     * 레스토랑 수정 페이지로 포워딩합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String restaurant_seq = req.getParameter("seq");

		ShopDAO dao = new ShopDAO();

		RestaurantDTO dto = dao.getRestaurant(restaurant_seq);

		ArrayList<CategoryDTO> list = dao.getCategory();

		req.setAttribute("list", list);

		String[] times = dto.getTime().split(" ");

		dto.setStart_date(times[0]);
		dto.setEnd_date(times[2]);

		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/restaurant/edit.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * HTTP POST 요청을 처리합니다.
     * 
     * 클라이언트로부터 받은 레스토랑 정보 및 이미지를 처리하고, 결과에 따라 성공 또는 실패 메시지를 표시합니다.
     * 
     * @param req  HTTP 요청 객체
     * @param resp HTTP 응답 객체
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// multiple DATA라 req.getParameter() 동작 불가 > MultipartRequest로 대체해야댐
		ShopDAO dao = new ShopDAO();
		RestaurantDTO dto = new RestaurantDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		
		try {
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(req.getRealPath("/asset/image"));
			
			String restaurant_seq = multi.getParameter("restaurant_seq");
			String restaurantName = multi.getParameter("name");
			String menu = multi.getParameter("menu");
			String startTime = multi.getParameter("start-time");
			String endTime = multi.getParameter("end-time");
			
			String time = startTime + " - " + endTime;
			
			String capacity = multi.getParameter("capacity");
			String tel = multi.getParameter("tel");
			String lng = multi.getParameter("lng");
			String lat = multi.getParameter("lat");
			String category_seq = multi.getParameter("category");
			
			dto.setRestaurant_seq(restaurant_seq);
			dto.setName(restaurantName);
			dto.setMenu(menu);
			dto.setTime(time);
			dto.setCapacity(capacity);
			dto.setTel(tel);
			dto.setLat(lat);
			dto.setLng(lng);
			dto.setCategory_seq(category_seq);
			
			dao.addLocation(dto);
			
			String location_seq = dao.getLocationSeq(dto);
			
			if (location_seq != null) {
				dto.setLocation_seq(location_seq);
				
				int result = dao.editRestaurant(dto);
				
				if (result == 1) {
					Enumeration<?> files = multi.getFileNames();
					
					while (files.hasMoreElements()) {
					    String name = (String) files.nextElement();
					    String filename = multi.getFilesystemName(name);
					    // 파일명을 이용하여 다양한 작업 수행
					    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
					    if (filename != null) {
					    	fileList.add(filename);
					    }
					}
					
					if(fileList.size() > 0) {
						result = dao.addRestaurantImg(fileList, dto.getRestaurant_seq());
						
						if (result > 0) {
							resp.sendRedirect("/ddstudio/shop/restaurant/detail.do?seq=" + dto.getRestaurant_seq());
						} else {
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('Add Shop Img failed'); history.back();</script>");
							writer.close();
						}
					} else {
						resp.sendRedirect("/ddstudio/shop/restaurant/detail.do?seq=" + dto.getRestaurant_seq());
					}
				} else {
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Edit Shop failed'); history.back();</script>");
					writer.close();
				}
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('location failed'); history.back();</script>");
				writer.close();
			}
		} catch (Exception e) {
			System.out.println("RestaurantEdit.doPost()");
			e.printStackTrace();
		}

		// 0 또는 에러
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();
	}

}