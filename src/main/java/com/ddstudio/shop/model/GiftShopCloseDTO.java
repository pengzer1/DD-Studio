package com.ddstudio.shop.model;

import lombok.Data;

/**
 * 기프트샵 운영/운휴 데이터 전송 객체입니다.
 * @author pega0
 *
 */
@Data
public class GiftShopCloseDTO {
	private String shop_close_seq;
	private String start_date;
	private String end_date;
	private String shop_seq;
}
