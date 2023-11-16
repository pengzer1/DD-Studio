package com.ddstudio.member.model;

import lombok.Data;

@Data
public class UserCartDTO {
	private String user_cart_seq;
	private String ea;
	private String name;
	private String price;
	private String img;
	private String total_price;
	private String item_seq;
}