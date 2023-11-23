package com.ddstudio.activity;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.ddstudio.activity.model.FestivalDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 페스티벌을 추가하는 기능을 담당하는 서블릿 클래스입니다.
 * 페스티벌 정보, 위치, 이미지, 페스티벌의 해시태그를 데이터베이스의 각 테이블에 추가합니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/festivaladd.do")
public class FestivalAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//FestivalAdd.java
		//- 해시태그 리스트 전달 > whitelist용
		ActDAO dao = new ActDAO();
		
		ArrayList<HashTagDTO> list = dao.getHashtagList();
		
		int flag = 0;
		String temp = "[";
		
		for (HashTagDTO dto : list) {
				temp += "\"" + dto.getName() + "\",";
				flag ++;
				if (flag == list.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		
		//System.out.println(temp);
		
		req.setAttribute("taglist", temp);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//페스티벌 추가 처리
		//- 이미지는 이미지 DB에 넣어주기
		//- 위치는 위치 DB에 넣어주기
		//- 해시태그는 해시태그 DB에 넣어주기
		//- 나머지는 페스티벌 DB에 넣어주기
		
		ActDAO dao = new ActDAO();
		FestivalDTO dto = new FestivalDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		String festival_seq = "";
	
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/festival"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String name = multi.getParameter("name");
			String time = multi.getParameter("time");
			String info = multi.getParameter("info");
			String start_date = multi.getParameter("start_date");
			String end_date = multi.getParameter("end_date");
			String lat = multi.getParameter("lat");
			String lng = multi.getParameter("lng");
			String tags = multi.getParameter("tags");
			String images1 = multi.getParameter("images1");
			String images2 = multi.getParameter("images2");
			String images3 = multi.getParameter("images3");
			
			dto.setName(name);
			dto.setTime(time);
			dto.setInfo(info);
			dto.setStart_date(start_date);
			dto.setEnd_date(end_date);
			dto.setLat(lat);
			dto.setLng(lng);
			
			JSONParser parser = new JSONParser();
			JSONArray arr =  (JSONArray)parser.parse(tags);
			
			ArrayList<String> taglist = new ArrayList<String>(); 
			
			for (Object obj : arr) {
				taglist.add(((JSONObject)obj).get("value").toString());
			}
			
			//1. 동일한 위치 탐색하여 없으면 위치 테이블에 추가
			int result = dao.addLocation(lat, lng);
			
			if (result == 1) { //위치 추가 성공
				
				String location_seq = dao.getLocationSeq(lat, lng);
				dto.setLocation_seq(location_seq);
				
				System.out.println("location_seq: " + location_seq);
				
				//2. 페스티벌 테이블에 추가
				result = dao.addFestival(dto);
			
				System.out.println("dao.addFestival 결과: " + ((result == 1)? "성공" : "실패"));
				
				if (result == 1) { //페스티벌 테이블 추가 성공
					
					festival_seq = dao.getFestivalSeq();
					System.out.println("festival_seq: " + festival_seq);

					//3. 페스티벌 이미지 테이블에 추가
					Enumeration<?> files = multi.getFileNames();
					while (files.hasMoreElements()) {
					    String fname = (String) files.nextElement();
					    String filename = multi.getFilesystemName(fname);
					    // 파일명을 이용하여 다양한 작업 수행
					    // filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
					    fileList.add(filename);
					}
			
					result = dao.addFestivalImg(fileList, festival_seq);
					
					System.out.println("fileList: " + fileList.toString());
					System.out.println("dao.addFestivalImg 결과: " + ((result > 0)? "성공" : "실패"));
					
					if (result > 0) { //페스티벌 이미지 추가 성공
						
						//4. 페스티벌 해시태그 테이블에 추가
						System.out.println("입력 받은 해시 태그: " + taglist.toString());
						ArrayList<String> seqlist = dao.getHashtagSeq(taglist);
						
						result = dao.addFestivalHashtag(seqlist, festival_seq);
						
						System.out.println("입력한 해시태그의 tblHashtag seq: " + seqlist.toString());
						System.out.println("addFestivalHashtag 결과: " + ((result > 0)? "성공" : "실패"));
						
						if (result > 0) { //페스티벌 해시태그 추가 성공
							
							//**최종 등록 성공!!!!!**
							resp.sendRedirect("/ddstudio/activity/festival.do");
			
						} else { //페스티벌 해시태그 추가 실패
							
							resp.setContentType("text/html; charset=UTF-8");
							
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('페스티벌 해시태그 추가에 실패했습니다.');history.back();</script>");
							writer.close();
							
						}
					
					} else { //페스티벌 이미지 추가 실패
					
						resp.setContentType("text/html; charset=UTF-8");
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('페스티벌 이미지 추가에 실패했습니다.');history.back();</script>");
						writer.close();
						
					}
					
				} else { //페스티벌 테이블 추가 실패
					
					resp.setContentType("text/html; charset=UTF-8");
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('페스티벌 테이블 등록에 실패했습니다.');history.back();</script>");
					writer.close();
					
				}
				
				
			} else { //위치 추가 실패
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('동일한 위치에 장소가 존재합니다. 다른 위치를 선택해주세요.');history.back();</script>");
				writer.close();
				
			}
			
		} catch (Exception e) {
			System.out.println("at FestivalAdd.doPost");
			e.printStackTrace();
		}
	
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();
	
	}
}