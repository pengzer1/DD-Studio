package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 리뷰에 대한 데이터를 담는 DTO 클래스입니다.
 */
@Data
public class ReviewDTO {
	
	private String visit_date;
	
	private String img;
	
	private String review_seq;
	private String subject;
	private String content;
	private String regdate;
	private String readcount;
	private String user_book_seq;

}
