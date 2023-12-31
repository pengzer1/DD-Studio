package com.ddstudio.member.model;


/**
 * 문의내역 정보를 담는 데이터 전송 객체(DTO)입니다.
 * 
 * 
 * @author 황주원
 *
 */
public class InquiryDTO {

	private String inquiry_seq;
	private String type;
	private String subject;
	private String content;
	private String regdate;
	private String attach;
	private String answer;
	private String user_seq;
	
	
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
	public String getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getSeq() {
		return inquiry_seq;
	}
	public void setSeq(String seq) {
		this.inquiry_seq = seq;
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
