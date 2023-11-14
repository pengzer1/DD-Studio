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

@WebServlet("/shop/item/add.do")
public class ItemAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String shop_seq = req.getParameter("shop_seq");
		
		req.setAttribute("shop_seq", shop_seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/item/add.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// multiple DATA라 req.getParameter() 동작 불가 > MultipartRequest로 대체해야댐
		ShopDAO dao = new ShopDAO();
		ItemDTO dto = new ItemDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		String item_seq = "";
		
		try {
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println(req.getRealPath("/asset/image"));
			
			String itemName = multi.getParameter("name");
			String info = multi.getParameter("info");
			int price = Integer.parseInt(multi.getParameter("price"));
			String shop_seq = multi.getParameter("shop_seq");
			
			dto.setName(itemName);
			dto.setInfo(info);
			dto.setPrice(price);
			dto.setShop_seq(shop_seq);
			
			int result = dao.addItem(dto);
			
			if(result == 1) {
				item_seq = dao.getItemSeq();
				
				Enumeration<?> files = multi.getFileNames();
				while (files.hasMoreElements()) {
				    String name = (String) files.nextElement();
				    String filename = multi.getFilesystemName(name);
				    // 파일명을 이용하여 다양한 작업 수행
				    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
				    fileList.add(filename);
				}
				
				result = dao.addItemImg(fileList, item_seq);
				
				if (result > 0) {
					resp.sendRedirect("/ddstudio/shop/giftshop/detail.do?seq=" + shop_seq);
				} else {
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('Add Item Img failed'); history.back();</script>");
					writer.close();
				}
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('Add Item failed'); history.back();</script>");
				writer.close();
			}
			
		} catch (Exception e) {
			System.out.println("ItemAdd.doPost()");
			e.printStackTrace();
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();
		
	}

}