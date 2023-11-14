package com.ddstudio.member.model;


public class ReviewDTO {

	private String review_seq;
	private String subject;
	private String content;
	private String regdate;
	private String readcount;
	private String user_book_seq;
	private String email;

	public String getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(String review_seq) {
		this.review_seq = review_seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}

	public String getUser_book_seq() {
		return user_book_seq;
	}

	public void setUser_book_seq(String user_book_seq) {
		this.user_book_seq = user_book_seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
