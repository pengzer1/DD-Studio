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

	/*
	 * 로그인
	 */
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
				result.setUser_seq(rs.getString("user_seq"));
				result.setName(rs.getString("name"));
				result.setLv(rs.getString("lv"));

				return result;
			}

		} catch (Exception e) {
	        System.out.println("UserDao.login()");
			e.printStackTrace();
		}

		return null;
	}

	/*
	 * 회원 가입
	 */
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

	/*
	 * 이메일 중복 검사
	 */
	public int check(String email) {

		try {

	        String sql = "select count(*) as cnt from tblUser where email = ?";

	        pstat = conn.prepareStatement(sql);
	        pstat.setString(1, email);

	        rs = pstat.executeQuery();

	        if (rs.next()) {
	            return rs.getInt("cnt");
	        }

	    } catch (Exception e) {
	        System.out.println("UserDAO.check()");
	        e.printStackTrace();
	    }

	    return 0;
	}

	/*
	 * 아이디 찾기
	 */
	public UserDTO findId(UserDTO dto) {
		
		try {
			
			String sql = "select email from tblUser where name = ? and tel = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getTel());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				UserDTO result = new UserDTO();
				
				result.setEmail(rs.getString("email"));
				
				return result;
			}	
			
		} catch (Exception e) {
	        System.out.println("UserDao.findId()");
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 비밀번호 변경 전 계정 존재 여부 확인
	 */
	public int isFindPw(UserDTO dto) {
	    try {
	        String sql = "select count(*) as cnt from tblUser where email = ? and tel = ?";
	        
	        pstat = conn.prepareStatement(sql);
	        pstat.setString(1, dto.getEmail());
	        pstat.setString(2, dto.getTel());
	        
	        rs = pstat.executeQuery();

	        if (rs.next()) {
	            return rs.getInt("cnt");
	        }
	        
	    } catch (Exception e) {
	        System.out.println("UserDao.isFindPw()");
	        e.printStackTrace();
	    }

	    return 0;
	}

	/*
	 * 비밀번호 변경
	 */
	public int changePw(UserDTO dto) {

		try {

	        String sql = "update tblUser set pw = ? where email = ?";

	        pstat = conn.prepareStatement(sql);
	        pstat.setString(1, dto.getPw());
	        pstat.setString(2, dto.getEmail());

	        return pstat.executeUpdate();
	        
	    } catch (Exception e) {
	        System.out.println("UserDao.changePw()");
	        e.printStackTrace();
	    }

		return 0;
	}

}
