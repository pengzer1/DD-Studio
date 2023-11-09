package com.ddstudio.guide.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;

public class BusDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BusDAO() {
		this.conn=DBUtil.open();
	}
}
