package com.ddstudio.admin.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.admin.model.CategoryDTO;
/**
 * 카테고리 DAO클래스입니다. 
 * 클래스는 데이터베이스와 상호 작용하여 카테고리 정보를 처리하는 DAO 클래스로, 카테고리의 조회, 추가, 수정, 삭제 등의 기능을 제공합니다.
 * @author leeje
 *
 */
public class CategoryDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	/**
	 * DB와 연결하는 메서드
	 */
	public CategoryDAO() {
		this.conn=DBUtil.open();
	}
	/**
	 * 카테고리 리스트를 불러옵니다.
	 * @return 불러온 리스트를 반환합니다.
	 */
	public ArrayList<CategoryDTO> list() {  //목록보기
		try {
			String sql = "select category_seq, name from tblCategory where name != '0'";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
			
			while (rs.next()) {
				//레코드 1줄 == AddressDTO 1개
				CategoryDTO dto = new CategoryDTO();
				
				dto.setCategory_seq(rs.getString("category_seq"));
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
	 * 카테고리를 추가하는 메서드
	 * @param dto : 추가할 카테고리 객체를 받습니다.
	 * @return : 카테고리가 추가되면 1, 실패하면 0을 반환
	 */
	public int add(CategoryDTO dto) {  //카테고리 등록
		try {
			String sql = "insert into tblcategory(category_seq, name) values (seqtblCategory.nextVal, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	/**
	 * 카테고리를 수정하는 메서드
	 * @param dto : 수정할 카테고리 객체를 받습니다.
	 * @param aftername : 수정할 이름도 같이 받아오기.
	 * @return 수정 성공하면 1, 실패하면 0을 반환.
	 */
	public int edit(CategoryDTO dto, String aftername) {  //dto와 함께 넘겨받은 변경할 이름
		try {
			String sql = "update tblCategory set name=? where name=?";
			
			pstat = conn.prepareStatement(sql);
			//?에 맞춰서 어떤 매개변수를 넣어줄지 지정하기
			pstat.setString(1, aftername);  //새로운 이름으로 업데이트
			pstat.setString(2, dto.getName());  //기존의 이름으로 검색
			
			 return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	/**
	 * 카테고리를 삭제하는 메서드
	 * @param dto : 삭제할 카테고리 객체를 받아오기
	 * @return 삭제 성공하면 1, 실패하면 0을 반환.
	 */
	public int del(CategoryDTO dto) {  //삭제
		try {
			String sql = "update tblCategory set name='0' where category_seq=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getCategory_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


}
