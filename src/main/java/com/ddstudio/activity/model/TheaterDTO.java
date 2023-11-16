package com.ddstudio.activity.model;

import lombok.Data;

@Data
public class TheaterDTO {

	private String theater_seq;
	private String name;
	private String location_seq;
	
	private String lat;
	private String lng;
}
