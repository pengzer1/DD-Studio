package com.ddstudio.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;
import com.ddstudio.user.model.UserDTO;

public class UserDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserDAO() {
		this.conn = DBUtil.open();
	}

	public UserDTO login(UserDTO dto) {

		try {

			String sql = "select * from tblUser where email = ? and pw = ? and ing = 'Y'";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, dto.getPw());

			rs = pstat.executeQuery();

			if (rs.next()) {

				UserDTO result = new UserDTO();

				result.setEmail(rs.getString("email"));
				result.setName(rs.getString("name"));
				result.setLv(rs.getString("lv"));

				return result;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public int register(UserDTO dto) {

		try {
			String sql = "insert into tblUser (user_seq, name, email, pw, tel, address, birth, lv, ing) values (seqtblUser.nextVal, ?, ?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd'), '1', 'Y')";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getEmail());
			pstat.setString(3, dto.getPw());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getAddress());
			pstat.setString(6, dto.getBirth());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserDAO.register()");
			e.printStackTrace();
		}
		
		return 0;
	}

}
