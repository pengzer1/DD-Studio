package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.UserBookDTO;

/**
 * 회원 예매정보관련 데이터베이스 작업을 수행하는 클래스
 * 
 * @author 황주원
 *
 */
public class UserBookDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserBookDAO() {
		this.conn = DBUtil.open();
	}

	/**
	 * 예매 내역 정보 출력
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return 
	 */
	public ArrayList<UserBookDTO> get(String email) {

		try {

			String sql = "select * from vwUserBook where email = ? AND visit_date > SYSDATE";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			ArrayList<UserBookDTO> list = new ArrayList<UserBookDTO>();

			while (rs.next()) {

				UserBookDTO dto = new UserBookDTO();

				dto.setUser_book_seq(rs.getString("user_book_seq"));
				dto.setUser_seq(rs.getString("user_seq"));
				dto.setTicket_book_seq(rs.getString("ticket_book_seq"));
				dto.setBook_date(rs.getString("book_date"));
				dto.setVisit_date(rs.getString("visit_date"));
				dto.setEa(rs.getString("ea"));
				dto.setTicket_seq(rs.getString("ticket_seq"));
				dto.setBenefit_seq(rs.getString("benefit_seq"));
				dto.setDiscount_rate(rs.getString("discount_rate"));
				dto.setPrice(rs.getString("price"));
				dto.setTotal_price(rs.getString("total_price"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 예매 내역 정보 삭제
	 * 
	 * @param userBookSeq 예약한 회원의 회원예매번호
	 * @return 예매내역정보삭제 실행
	 */
	public int del(String userBookSeq) {

		int result = 0;

		try {

			String sql = "delete tbluserbook where user_book_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, userBookSeq);

			result = pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 이전 예매 내역 정보 출력
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return
	 */
	public ArrayList<UserBookDTO> pget(String email) {

		try {

			String sql = "select * from vwUserBook where email = ? AND visit_date < SYSDATE";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			ArrayList<UserBookDTO> plist = new ArrayList<UserBookDTO>();

			while (rs.next()) {

				UserBookDTO dto = new UserBookDTO();

				dto.setUser_book_seq(rs.getString("user_book_seq"));
				dto.setUser_seq(rs.getString("user_seq"));
				dto.setTicket_book_seq(rs.getString("ticket_book_seq"));
				dto.setBook_date(rs.getString("book_date"));
				dto.setVisit_date(rs.getString("visit_date"));
				dto.setEa(rs.getString("ea"));
				dto.setTicket_seq(rs.getString("ticket_seq"));
				dto.setBenefit_seq(rs.getString("benefit_seq"));
				dto.setDiscount_rate(rs.getString("discount_rate"));
				dto.setPrice(rs.getString("price"));
				dto.setTotal_price(rs.getString("total_price"));

				plist.add(dto);
			}

			return plist;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
