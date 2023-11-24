package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.CartDTO;

/**
 * 데이터베이스와 상호 작용하여 장바구니 정보를 처리하는 DAO 클래스입니다.
 * 
 * @author pega0
 *
 */
public class CartDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	/**
	 * CartDAO 클래스의 생성자입니다. 데이터베이스 연결을 수행합니다.
	 */
	public CartDAO() {
		this.conn = DBUtil.open();
	}

	/**
	 * 장바구니에 아이템을 저장합니다.
	 * @param dto 장바구니 정보가 담겨 있는 DTO
	 * @return 추가 확인 정수
	 */
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

	/**
	 * 최근 장바구니가 담긴 일련번호를 조회합니다.
	 * @return 장바구니 일련번호
	 */
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

	/**
	 * 유저 장바구니 테이블에 저장합니다.
	 * @param user_seq 현재 로그인한 유저 일련번호
	 * @param cart_seq 장바구니 일련번호
	 * @return 추가 확인 정수
	 */
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