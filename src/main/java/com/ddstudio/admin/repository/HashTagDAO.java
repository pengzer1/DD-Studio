package com.ddstudio.admin.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;
import com.ddstudio.admin.model.HashTagDTO;

public class HashTagDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public HashTagDAO() {
		this.conn=DBUtil.open();
	}

	public int add(HashTagDTO dto) {  //등록
		try {
			String sql = "insert into tblhashtag(hashtag_seq, name) values (seqtblhashtag.nextVal, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int del(HashTagDTO dto) {
		try {
			String sql = "delete from tblHashtag where name=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
