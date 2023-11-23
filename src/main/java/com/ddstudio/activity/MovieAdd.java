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

import com.ddstudio.activity.model.MovieDTO;
import com.ddstudio.activity.model.TheaterDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.admin.model.HashTagDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 영화를 추가하는 기능을 담당하는 서블릿 클래스입니다.
 * 영화 정보, 영화 상영 정보, 영화의 해시태그를 데이터베이스의 각 테이블에 추가합니다.
 * 
 * @author 박나래
 *
 */
@WebServlet("/activity/movieadd.do")
public class MovieAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MovieAdd.java
		
		ActDAO dao = new ActDAO();
		
		//영화관 목록 전달
		ArrayList<TheaterDTO> theater_list = dao.theaterList();
		
		//해시태그 리스트 전달 > whitelist용
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
		req.setAttribute("taglist", temp);
		req.setAttribute("theater_list", theater_list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/activity/movie/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ActDAO dao = new ActDAO();
		MovieDTO dto = new MovieDTO();
		String movie_seq = "";
		
		//1. 영화 테이블 생성
		//2. 영화상영 테이블에 추가
		//3. 영화/해시태그 테이블 추가
		
		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/image/movie"), 1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
			
			String name = multi.getParameter("name"); //영화명(tblMovie)
			String time = multi.getParameter("time"); //상영시간(tblMoviePlay)
			String runningtime = multi.getParameter("runningtime"); //러닝타임(tblMovie)
			String start_date = multi.getParameter("start_date"); //상영시작일(tblMoviePlay)
			String end_date = multi.getParameter("end_date"); //상영종료일(tblMoviePlay)
			String theater_seq = multi.getParameter("theater"); //영화관번호(tblMoviePlay)
			String tags = multi.getParameter("tags"); //tblMovieHashtag
			String image = multi.getParameter("image"); //tblMovie
			String preview = multi.getParameter("preview"); //tblMovie
			
			dto.setMovie_name(name); //tblMovie
			dto.setStart_date(start_date); //tblMovie
			dto.setEnd_date(end_date); //tblMovie
			dto.setRunningtime(runningtime); //tblMovie
			dto.setImg(image); //tblMovie
			dto.setPreview(preview); //tblMovie
			
			dto.setStart_time(time); //tblMoviePlay
			dto.setTheater_seq(theater_seq); //tblMoviePlay
			
			JSONParser parser = new JSONParser();
			JSONArray arr =  (JSONArray)parser.parse(tags);
			
			ArrayList<String> taglist = new ArrayList<String>(); 
			
			for (Object obj : arr) {
				taglist.add(((JSONObject)obj).get("value").toString());
			}
			
			//1. 영화 테이블에 추가
			int result = dao.addMovie(dto);
		
			if (result == 1) { //영화 테이블 추가 성공
				
				movie_seq = dao.getMovieSeq();
				
				dto.setMovie_seq(movie_seq);
				
				//2. 영화상영 테이블에 추가
				result = dao.addMoviePlay(dto);
				
				if (result == 1) { //영화상영 테이블 추가 성공
					
					//3. 영화/해시태그 테이블 추가
					ArrayList<String> seqlist = dao.getHashtagSeq(taglist);
					
					result = dao.addMovieHashtag(seqlist, movie_seq);
					
					if (result > 0) { //영화 해시태그 추가 성공
						
						//**최종 등록 성공!!!!!**
						resp.sendRedirect("/ddstudio/activity/movie.do");
		
					} else { //영화 해시태그 추가 실패
						
						resp.setContentType("text/html; charset=UTF-8");
						
						PrintWriter writer = resp.getWriter();
						writer.print("<script>alert('영화 해시태그 추가에 실패했습니다.');history.back();</script>");
						writer.close();
						
					}
					
				} else { //영화상영 테이블 추가 실패
					
					resp.setContentType("text/html; charset=UTF-8");
					
					PrintWriter writer = resp.getWriter();
					writer.print("<script>alert('영화상영 테이블 추가에 실패했습니다.');history.back();</script>");
					writer.close();
					
				}

			} else { //영화 테이블 추가 실패
			
				resp.setContentType("text/html; charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('영화 테이블 추가에 실패했습니다.');history.back();</script>");
				writer.close();
				
			}
				
		} catch (Exception e) {
			System.out.println("at MovieAdd.doPost");
			e.printStackTrace();
		}
	
		PrintWriter writer = resp.getWriter();
		writer.print("<script>alert('failed'); history.back();</script>");
		writer.close();



	
	
	}
}
