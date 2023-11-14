package com.ddstudio.guide.model;


public class TheaterServiceDTO {
	private String theater_close_seq;
	private String start_date;
	private String end_date;
	
	private String theater_seq;

	public String getTheater_close_seq() {
		return theater_close_seq;
	}

	public void setTheater_close_seq(String theater_close_seq) {
		this.theater_close_seq = theater_close_seq;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getTheater_seq() {
		return theater_seq;
	}

	public void setTheater_seq(String theater_seq) {
		this.theater_seq = theater_seq;
	}
}
