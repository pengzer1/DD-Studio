package com.ddstudio.shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.model.AttractionCloseDTO;
import com.ddstudio.shop.model.GiftShopDTO;
import com.ddstudio.shop.model.RestaurantCloseDTO;
import com.ddstudio.shop.model.RestaurantDTO;

public class ShopDAO {
	
	private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    public ShopDAO() {

        this.conn = DBUtil.open();

    }

	public ArrayList<RestaurantDTO> restaurantList() {
		
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
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
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

	public ArrayList<GiftShopDTO> giftShopList() {
		
try {
			
			String sql = "select * from vwShop";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<GiftShopDTO> list = new ArrayList<GiftShopDTO>();
			
			while (rs.next()) {
				
				GiftShopDTO dto = new GiftShopDTO();
				
				dto.setShop_seq(rs.getString("shop_seq"));
				dto.setName(rs.getString("name"));
				dto.setTime(rs.getString("time"));
				dto.setInfo(rs.getString("info"));
				dto.setTel(rs.getString("tel"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
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

	public RestaurantDTO restaurantDedtail(String seq) {
		
		try {
			
			String sql = "select * from vwRestaurant where restaurant_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				RestaurantDTO dto = new RestaurantDTO();
				
				dto.setRestaurant_seq(rs.getString("restaurant_seq"));
				dto.setName(rs.getString("name"));
				dto.setMenu(rs.getString("menu"));
				dto.setTime(rs.getString("time"));
				dto.setCapacity(rs.getString("capacity"));
				dto.setTel(rs.getString("tel"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setCategory(rs.getString("category"));
				dto.setImg(rs.getString("img"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("ShopDAO.restaurantDedtail()");
			e.printStackTrace();
		}
		
		return null;
	}

	public RestaurantCloseDTO restaurantClose(String seq) {
		
		try {
			
			String sql = "select * from tblRestaurantClose where restaurant_seq = ? and TO_CHAR(sysdate,'YYYY-MM-DD') >= TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(sysdate,'YYYY-MM-DD') <= TO_CHAR(end_date,'YYYY-MM-DD')";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				RestaurantCloseDTO dto = new RestaurantCloseDTO();
				
				dto.setRestaurant_close_seq(rs.getString("restaurant_close_seq"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setRestaurant_seq(rs.getString("restaurant_seq"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("ShopDAO.restaurantClose()");
			e.printStackTrace();
		}
		
		return null;
	}

}
