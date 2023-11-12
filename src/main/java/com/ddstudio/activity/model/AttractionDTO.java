package com.ddstudio.activity.model;

import lombok.Data;

@Data
public class AttractionDTO {

	private String attraction_seq;
	private String name;
	private String capacity;
	private String location_seq;
	private String time;
	private String restriction;
	private String theme_seq;
	private String is_test;
	
	private String img;
	private String theme;
}
