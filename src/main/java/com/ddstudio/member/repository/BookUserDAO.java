package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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

	public ArrayList<BookUserDTO> get(String email) {

		try {

			String sql = "select * from vwBookUser where email = ? and regdate >= sysdate";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			ArrayList<BookUserDTO> list = new ArrayList<BookUserDTO>();

			while (rs.next()) {

				BookUserDTO dto = new BookUserDTO();

				dto.setName(rs.getString("name"));
				dto.setAttraction_book_seq(rs.getString("attraction_book_seq"));
				dto.setBook_time(rs.getString("book_time"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCapacity(rs.getString("capacity"));

				list.add(dto);
			}

			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<BookUserDTO> pget(String email) {
		try {

			String sql = "select * from vwBookUser where email = ? and regdate < sysdate";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			ArrayList<BookUserDTO> plist = new ArrayList<BookUserDTO>();

			while (rs.next()) {

				BookUserDTO dto = new BookUserDTO();

				dto.setName(rs.getString("name"));
				dto.setAttraction_book_seq(rs.getString("attraction_book_seq"));
				dto.setBook_time(rs.getString("book_time"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCapacity(rs.getString("capacity"));

				plist.add(dto);
			}

			return plist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public int del(String bookUserSeq) {
		
		int result = 0;
		
		try {

			String sql = "delete tblbookuser where book_user_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, bookUserSeq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return result;
	}
}
