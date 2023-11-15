package com.ddstudio.guide.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.guide.model.ConvenientDTO;

public class ConvenientDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ConvenientDAO() {
		this.conn=DBUtil.open();
	}

	public ArrayList<ConvenientDTO> list() {
		try {
			String sql = "select *\r\n"
					+ "from tblconvenient c inner join tbllocation l on c.location_seq=l.location_seq";
			
			stat = conn.createStatement();
			rs=stat.executeQuery(sql);
			
			ArrayList<ConvenientDTO> list = new ArrayList<ConvenientDTO>();
			while(rs.next()) {
				ConvenientDTO dto = new ConvenientDTO();
				
				dto.setConvenient_seq(rs.getString("convenient_seq"));
				dto.setName(rs.getString("name"));
				dto.setTime(rs.getString("time"));
				dto.setTel(rs.getString("tel"));
				dto.setImg(rs.getString("img"));
				dto.setLocation_seq(rs.getString("location_seq"));
				
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				
				list.add(dto);
				
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*
	public ArrayList<LocationDTO> listPlace(String choice) {
		try {
			String sql = "";
			
			
			if (choice.equals("attraction")) {  //어트랙션이 선택될 경우
			sql = "select b.location_seq, a.attraction_seq, a.name, b.lat, b.lng \r\n"
					+ "from tblAttraction a inner join tbllocation b on a.location_seq = b.location_seq \r\n"
					+ "order by a.attraction_seq";
			
			} else if (choice.equalsIgnoreCase("convenient")) {  //편의시설이 선택될 경우
			
			sql = "select b.location_seq, a.convenient_seq, a.name, b.lat, b.lng \r\n"
					+ "from tblconvenient a inner join tbllocation b on a.location_seq = b.location_seq \r\n"
					+ "order by a.convenient_seq";
			
			} 
			
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
				//dto.setTheme_seq(rs.getString("theme_seq"));
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
	*/
	
	
}
