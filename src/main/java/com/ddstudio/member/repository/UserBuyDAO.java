package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.UserBuyDTO;

public class UserBuyDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserBuyDAO() {
		this.conn = DBUtil.open();
	}

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
