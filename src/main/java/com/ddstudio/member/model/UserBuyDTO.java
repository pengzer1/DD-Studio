package com.ddstudio.member.model;

import lombok.Data;

/**
 * 회원 구매정보를 담는 데이터 전송 객체(DTO)입니다.
 * 
 * 
 * @author 황주원
 *
 */
@Data
public class UserBuyDTO {

	private String email;
	private String shopName;
	private String itemName;
	private String item_seq;
	private String ea;
	private String price;
	private String buy_seq;
	private String buy_date;
	private String user_buy_seq;
	private String user_seq;
	private String buy_option;
	private String user_cart_seq;
	
}
