package com.ddstudio.member.model;

import lombok.Data;

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
