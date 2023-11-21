package com.ddstudio.activity;

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
import org.json.simple.parser.JSONParser;

import com.ddstudio.activity.model.MovieDTO;
import com.ddstudio.activity.model.MovieHashtagDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/activity/movieedit.do")
public class MovieEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MovieEdit.java
		String seq = req.getParameter("seq");
		
		ActDAO dao = new ActDAO();
		MovieDTO dto = dao.getMovie(seq);
		
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
		
		//해당 영화에 입력한 태그(value) 가져오기
		ArrayList<MovieHashtagDTO> hashtag_list = dao.movieHashtagList(seq);
		
		flag = 0;
		temp = "[";
		
		for (MovieHashtagDTO tag : hashtag_list) {
				temp += "\"" + tag.getHashtag_name() + "\",";
				flag ++;
				if (flag == hashtag_list.size()) {
					temp = temp.substring(0, temp.length()-1) + "]";
				}
		}
		req.setAttribute("valuelist", temp);
		
		req.setAttribute("seq", seq);
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		//영화 테이블 수정
//		//영화 상영 테이블 수정
//		//영화/해시태그 테이블 수정
//		
//		ActDAO dao = new ActDAO();
//		MovieDTO dto = new MovieDTO();
//
//		
//		try {
//			
//			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/movie"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
//			
//			String seq = multi.getParameter("seq");
//			String name = multi.getParameter("name"); //영화명(tblMovie)
//			String time = multi.getParameter("time"); //상영시간(tblMoviePlay)
//			String runningtime = multi.getParameter("runningtime"); //러닝타임(tblMovie)
//			String start_date = multi.getParameter("start_date"); //상영시작일(tblMoviePlay)
//			String end_date = multi.getParameter("end_date"); //상영종료일(tblMoviePlay)
//			String theater_seq = multi.getParameter("theater"); //영화관번호(tblMoviePlay)
//			String tags = multi.getParameter("tags"); //tblMovieHashtag
//			String image = multi.getParameter("image"); //tblMovie
//			String preview = multi.getParameter("preview"); //tblMovie
//			
//			
//			dto.setMovie_seq(seq); //tblMovie
//			dto.setMovie_name(name); //tblMovie
//			dto.setStart_date(start_date); //tblMovie
//			dto.setEnd_date(end_date); //tblMovie
//			dto.setRunningtime(runningtime); //tblMovie
//			dto.setImg(image); //tblMovie
//			dto.setPreview(preview); //tblMovie
//			
//			dto.setStart_time(time); //tblMoviePlay
//			dto.setTheater_seq(theater_seq); //tblMoviePlay
//			
//			JSONParser parser = new JSONParser();
//			JSONArray arr =  (JSONArray)parser.parse(tags);
//			
//			ArrayList<String> taglist = new ArrayList<String>(); 
//			
//			for (Object obj : arr) {
//				taglist.add(((JSONObject)obj).get("value").toString());
//			}
//			
//			//1. 영화 테이블에 수정
//			int result = dao.editMovie(dto);
//		
//			if (result == 1) { //영화 테이블 수정 성공
//				
//				//2. 영화상영 테이블에 수정
//				result = dao.editMoviePlay(dto);
//				
//				if (result == 1) { //영화상영 테이블 수정 성공
//					
//					//3. 영화/해시태그 테이블 수정
//					ArrayList<String> seqlist = dao.getHashtagSeq(taglist);
//					
//					result = dao.addMovieHashtag(seqlist, movie_seq);
//					
//					if (result > 0) { //영화 해시태그 수정 성공
//						
//						//**최종 수정 성공!!!!!**
//						resp.sendRedirect("/ddstudio/activity/movie.do?");
//		
//					} else { //영화 해시태그 추가 실패
//						
//						resp.setContentType("text/html; charset=UTF-8");
//						
//						PrintWriter writer = resp.getWriter();
//						writer.print("<script>alert('영화 해시태그 추가에 실패했습니다.');history.back();</script>");
//						writer.close();
//						
//					}
//					
//				} else { //영화상영 테이블 추가 실패
//					
//					resp.setContentType("text/html; charset=UTF-8");
//					
//					PrintWriter writer = resp.getWriter();
//					writer.print("<script>alert('영화상영 테이블 추가에 실패했습니다.');history.back();</script>");
//					writer.close();
//					
//				}
//
//			} else { //영화 테이블 추가 실패
//			
//				resp.setContentType("text/html; charset=UTF-8");
//				
//				PrintWriter writer = resp.getWriter();
//				writer.print("<script>alert('영화 테이블 추가에 실패했습니다.');history.back();</script>");
//				writer.close();
//				
//			}
//				
//		} catch (Exception e) {
//			System.out.println("at MovieAdd.doPost");
//			e.printStackTrace();
//		}
//	
//		PrintWriter writer = resp.getWriter();
//		writer.print("<script>alert('failed'); history.back();</script>");
//		writer.close();
//
//		
//		
//	
//	}
}