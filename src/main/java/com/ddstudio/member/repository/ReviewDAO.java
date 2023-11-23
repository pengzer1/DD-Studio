package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.Part;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.ReviewDTO;
import com.ddstudio.member.model.ReviewImgDTO;

/**
 * 리뷰정보관련 데이터베이스 작업을 수행하는 클래스
 * 
 * @author 황주원
 *
 */
public class ReviewDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ReviewDAO() {
		this.conn = DBUtil.open();
	}

	/**
	 * 리뷰 작성
	 * 
	 * @param dto 리뷰정보를 담는 데이터 전송 객체
	 * @return
	 */
	public int add(ReviewDTO dto) {
		
		try {

			String sql = "insert into tblreview (review_seq, subject, content, regdate, readcount, user_book_seq) values (seqtblreview.nextVal, ?, ?, sysdate, 0, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getUser_book_seq());

			
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	/**
	 * 로그인한 회원의 리뷰 내역 출력
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return
	 */
	public ArrayList<ReviewDTO> get(String email) {
		
		try {
			
			String sql = "select * from vwreview where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();	
			
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_seq(rs.getString("review_seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				//dto.setUser_book_seq(rs.getString("user_book_seq"));
				
				list.add(dto);
			}	
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * 첨부파일 추가
	 * 
	 * @param idto 리뷰이미지 정보를 담는 데이터 전송 객체
	 * @return
	 */
	public int addFile(ReviewImgDTO idto) {
		
		try {

			String sql = "insert into tblReviewImg(review_img_seq, img, review_seq) values (seqtblReviewImg.nextVal, ?, ?)";

			System.out.println(idto);
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, idto.getImg());
			pstat.setString(2, idto.getReview_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
		
	}

	/**
	 * 리뷰의 마지막 seq를 가져옴
	 * 
	 * @return
	 */
	public String getReviewSeq() {
		
		try {

			String sql = "select max(review_seq) as seq from tblreview";

			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);

			if (rs.next()) {
			
				return rs.getString("seq");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * 리뷰 자세히보기 출력
	 * 
	 * @param seq 리뷰 번호
	 * @return
	 */
	public ReviewDTO detail(String seq) {
		
		try {
			
			String sql = "select * from tblReview where review_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_seq(rs.getString("review_seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				
				return dto;
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	

}
