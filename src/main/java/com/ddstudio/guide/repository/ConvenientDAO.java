package com.ddstudio.guide.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.admin.model.CategoryDTO;
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

	public ArrayList<AttractionDTO> attractionList() {
		try {
			String sql = "SELECT * \r\n"
					+ "FROM tblAttraction a INNER JOIN tblLocation l ON l.location_seq = a.location_seq\r\n"
					+ "where name not like '%(운영종료)%'\r\n"
					+ "order by a.attraction_seq";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<AttractionDTO> list = new ArrayList<AttractionDTO>();
			
			while (rs.next()) {
				//레코드 1줄 == AddressDTO 1개
				AttractionDTO dto = new AttractionDTO();
				dto.setAttraction_seq(rs.getString("attraction_seq"));
				dto.setName(rs.getString("name"));
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

	

	
	
	
}
