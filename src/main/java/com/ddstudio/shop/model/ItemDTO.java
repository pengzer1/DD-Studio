package com.ddstudio.shop.model;

import lombok.Data;

@Data
public class ItemDTO {
	private String item_seq;
	private String name;
	private String info;
	private int price;
	private String shop_seq;
	private String img;
}
