package com.ddstudio.test.model;

/*
 * MBTI 정보를 담는 데이터 전송 객체(DTO)입니다.
 * MBTI의 일련번호, 결과, MBTI 유형, 코스 일련번호 및 정보, 어트랙션 일련번호 및 정보를 관리합니다.
 * 
 * 작성자: 이승원
 */
public class MBTIDTO {

	private String mbti_seq; // MBTI 일련번호
    private String result; // MBTI 결과
    private String mbti; // MBTI 유형
    private String course_seq; // 코스 일련번호
    private String course_name; // 코스 이름
    private String course_img; // 코스 이미지 경로
    private String attraction_seq; // 어트랙션 일련번호
    private String attraction_name; // 어트랙션 이름
    private String attraction_img; // 어트랙션 이미지 경로
	
	public String getMbti_seq() {
		return mbti_seq;
	}
	
	public void setMbti_seq(String mbti_seq) {
		this.mbti_seq = mbti_seq;
	}
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public String getMbti() {
		return mbti;
	}
	
	public void setMbti(String mbti) {
		this.mbti = mbti;
	}
	
	public String getCourse_seq() {
		return course_seq;
	}
	
	public void setCourse_seq(String course_seq) {
		this.course_seq = course_seq;
	}
	
	public String getCourse_name() {
		return course_name;
	}
	
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	
	public String getCourse_img() {
		return course_img;
	}
	
	public void setCourse_img(String course_img) {
		this.course_img = course_img;
	}
	
	public String getAttraction_seq() {
		return attraction_seq;
	}
	
	public void setAttraction_seq(String attraction_seq) {
		this.attraction_seq = attraction_seq;
	}
	
	public String getAttraction_name() {
		return attraction_name;
	}
	
	public void setAttraction_name(String attraction_name) {
		this.attraction_name = attraction_name;
	}
	
	public String getAttraction_img() {
		return attraction_img;
	}
	
	public void setAttraction_img(String attraction_img) {
		this.attraction_img = attraction_img;
	}
	
}
