package com.ddstudio.activity.model;

import lombok.Data;

@Data
public class FestivalDTO {
	
	private String festival_seq;
	private String name;
	private String time;
	private String info;
	private String start_date;
	private String end_date;
	private String location_seq;
	
	private String img;
	
	private String lat;
	private String lng;
}
