package com.ddstudio.member.model;

import lombok.Data;

/**
 * 회원 장바구니 정보를 담는 데이터 전송 객체(DTO)입니다.
 * 
 * 
 * @author 황주원
 *
 */
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