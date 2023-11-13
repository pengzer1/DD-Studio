package com.ddstudio.admin.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.admin.model.CategoryDTO;

public class CategoryDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CategoryDAO() {
		this.conn=DBUtil.open();
	}
	
	public ArrayList<CategoryDTO> list() {  //목록보기
		try {
			String sql = "select category_seq, name from tblCategory";
			
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
		}finally {
            try {
                pstat.close();
                conn.close();
            } catch (Exception e) {
                throw new RuntimeException();
            }
        }
		return 0;
	}

	public int del(CategoryDTO dto) {  //삭제
		try {
			String sql = "delete from tblCategory where name=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


}
