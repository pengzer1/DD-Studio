package com.ddstudio.shop.model;

import lombok.Data;

/**
 * 레스토랑 이미지 데이터 전송 객체입니다.
 * @author pega0
 *
 */
@Data
public class RestaurantImgDTO {
	private String restaurant_img_seq;
	private String img;
	private String restaurant_seq;
}
