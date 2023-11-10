package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.Part;

import com.ddstudio.DBUtil;

public class ReviewDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ReviewDAO() {
		this.conn = DBUtil.open();
	}

	public boolean add(String title, String content) {
		
		try {

			String sql = "insert into tblreview (review_seq, subject, content, regdate, readcount, user_book_seq) values (seqtblReview.nextVal, ?, ?, sysdate, 0, seqtblUserBook.nextVal)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			pstat.setString(2, content);
			pstat.executeUpdate();
			
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		return false;
	}

}
