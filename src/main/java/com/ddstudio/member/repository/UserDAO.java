package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;

public class UserDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserDAO() {
		this.conn = DBUtil.open();
	}

	public int unregister(String email) {
		
		try {

			String sql = "update tbluser set ing = 'N' where email = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

}
