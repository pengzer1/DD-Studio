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

public class ReviewDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ReviewDAO() {
		this.conn = DBUtil.open();
	}

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

	public ArrayList<ReviewDTO> get(String email) {
		
		try {
			
			String sql = "select * from tblreview where email = ?";
			
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
				
				list.add(dto);
			}	
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

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
	

}
