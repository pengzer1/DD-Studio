package com.ddstudio.member.model;

import lombok.Data;

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
	
}
