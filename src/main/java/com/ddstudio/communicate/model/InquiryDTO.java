package com.ddstudio.communicate.model;


public class InquiryDTO {
	
	private String name;
	
	private String inquiry_seq;
	private String type;
	private String subject;
	private String content;
	private String attach;
	private String answer;
	private String user_seq;

	public String getInquiry_seq() {
		return inquiry_seq;
	}

	public void setInquiry_seq(String inquiry_seq) {
		this.inquiry_seq = inquiry_seq;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}
}
