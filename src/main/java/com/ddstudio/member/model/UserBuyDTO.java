package com.ddstudio.member.model;


public class UserBuyDTO {

	private String email;
	private String shopName;
	private String itemName;
	private String ea;
	private String price;
	private String buy_seq;
	private String buy_date;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getEa() {
		return ea;
	}

	public void setEa(String ea) {
		this.ea = ea;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBuy_seq() {
		return buy_seq;
	}

	public void setBuy_seq(String buy_seq) {
		this.buy_seq = buy_seq;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
}
