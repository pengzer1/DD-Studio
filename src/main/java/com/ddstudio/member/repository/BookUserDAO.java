package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.BookUserDTO;

public class BookUserDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public BookUserDAO() {
		this.conn = DBUtil.open();
	}

	public BookUserDTO get(String email) {
		
		try {
			
			String sql = "select * from vwBookUser where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BookUserDTO dto = new BookUserDTO();
				
				dto.setName(rs.getString("name"));
				dto.setAttraction_book_seq(rs.getString("attraction_book_seq"));
				dto.setBook_time(rs.getString("book_time"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCapacity(rs.getString("capacity"));
				
				return dto;
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
}
