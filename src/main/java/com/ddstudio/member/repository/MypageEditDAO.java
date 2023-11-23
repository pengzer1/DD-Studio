package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.MypageEditDTO;

/**
 * 회원정보 수정 정보관련 데이터베이스 작업을 수행하는 클래스
 * 
 * @author 황주원
 *
 */
public class MypageEditDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MypageEditDAO() {
		this.conn = DBUtil.open();
	}

	/**
	 * 로그인한 회원의 정보 출력
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return
	 */
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


	/**
	 * 회원정보 수정
	 * 
	 * @param dto 회원정보 수정 정보를 담는 데이터 전송 객체
	 * @return
	 */
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
