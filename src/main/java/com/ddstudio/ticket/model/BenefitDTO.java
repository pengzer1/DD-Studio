package com.ddstudio.ticket.model;

import lombok.Data;

@Data
public class BenefitDTO {
	private String benefit_seq;
	private String name;
	private String type;
	private String start_date;
	private String end_date;
	private int discount_rate;
	private String img;
}
