package com.ddstudio.member.model;

import lombok.Data;


public class VocDTO {

	private String voc_seq;
	private String type;
	private String subject;
	private String answer;
	private String regdate;
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getSeq() {
		return voc_seq;
	}
	public void setVoc_seq(String voc_seq) {
		this.voc_seq = voc_seq;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
	
}
