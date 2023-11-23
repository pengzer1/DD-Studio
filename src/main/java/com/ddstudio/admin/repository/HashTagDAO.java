package com.ddstudio.admin.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.admin.model.CategoryDTO;
import com.ddstudio.admin.model.HashTagDTO;
/**
 * 해시태그 DAO클래스입니다.
 * 클래스는 DB와 상호 작용하여 해시태그 정보를 처리하는 DAO 클래스로, 해시태그의 조회, 추가, 삭제 등의 기능을 제공합니다.
 * @author leeje
 *
 */
public class HashTagDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	/**
	 * DB와 연결하는 클래스
	 */
	public HashTagDAO() {
		this.conn=DBUtil.open();
	}
	/**
	 * 해시태그 리스트를 조회하는 클래스
	 * @return 불러온 리스트를 반환
	 */
	public ArrayList<HashTagDTO> list() {
		try {
			String sql = "select hashtag_seq, name from tblhashtag";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<HashTagDTO> list = new ArrayList<HashTagDTO>();
			
			while (rs.next()) {
				//레코드 1줄 == AddressDTO 1개
				HashTagDTO dto = new HashTagDTO();
				
				dto.setHashtag_seq(rs.getString("hashtag_seq"));
				dto.setName(rs.getString("name"));
				
				list.add(dto);				
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	/**
	 * 해시태그를 추가하는 클래스
	 * @param dto : 추가할 해시태그 객체를 받습니다.
	 * @return : 해시태그가 추가되면 1, 실패하면 0을 반환
	 */
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
	/**
	 * 해시태그를 삭제하는 클래스
	 * @param dto : 삭제하려는 해시태그의 객체를 받습니다.
	 * @return 삭제 성공하면 1, 실패하면 0을 반환
	 */
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
