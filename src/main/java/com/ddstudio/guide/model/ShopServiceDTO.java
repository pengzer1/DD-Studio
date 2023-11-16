package com.ddstudio.guide.model;


public class ShopServiceDTO {
	private String shop_close_seq;
	private String start_date;
	private String end_date;
	
	private String shop_seq;

	public String getShop_close_seq() {
		return shop_close_seq;
	}

	public void setShop_close_seq(String shop_close_seq) {
		this.shop_close_seq = shop_close_seq;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getShop_seq() {
		return shop_seq;
	}

	public void setShop_seq(String shop_seq) {
		this.shop_seq = shop_seq;
	}
}
