package com.ddstudio.activity.model;


public class FestivalDTO {
	
	private String festival_seq;
	private String name;
	private String time;
	private String info;
	private String period;
	private String location_seq;

	public String getFestival_seq() {
		return festival_seq;
	}

	public void setFestival_seq(String festival_seq) {
		this.festival_seq = festival_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getLocation_seq() {
		return location_seq;
	}

	public void setLocation_seq(String location_seq) {
		this.location_seq = location_seq;
	}
}
