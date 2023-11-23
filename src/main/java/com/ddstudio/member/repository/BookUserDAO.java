package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.BookUserDTO;

/**
 * 어트랙션 예약정보관련 데이터베이스 작업을 수행하는 클래스
 * 
 * @author 황주원
 *
 */
public class BookUserDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public BookUserDAO() {
		this.conn = DBUtil.open();
	}

	/**
	 * 어트랙션 예약 정보 출력
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return 예약 정보 리스트
	 */
	public ArrayList<BookUserDTO> get(String email) {

		try {

			String sql = "select * from vwBookUser where email = ? and regdate >= to_char(sysdate, 'yyyy-mm-dd')";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			ArrayList<BookUserDTO> list = new ArrayList<BookUserDTO>();

			while (rs.next()) {

				BookUserDTO dto = new BookUserDTO();

				
				dto.setBook_user_seq(rs.getString("book_user_seq"));
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

	/**
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return 이전 예약 정보 리스트
	 */
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

	/**
	 * 
	 * @param bookUserSeq 예약회원번호
	 * @return 선택한 예약 회원번호의 예약정보를 삭제
	 */
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
