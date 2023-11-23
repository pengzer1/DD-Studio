package com.ddstudio.member.model;

import lombok.Data;

/**
 * 장바구니 데이터 전송 객체입니다.
 * @author pega0
 *
 */
@Data
public class CartDTO {
	private String cart_seq;
	private int ea;
	private String item_seq;
}
