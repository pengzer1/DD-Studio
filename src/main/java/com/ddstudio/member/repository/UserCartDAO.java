package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.UserBuyDTO;
import com.ddstudio.member.model.UserCartDTO;

public class UserCartDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserCartDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<UserCartDTO> view(String email) {
		
		try {
			
			String sql = "select * from vwcart where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();	
			
			ArrayList<UserCartDTO> list = new ArrayList<UserCartDTO>();
			
			while (rs.next()) {
				
				UserCartDTO dto = new UserCartDTO();
				
				dto.setUser_cart_seq(rs.getString("user_cart_seq"));
				dto.setEa(rs.getString("ea"));
				dto.setImg(rs.getString("img"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setTotal_price(rs.getString("total_price"));
				dto.setItem_seq(rs.getString("item_seq"));
				
				list.add(dto);
			}	
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<UserCartDTO> getSelectCart(String email, String[] user_cart_seq) {

		ArrayList<UserCartDTO> list = new ArrayList<UserCartDTO>();
		
		if(user_cart_seq == null) {
			return null;
		}
		
		for (String cart_seq : user_cart_seq) {
			try {
				
				String sql = "select * from vwcart where email = ? and user_cart_seq = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, email);
				pstat.setString(2, cart_seq);
				
				rs = pstat.executeQuery();
				
				while (rs.next()) {
					
					UserCartDTO dto = new UserCartDTO();
					
					dto.setUser_cart_seq(cart_seq);
					dto.setName(rs.getString("name"));
					dto.setEa(rs.getString("ea"));
					dto.setPrice(rs.getString("price"));
					dto.setItem_seq(rs.getString("item_seq"));
					
					list.add(dto);
				}
			} catch (Exception e) {
				System.out.println("UserCartDAO.getSelectCart()");
				e.printStackTrace();
				return null;
			}
		}
		
		return list;
	}

	public int addBuy(UserBuyDTO dto) {

		try {

			String sql = "insert into tblbuy (buy_seq, buy_date, ea, buy_option, item_seq) values (seqtblbuy.nextVal, sysdate, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getEa());
			pstat.setString(2, dto.getBuy_option());
			pstat.setString(3, dto.getItem_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserCartDAO.addBuy()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getBuySeq() {

try {

	String sql = "select max(buy_seq) as buy_seq from tblBuy";

	stat = conn.createStatement();
	rs = stat.executeQuery(sql);

	if (rs.next()) {
		return rs.getString("buy_seq");
	}

} catch (Exception e) {
	System.out.println("UserCartDAO.getBuySeq()");
	e.printStackTrace();
}
		
		return null;
	}

	public int addUserBuy(String user_seq, String buy_seq) {

		try {

			String sql = "insert into tbluserbuy (user_buy_seq, user_seq, buy_seq) values (seqtbluserbuy.nextVal, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user_seq);
			pstat.setString(2, buy_seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserCartDAO.addUserBuy()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delUserCart(String user_cart_seq) {

		try {

			String sql = "delete from tblusercart where user_cart_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user_cart_seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserCartDAO.delUserCart()");
			e.printStackTrace();
		}
		
		return 0;
	}

	

}