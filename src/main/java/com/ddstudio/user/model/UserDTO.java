package com.ddstudio.user.model;

//import lombok.Data;

//@Data

/*
 * 사용자 정보를 담는 데이터 전송 객체(DTO)입니다.
 * 사용자의 기본 정보 및 회원 가입/로그인과 관련된 속성들을 관리합니다.
 * 
 * 작성자: 이승원
 */
public class UserDTO {
	
	private String user_seq; // 사용자 일련번호
	private String name; // 사용자 이름
	private String email; // 사용자 이메일 (아이디로 사용)
	private String pw; // 사용자 비밀번호
	private String tel; // 사용자 연락처
	private String address; // 사용자 주소
	private String birth; // 사용자 생년월일
	private String lv; // 사용자 등급
	private String ing; // 사용자 활동 상태 (활동 여부)'
	
	public String getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
	}

	public String getIng() {
		return ing;
	}

	public void setIng(String ing) {
		this.ing = ing;
	}
	
}