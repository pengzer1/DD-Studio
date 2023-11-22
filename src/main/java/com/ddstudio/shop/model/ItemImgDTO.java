package com.ddstudio.shop.model;

import lombok.Data;

/**
 * 아이템 이미지 데이터 전송 객체입니다.
 * @author pega0
 *
 */
@Data
public class ItemImgDTO {
	private String item_img_seq;
	private String img;
	private String item_seq;
}
