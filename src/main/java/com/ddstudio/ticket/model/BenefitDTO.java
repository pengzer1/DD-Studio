package com.ddstudio.ticket.model;

import lombok.Data;

/**
 * 혜택 데이터 전송 객체입니다.
 * @author pega0
 *
 */
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
