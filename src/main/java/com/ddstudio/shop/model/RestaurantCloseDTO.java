package com.ddstudio.shop.model;

import lombok.Data;

@Data
public class RestaurantCloseDTO {
	private String restaurant_close_seq;
	private String start_date;
	private String end_date;
	private String restaurant_seq;
}
