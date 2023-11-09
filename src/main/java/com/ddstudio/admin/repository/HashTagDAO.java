package com.ddstudio.admin.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;

public class HashTagDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public HashTagDAO() {
		this.conn=DBUtil.open();
	}
}
