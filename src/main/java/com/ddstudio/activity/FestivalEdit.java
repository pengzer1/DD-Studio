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
import com.ddstudio.activity.model.FestivalHashtagDTO;
import com.ddstudio.activity.model.FestivalImgDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 페스티벌을 수정하는 기능을 담당하는 서블릿 클래스입니다.
 * 페스티벌 정보, 위치, 이미지, 페스티벌의 해시태그를 데이터베이스의 각 테이블에 업데이트합니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/festivaledit.do")
public class FestivalEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//FestivalEdit.java
		String seq = req.getParameter("seq");
		
		
		//DB 접근 > 해당 seq의 페스티벌 정보 가져오기
		//- tblFestival
		//- tblFestivalImg
		//- tblFestivalHashtag
		
		ActDAO dao = new ActDAO();
		
		FestivalDTO dto = dao.getFestival(seq);
		
		LocationDTO location_dto = dao.getFestivalLocation(seq);
		
		ArrayList<FestivalImgDTO> img_list = dao.festivalImgList(seq);
		
		//해시태그 목록 가져오기(whitelist)
		ArrayList<HashTagDTO> taglist = dao.getHashtagList();
		
		int flag = 0;
		String temp = "[";
		
		for (HashTagDTO tag : taglist) {
				temp += "\"" + tag.getName() + "\",";
				flag ++;
				if (flag == taglist.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		req.setAttribute("taglist", temp);
		
		//해당 페스티벌에 입력한 태그(value) 가져오기
		ArrayList<FestivalHashtagDTO> hashtag_list = dao.festivalHashtagList(seq);
		
		flag = 0;
		temp = "[";
		
		for (FestivalHashtagDTO tag : hashtag_list) {
				temp += "\"" + tag.getHashtag_name() + "\",";
				flag ++;
				if (flag == hashtag_list.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		req.setAttribute("valuelist", temp);
		
		//날짜 유효성 검사용
		ArrayList<FestivalDTO> list = new ArrayList<FestivalDTO>();
		list.add(dto);
		req.setAttribute("list", list);
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("location_dto", location_dto);
		req.setAttribute("img_list", img_list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/festival/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//수정하기 작업
		//*주의사항: 위치가 변경되지 않으면 null 오류 발생*
		//- 이미지 > 이미지 DB에 추가(기존꺼 삭제는 안됨. 첨부한 이미지는 계속 추가만 가능)
		//- 위치 > 위치 DB
		//- 해시태그 > 해시태그 DB
		//- 나머지 > 페스티벌 DB
		
		ActDAO dao = new ActDAO();
		FestivalDTO dto = new FestivalDTO();
		ArrayList<String> fileList = new ArrayList<String>();
		
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/festival"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String seq = multi.getParameter("seq");
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
			
			//0. dto에 담아주기
			dto.setFestival_seq(seq);
			dto.setName(name);
			dto.setTime(time);
			dto.setInfo(info);
			dto.setStart_date(start_date);
			dto.setEnd_date(end_date);
			dto.setLat(lat);
			dto.setLng(lng);
			
			//** tags로 받은 JSON 형식 ArrayList<String>으로 변환
			JSONParser parser = new JSONParser();
			JSONArray arr =  (JSONArray)parser.parse(tags);
			
			ArrayList<String> taglist = new ArrayList<String>(); 
			
			for (Object obj : arr) {
				taglist.add(((JSONObject)obj).get("value").toString());
			}
			
			//1. 기존 위치 번호 가져와서 위치 정보 수정하기
			LocationDTO location_dto = dao.getFestivalLocation(seq);
			
			//NEW 위치로 덮어주기
			location_dto.setLat(lat);
			location_dto.setLng(lng);
			
			int result = dao.updateLocation(location_dto);
			
			if (result == 1) { //위치 수정 성공
				
				//2. 페스티벌 테이블에 수정
				result = dao.editFestival(dto);
				
				System.out.println("dao.EditFestival 결과: " + ((result == 1)? "성공" : "실패"));
				
				if (result == 1) { //페스티벌 테이블 수정 성공
					
					//3-1. 페스티벌 해시태그 테이블 기존 내용 삭제
					
					//3-1-1. 페스티벌 해시태그가 기 존재하는지 확인(개수 확인)
					int cnt = dao.countFestivalHashtag(seq);
					
					if (cnt > 0) { //기 존재 해시태그 삭제
						result = dao.delFestivalHashtag(seq);
						
						if (result == 0) {
							
							resp.setContentType("text/html; charset=UTF-8");
							
							PrintWriter writer = resp.getWriter();
							writer.print("<script>alert('페스티벌 해시태그 삭제에 실패했습니다.');history.back();</script>");
							writer.close();
							
						}
						
					}
					
					//기 존재 해시태그 없는 경우 바로 다음~ 해시태그 테이블에 추가하기
					
					//3-2. 페스티벌 해시태그 테이블에 추가
//					System.out.println("입력 받은 해시 태그: " + taglist.toString());
					ArrayList<String> seqlist = dao.getHashtagSeq(taglist);
					
					result = dao.addFestivalHashtag(seqlist, seq);
					
//					System.out.println("입력한 해시태그의 tblHashtag seq: " + seqlist.toString());
//					System.out.println("addFestivalHashtag 결과: " + ((result > 0)? "성공" : "실패"));
					
					if (result > 0) { //페스티벌 해시태그 추가 성공
						
						//4. 페스티벌 이미지 테이블에 추가
						Enumeration<?> files = multi.getFileNames();
						while (files.hasMoreElements()) {
							String fname = (String) files.nextElement();
							String filename = multi.getFilesystemName(fname);
							// 파일명을 이용하여 다양한 작업 수행
							// filename을 리스트에 추가하거나, DB에 저장하거나, 다른 작업 수행 가능
							if (filename != null) {
								fileList.add(filename);
							}
						}
						
						//파일이 1개 이상 추가된 경우 이미지 테이블 추가
						if(fileList.size() > 0) {
							
							result = dao.addFestivalImg(fileList, seq);
							
							System.out.println("fileList: " + fileList.toString());
							System.out.println("dao.addFestivalImg 결과: " + ((result > 0)? "성공" : "실패"));
							
							if (result > 0) { //이미지 테이블 추가 성공
								
								//**최종 수정 성공!!!!!**
								resp.sendRedirect("/ddstudio/activity/festivaldetail.do?seq=" + seq);
								
								
							} else { //이미지 테이블 추가 실패
								
								resp.setContentType("text/html; charset=UTF-8");
								
								PrintWriter writer = resp.getWriter();
								writer.print("<script>alert('페스티벌 이미지 추가에 실패했습니다.');history.back();</script>");
								writer.close();
								
							}
							
						} else { //추가된 파일이 없는 경우 바로 수정 완료
							
							resp.sendRedirect("/ddstudio/activity/festivaldetail.do?seq=" + seq);
							
						}
						
					} else { //페스티벌 해시태그 추가 실패
						
						resp.setContentType("text/html; charset=UTF-8");
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('페스티벌 해시태그 추가에 실패했습니다.');history.back();</script>");
						writer.close();
						
					}
					
				} else { //어트랙션 테이블 수정 실패
					
					resp.setContentType("text/html; charset=UTF-8");
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('페스티벌 테이블 수정에 실패했습니다.');history.back();</script>");
					writer.close();
					
				}
				
			} else { //위치 수정 실패
				
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('위치 수정에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
			
		} catch (Exception e) {
			System.out.println("at FestivalEdit.doPost");
			e.printStackTrace();
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();
	
	
	
	}
}
