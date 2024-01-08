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
/**
 * 편의시설 DAO클래스입니다.
 * 클래스는 데이터베이스와 상호 작용하여 편의시설 정보를 처리하는 DAO 클래스로, 편의시설의 조회 기능을 제공
 * @author leeje
 *
 */
public class ConvenientDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	/**
	 * DB와 연결하는 메서드
	 */
	public ConvenientDAO() {
		this.conn=DBUtil.open();
	}
	/**
	 * 편의시설 리스트를 조회하는 메서드
	 * @return 조회된 리스트를 반환합니다.
	 */
	public ArrayList<ConvenientDTO> list() {
		try {
			String sql = "select * from tblconvenient c inner join tbllocation l on c.location_seq=l.location_seq";
			
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
	/**
	 * 운영 중인 어트랙션의 리스트를 조회하는 메서드
	 * @return : 운영 중인 어트랙션의 리스트를 반환합니다.
	 */
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
