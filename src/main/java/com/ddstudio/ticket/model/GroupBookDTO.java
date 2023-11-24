package com.ddstudio.ticket.model;

/**
 * 단체 예매 데이터 전송 객체입니다.
 * @author pega0
 *
 */
public class GroupBookDTO {
	private String user_group_book_seq;
	private String user_seq;
	private String group_book_seq;
	private String book_date;
	private String group_division;
	private String region;
	private String group_name;
	private String address;
	private String visit_date;
	private String visit_time;

	public String getUser_group_book_seq() {
		return user_group_book_seq;
	}

	public void setUser_group_book_seq(String user_group_book_seq) {
		this.user_group_book_seq = user_group_book_seq;
	}

	public String getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}

	public String getGroup_book_seq() {
		return group_book_seq;
	}

	public void setGroup_book_seq(String group_book_seq) {
		this.group_book_seq = group_book_seq;
	}

	public String getBook_date() {
		return book_date;
	}

	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}

	public String getGroup_division() {
		return group_division;
	}

	public void setGroup_division(String group_division) {
		this.group_division = group_division;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}

	public String getVisit_time() {
		return visit_time;
	}

	public void setVisit_time(String visit_time) {
		this.visit_time = visit_time;
	}
}
