package com.ddstudio.ticket.model;

import lombok.Data;

@Data
public class GroupBookDTO {
	private String user_group_book_seq;
	private String user_seq;
	private String group_book_seq;
	private String book_date;
	private String group_division;
	private String region;
	private String group_name;
	private String address;
	private String visit_date;
	private String visit_time;
}
