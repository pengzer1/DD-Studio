package com.ddstudio.activity.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.model.AttractionDTO;


public class ActDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ActDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<AttractionDTO> list() {

		try {
					
					String sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1)as img from tblAttraction a";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<AttractionDTO> list = new ArrayList<AttractionDTO>();
					while (rs.next()) {
						
						AttractionDTO dto = new AttractionDTO();
						
						dto.setAttraction_seq(rs.getString("attraction_seq"));
						dto.setName(rs.getString("name"));
						dto.setCapacity(rs.getString("capacity"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setTime(rs.getString("time"));
						dto.setRestriction(rs.getString("restriction"));
						dto.setTheme_seq(rs.getString("theme_seq"));
						dto.setIs_test(rs.getString("is_test"));
						dto.setImg(rs.getString("img"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.list");
					e.printStackTrace();
				}
		
		
		return null;
	}
}
