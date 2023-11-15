package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.UserCartDTO;

public class UserCartDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserCartDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<UserCartDTO> view(String email) {
		
		try {
			
			String sql = "select * from vwcart where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();	
			
			ArrayList<UserCartDTO> list = new ArrayList<UserCartDTO>();
			
			while (rs.next()) {
				
				UserCartDTO dto = new UserCartDTO();
				
				dto.setEa(rs.getString("ea"));
				dto.setImg(rs.getString("img"));
				dto.setName(rs.getString("name"));
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

	

}
