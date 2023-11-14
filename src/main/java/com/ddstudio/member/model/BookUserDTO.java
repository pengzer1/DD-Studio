package com.ddstudio.member.model;


public class BookUserDTO {

	public String name;
	public String attraction_book_seq;
	public String regdate;
	public String book_time;
	public String capacity;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAttraction_book_seq() {
		return attraction_book_seq;
	}

	public void setAttraction_book_seq(String attraction_book_seq) {
		this.attraction_book_seq = attraction_book_seq;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getBook_time() {
		return book_time;
	}

	public void setBook_time(String book_time) {
		this.book_time = book_time;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
}
