package com.ddstudio.guide.model;

import lombok.Data;

@Data
public class BusDTO {
	private String bus_seq;
	private String start_time;
	private String interval;
	private String capacity;
	
	private String route_seq;
	private String route_order;
	private String start_attraction_seq;
	private String end_attraction_seq;
	
}
