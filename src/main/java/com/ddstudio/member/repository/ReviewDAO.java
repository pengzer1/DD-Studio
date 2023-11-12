package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.Part;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.ReviewDTO;

public class ReviewDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ReviewDAO() {
		this.conn = DBUtil.open();
	}

	public boolean add(String subject, String content, String user_book_seq) {
		
		try {
			
			

			String sql = "insert into tblreview (review_seq, subject, content, regdate, readcount, user_book_seq) values (seqtblReview.nextVal, ?, ?, sysdate, 0, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, subject);
			pstat.setString(2, content);
			pstat.setString(3, user_book_seq);
			pstat.executeUpdate();
			
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		return false;
	}

	public ArrayList<ReviewDTO> get(String email) {
		
		try {
			
			String sql = "select * from vwuserbook where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();	
			
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_seq(rs.getString("review_seq"));
				dto.setSubject(rs.getString("subject"));
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

	

	

}
