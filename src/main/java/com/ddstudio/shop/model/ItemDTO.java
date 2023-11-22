package com.ddstudio.shop.model;

import lombok.Data;

/**
 * 아이템 데이터 전송 객체입니다.
 * @author pega0
 *
 */
@Data
public class ItemDTO {
	private String item_seq;
	private String name;
	private String info;
	private int price;
	private String shop_seq;
	private String img;
}
