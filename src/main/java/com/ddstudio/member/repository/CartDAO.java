package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.CartDTO;

public class CartDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public CartDAO() {
		this.conn = DBUtil.open();
	}

	public int cartAdd(CartDTO dto) {
		
		try {

			String sql = "insert into tblcart (cart_seq, ea, item_seq) values (seqtblCart.nextVal, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, dto.getEa());
			pstat.setString(2, dto.getItem_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("CartDAO.cartAdd()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getCartSeq() {
		
		try {

			String sql = "select max(cart_seq) as cart_seq from tblcart";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getString("cart_seq");
			}

		} catch (Exception e) {
			System.out.println("CartDAO.getCartSeq()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int addUserCart(String user_seq, String cart_seq) {
		
		try {

			String sql = "insert into tblusercart (user_cart_seq, user_seq, cart_seq) values (seqtblusercart.nextVal, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user_seq);
			pstat.setString(2, cart_seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("CartDAO.addUserCart()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
}
