package com.ddstudio.guide.model;


public class BusDTO {
	private String bus_seq;
	private String start_time;
	private String interval;
	private String capacity;
	
	private String route_seq;
	private String route_order;
	private String start_attraction_seq;
	private String end_attraction_seq;

	public String getBus_seq() {
		return bus_seq;
	}

	public void setBus_seq(String bus_seq) {
		this.bus_seq = bus_seq;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getInterval() {
		return interval;
	}

	public void setInterval(String interval) {
		this.interval = interval;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getRoute_seq() {
		return route_seq;
	}

	public void setRoute_seq(String route_seq) {
		this.route_seq = route_seq;
	}

	public String getRoute_order() {
		return route_order;
	}

	public void setRoute_order(String route_order) {
		this.route_order = route_order;
	}

	public String getStart_attraction_seq() {
		return start_attraction_seq;
	}

	public void setStart_attraction_seq(String start_attraction_seq) {
		this.start_attraction_seq = start_attraction_seq;
	}

	public String getEnd_attraction_seq() {
		return end_attraction_seq;
	}

	public void setEnd_attraction_seq(String end_attraction_seq) {
		this.end_attraction_seq = end_attraction_seq;
	}
}
