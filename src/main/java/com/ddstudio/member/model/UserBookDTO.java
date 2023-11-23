package com.ddstudio.member.model;

import lombok.Data;

/**
 * 회원 예매정보를 담는 데이터 전송 객체(DTO)입니다.
 * 
 * 
 * @author 황주원
 *
 */
@Data
public class UserBookDTO {
	
	private String user_book_seq;
	private String user_seq;
	private String ticket_book_seq;
	private String book_date;
	private String visit_date;
	private String ea;
	private String ticket_seq;
	private String benefit_seq;
	private String discount_rate;
	private String price;
	private String total_price;
	
}
