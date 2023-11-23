package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;

/**
 * 사용자 정보에 관련된 데이터베이스 작업을 수행하는 클래스입니다.
 * 
 * 이 클래스는 DBUtil을 사용하여 데이터베이스 연결을 관리합니다.
 * 
 * @author 황주원
 */
public class UserDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserDAO() {
		this.conn = DBUtil.open();
	}

	 /**
     * 사용자를 탈퇴 처리하는 메서드입니다.
     * 
     * @param email 탈퇴할 사용자의 이메일 주소
     * @return      탈퇴 처리된 행의 수
     */
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
