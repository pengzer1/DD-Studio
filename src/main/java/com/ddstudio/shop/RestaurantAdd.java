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


@WebServlet("/shop/restaurant/add.do")
public class RestaurantAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ShopDAO dao = new ShopDAO();
		
		ArrayList<CategoryDTO> list = dao.getCategory();
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/restaurant/add.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// multiple DATA라 req.getParameter() 동작 불가 > MultipartRequest로 대체해야댐
		ShopDAO dao = new ShopDAO();
		RestaurantDTO dto = new RestaurantDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		String restaurant_seq = "";
		
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(req.getRealPath("/asset/image"));
			
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
			
			dto.setName(restaurantName);
			dto.setMenu(menu);
			dto.setTime(time);
			dto.setCapacity(capacity);
			dto.setTel(tel);
			dto.setLat(lat);
			dto.setLng(lng);
			dto.setCategory(category_seq);
			
			dao.addLocation(dto);
			
			String location_seq = dao.getLocationSeq(dto);
			
			if (location_seq != null) {
				dto.setLocation_seq(location_seq);
				
				int result = dao.addRestaurant(dto);
				
				if(result == 1) {
					restaurant_seq = dao.getRestaurantSeq();
					
					Enumeration<?> files = multi.getFileNames();
					while (files.hasMoreElements()) {
					    String name = (String) files.nextElement();
					    String filename = multi.getFilesystemName(name);
					    // 파일명을 이용하여 다양한 작업 수행
					    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
					    fileList.add(filename);
					}
					
					result = dao.addRestaurantImg(fileList, restaurant_seq);
					
					if (result > 0) {
						resp.sendRedirect("/ddstudio/shop/restaurant.do");
					} else {
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Add Restaurant Img failed'); history.back();</script>");
						writer.close();
					}
				} else {
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Add Restaurant failed'); history.back();</script>");
					writer.close();
				}
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('location failed'); history.back();</script>");
				writer.close();
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("RestaurantAdd.doPost()");
			e.printStackTrace();
		}
		
		// 0 또는 에러
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('failed'); history.back();</script>");
				writer.close();
		
	}
	

}