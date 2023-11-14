package com.ddstudio.activity.model;


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

	public String getAttraction_seq() {
		return attraction_seq;
	}

	public void setAttraction_seq(String attraction_seq) {
		this.attraction_seq = attraction_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getLocation_seq() {
		return location_seq;
	}

	public void setLocation_seq(String location_seq) {
		this.location_seq = location_seq;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getRestriction() {
		return restriction;
	}

	public void setRestriction(String restriction) {
		this.restriction = restriction;
	}

	public String getTheme_seq() {
		return theme_seq;
	}

	public void setTheme_seq(String theme_seq) {
		this.theme_seq = theme_seq;
	}

	public String getIs_test() {
		return is_test;
	}

	public void setIs_test(String is_test) {
		this.is_test = is_test;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
