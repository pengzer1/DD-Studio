package com.ddstudio.test.model;

/*
 * 코스 정보를 담는 데이터 전송 객체(DTO)입니다.
 * 코스의 일련번호, 이름, 이미지 경로를 관리합니다.
 * 
 * 작성자: 이승원
 */
public class CourseDTO {

	public String course_seq; // 코스 일련번호
    public String name; // 코스 이름
    public String img; // 코스 이미지 경로
    
	public String getCourse_seq() {
		return course_seq;
	}
	
	public void setCourse_seq(String course_seq) {
		this.course_seq = course_seq;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}
	
}
