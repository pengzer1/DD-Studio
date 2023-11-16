package com.ddstudio.shop.model;

public class RestaurantCloseDTO {
	private String restaurant_close_seq;
	private String start_date;
	private String end_date;
	
	private String restaurant_seq;

	public String getRestaurant_close_seq() {
		return restaurant_close_seq;
	}

	public void setRestaurant_close_seq(String restaurant_close_seq) {
		this.restaurant_close_seq = restaurant_close_seq;
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

	public String getRestaurant_seq() {
		return restaurant_seq;
	}

	public void setRestaurant_seq(String restaurant_seq) {
		this.restaurant_seq = restaurant_seq;
	}
}
