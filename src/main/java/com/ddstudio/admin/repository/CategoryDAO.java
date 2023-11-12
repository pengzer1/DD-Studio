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
	
	public ArrayList<CategoryDTO> listCategory() {
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
			System.out.println("AjaxDAO.listAddress()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int add(CategoryDTO dto) {  //카테고리 등록
		try {
			String sql = "insert into tblcategory(seq, name) values (seqtblCategory.nextVal, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}


}
