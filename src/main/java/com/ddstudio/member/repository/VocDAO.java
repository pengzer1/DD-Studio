package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.VocDTO;

public class VocDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public VocDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<VocDTO> get(String email) {
		
		try {
			
			String sql = "select voc_seq, type, subject, regdate, answer from vwUserVOC where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();	
			
			ArrayList<VocDTO> list = new ArrayList<VocDTO>();
			
			while (rs.next()) {
				
				VocDTO dto = new VocDTO();
				
				dto.setVoc_seq(rs.getString("voc_seq"));
				dto.setType(rs.getString("type"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAnswer(rs.getString("answer"));
				
				list.add(dto);
			}	
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	

}
