package com.ddstudio.test.model;

/*
 * 작성자: 이승원
 */
public class CourseDTO {

	public String course_seq;
	public String name;
	public String img;
	
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
