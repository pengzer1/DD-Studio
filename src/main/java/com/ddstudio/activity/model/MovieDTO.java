package com.ddstudio.activity.model;

import lombok.Data;

@Data
public class MovieDTO {
	
	private String movie_seq;
	private String name;
	private String start_date;
	private String end_date;
	private String runningtime;
	private String img;
	private String preview;
	
	private String start_time;
}
