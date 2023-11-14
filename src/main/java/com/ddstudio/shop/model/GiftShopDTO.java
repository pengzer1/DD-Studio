package com.ddstudio.shop.model;

import lombok.Data;

@Data
public class GiftShopDTO {
	private String shop_seq;
	private String name;
	private String time;
	private String info;
	private String tel;
	private String lat;
	private String lng;
	private String img;
	private String location_seq;
	
	private String startTime;
	private String endTime;
}
