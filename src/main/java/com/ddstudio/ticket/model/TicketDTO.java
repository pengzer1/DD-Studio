package com.ddstudio.ticket.model;

import lombok.Data;

/**
 * 티켓 데이터 전송 객체입니다.
 * @author pega0
 *
 */
@Data
public class TicketDTO {
	private String date;
	private String seq;
	private String ea;
	private String price;
	private String benefit_seq;
}
