package com.ddstudio.guide.model;


public class AttractionServiceDTO {
	private String attraction_close_seq;
	private String start_date;
	private String end_state;
	
	private String attraction_seq;

	public String getAttraction_close_seq() {
		return attraction_close_seq;
	}

	public void setAttraction_close_seq(String attraction_close_seq) {
		this.attraction_close_seq = attraction_close_seq;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_state() {
		return end_state;
	}

	public void setEnd_state(String end_state) {
		this.end_state = end_state;
	}

	public String getAttraction_seq() {
		return attraction_seq;
	}

	public void setAttraction_seq(String attraction_seq) {
		this.attraction_seq = attraction_seq;
	}
}
