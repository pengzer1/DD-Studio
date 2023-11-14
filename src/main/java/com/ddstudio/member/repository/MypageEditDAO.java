package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.MypageEditDTO;

public class MypageEditDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MypageEditDAO() {
		this.conn = DBUtil.open();
	}

	
	public MypageEditDTO get(String email) {
		
		try {
			
			String sql = "select * from tblUser where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				MypageEditDTO dto = new MypageEditDTO();
				
				dto.setEmail(rs.getString("email"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setBirth(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				return dto;
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}


	public int edit(MypageEditDTO dto) {
		
		System.out.println("test");
		
		try {

			String sql = "update tblUser set name = ?, birth = ?, tel = ?, address = ? where email = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getBirth());
			pstat.setString(3, dto.getTel());
			pstat.setString(4, dto.getAddress());
			pstat.setString(5, dto.getEmail());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

		
	
}
