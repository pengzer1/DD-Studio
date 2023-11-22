package com.ddstudio.communicate;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.communicate.model.LostPropertyDTO;
import com.ddstudio.communicate.repository.CommuDAO;

/**
 * LostProperty 서블릿은 분실물 정보를 처리하는 기능을 제공합니다.
 * 
 * @author 차수민
 */
@WebServlet("/communicate/lostproperty.do")
public class LostProperty extends HttpServlet {

	/**
	 * HTTP GET 요청을 처리하여 분실물 정보를 검색하고 목록 페이지로 포워딩합니다.
	 * 
	 * @param req  클라이언트의 HttpServletRequest 객체입니다.
	 * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
	 * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
	 * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String startDate = req.getParameter("start-date");
        String endDate = req.getParameter("end-date");

		String category = req.getParameter("category");
		String word = req.getParameter("word");
		String searchStatus = "n";
		
		if ((category == null && word == null) || (category.equals("") && word.equals(""))) {
			
			searchStatus = "n";
			
		} else {
			
			searchStatus = "y";
			
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
        
        if (startDate != null && endDate != null) {
        	
            try {
            	
                Date start = date.parse(startDate);
                Date end = date.parse(endDate);

                map.put("startDate", date.format(start));
                map.put("endDate", date.format(end));
                
            } catch (Exception e) {
            	
                e.printStackTrace();
                
            }
            
        }
		
		map.put("category", category);
		map.put("word", word);
		map.put("searchStatus", searchStatus);
		
		int currentPage = 0;
		
		String page = req.getParameter("page");
		
		if (page == null || page.equals("")) {
			
			currentPage = 1;
			
		} else {
			
			currentPage = Integer.parseInt(page);
			
		}

		int lostPropertyPerPage = 10;

		int startIndex = ((currentPage - 1) * lostPropertyPerPage) + 1;

		int endIndex = startIndex + lostPropertyPerPage - 1;
		
		map.put("startIndex", String.format("%d", startIndex));
		map.put("endIndex", String.format("%d", endIndex));
		
		CommuDAO dao = new CommuDAO();
		
		ArrayList<LostPropertyDTO> list = dao.getLostPropertyList(map);
		
		for (LostPropertyDTO dto : list) {
			
			String name = dto.getName();
			
			name = name.replace("<", "&lt;");
			name = name.replace(">", "&gt;");
			
			dto.setName(name);
			
			String location = dto.getLocation();
			
			location = location.replace("<", "&lt;");
			location = location.replace(">", "&gt;");
			
			dto.setLocation(location);
			
			String lostPropertyDate = dto.getLost_property_date();
			
			lostPropertyDate = lostPropertyDate.substring(0, 10);
			
			dto.setLost_property_date(lostPropertyDate);
			
		}

		int blockSize = 5;

		int pageNumber = ((currentPage - 1) / blockSize) * blockSize + 1;
		
		StringBuilder sb = new StringBuilder();
		
		int totalLostproperty = dao.getTotalLostProperty(map);
		
		int totalPages = (int)Math.ceil((double)totalLostproperty / lostPropertyPerPage);
		
		if (pageNumber != 1) {
			
			sb.append(String.format("<a href='/ddstudio/communicate/lostproperty.do?page=%d' id='previous-button'><span class='material-symbols-outlined'>navigate_before</span></a>", pageNumber - 1));
			
		}
		
		int loop = 1;
		
		while (!(loop > blockSize || pageNumber > totalPages)) {
			
			if (pageNumber == currentPage) {
				
				sb.append(String.format("<a href='#!' id='current-page'>%d</a>", pageNumber));
				
			} else {
				
				sb.append(String.format("<a href='/ddstudio/communicate/lostproperty.do?page=%d' id='other-pages'>%d</a>", pageNumber, pageNumber));
				
			}
			
			loop++;
			pageNumber++;
			
		}
		
		if (pageNumber <= totalPages) {
			
			sb.append(String.format("<a href='/ddstudio/communicate/lostproperty.do?page=%d' id='next-button'><span class='material-symbols-outlined'>navigate_next</span></a>", pageNumber));
			
		}

		req.setAttribute("list", list);
		
		req.setAttribute("map", map);

		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalLostproperty", totalLostproperty);
		req.setAttribute("totalPages", totalPages);

		req.setAttribute("pageBar", sb.toString());
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/lost-property/list.jsp");

		dispatcher.forward(req, resp);

	}

}
