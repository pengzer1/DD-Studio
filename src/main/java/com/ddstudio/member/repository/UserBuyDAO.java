package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.UserBuyDTO;

/**
 * 회원 구매정보관련 데이터베이스 작업을 수행하는 클래스
 * 
 * @author 황주원
 *
 */
public class UserBuyDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserBuyDAO() {
		this.conn = DBUtil.open();
	}

	/**
	 * 구매내역 출력
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return 
	 */
	public ArrayList<UserBuyDTO> get(String email) {

		try {

			String sql = "select * from vwUserBuy where email = ? and buy_date >= sysdate - INTERVAL '14' DAY";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			ArrayList<UserBuyDTO> list = new ArrayList<UserBuyDTO>();

			while (rs.next()) {

				UserBuyDTO dto = new UserBuyDTO();

				dto.setShopName(rs.getString("shopName"));
				dto.setItemName(rs.getString("itemName"));
				dto.setEa(rs.getString("ea"));
				dto.setPrice(rs.getString("price"));
				dto.setBuy_seq(rs.getString("buy_seq"));
				dto.setBuy_date(rs.getString("buy_date"));
				dto.setUser_buy_seq(rs.getString("user_buy_seq"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 구매 취소
	 * 
	 * @param userBuySeq 회원구매번호
	 * @return 구매취소실행
	 */
	public int del(String userBuySeq) {

		int result = 0;

		try {

			String sql = "delete tblUserbuy where user_buy_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, userBuySeq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 이전구매내역 출력
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return
	 */
	public ArrayList<UserBuyDTO> pget(String email) {

		try {

			String sql = "select * from vwUserBuy where email = ? and buy_date < sysdate - INTERVAL '14' DAY";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			ArrayList<UserBuyDTO> plist = new ArrayList<UserBuyDTO>();

			while (rs.next()) {

				UserBuyDTO dto = new UserBuyDTO();

				dto.setShopName(rs.getString("shopName"));
				dto.setItemName(rs.getString("itemName"));
				dto.setEa(rs.getString("ea"));
				dto.setPrice(rs.getString("price"));
				dto.setBuy_seq(rs.getString("buy_seq"));
				dto.setBuy_date(rs.getString("buy_date"));
				dto.setUser_buy_seq(rs.getString("user_buy_seq"));

				plist.add(dto);
			}

			return plist;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
