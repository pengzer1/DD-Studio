package com.ddstudio.shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.shop.model.RestaurantDTO;

public class ShopDAO {
	
	private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    public ShopDAO() {

        this.conn = DBUtil.open();

    }

	public ArrayList<RestaurantDTO> list() {
		
		try {
			
			String sql = "select * from vwRestaurant";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<RestaurantDTO> list = new ArrayList<RestaurantDTO>();
			
			while (rs.next()) {
				
				RestaurantDTO dto = new RestaurantDTO();
				
				dto.setRestaurant_seq(rs.getString("restaurant_seq"));
				dto.setName(rs.getString("name"));
				dto.setMenu(rs.getString("menu"));
				dto.setTime(rs.getString("time"));
				dto.setCapacity(rs.getString("capacity"));
				dto.setTel(rs.getString("tel"));
				dto.setLocation(rs.getString("location"));
				dto.setCategory(rs.getString("category"));
				dto.setImg(rs.getString("img"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("ShopDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

}
