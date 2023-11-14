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

import com.ddstudio.shop.model.ItemDTO;
import com.ddstudio.shop.repository.ShopDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/shop/item/edit.do")
public class ItemEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ShopDAO dao = new ShopDAO();
		String item_seq = req.getParameter("seq");
		
		ItemDTO dto = dao.getItem(item_seq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/item/edit.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ShopDAO dao = new ShopDAO();
		ItemDTO dto = new ItemDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(req.getRealPath("/asset/image"));
			
			String item_seq = multi.getParameter("item_seq");
			String itemName = multi.getParameter("name");
			String info = multi.getParameter("info");
			int price = Integer.parseInt(multi.getParameter("price"));
			String shop_seq = multi.getParameter("shop_seq");
			
			dto.setItem_seq(item_seq);
			dto.setName(itemName);
			dto.setInfo(info);
			dto.setPrice(price);
			dto.setShop_seq(shop_seq);
			
			int result = dao.editItem(dto);
			
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
					result = dao.addRestaurantImg(fileList, dto.getItem_seq());
					
					if (result > 0) {
						resp.sendRedirect("/ddstudio/shop/item/detail.do?seq=" + dto.getItem_seq());
					} else {
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('Add Shop Img failed'); history.back();</script>");
						writer.close();
					}
				} else {
					resp.sendRedirect("/ddstudio/shop/item/detail.do?seq=" + dto.getItem_seq());
				}
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('Edit Item failed'); history.back();</script>");
				writer.close();
			}
			
		} catch (Exception e) {
			System.out.println("ItemEdit.doPost()");
			e.printStackTrace();
		}
		// 0 또는 에러
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('failed'); history.back();</script>");
				writer.close();
	}

}