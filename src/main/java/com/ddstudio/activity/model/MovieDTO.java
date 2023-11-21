package com.ddstudio.activity.model;

import lombok.Data;

@Data
public class MovieDTO {
	
	private String movie_seq;
	private String movie_name;
	private String start_date;
	private String end_date;
	private String runningtime;
	private String img;
	private String preview;
	
	private String start_time;
	
	private String theater_seq;
	private String theater_name;
	private String location_seq;
	private String lat;
	private String lng;
	
}
