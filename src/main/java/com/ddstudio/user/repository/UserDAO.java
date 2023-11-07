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

			String sql = "select * from tblUser where id = ? and pw = ? and ing = 'y'";

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

}
