package com.ddstudio.member.model;

import lombok.Data;

/**
 * 어트랙션 예약정보를 담는 데이터 전송 객체(DTO)입니다.
 * 
 * 
 * @author 황주원
 *
 */
@Data
public class BookUserDTO {

	
	private String book_user_seq;
	private String name;
	private String attraction_book_seq;
	private String regdate;
	private String book_time;
	private String capacity;
	
}
