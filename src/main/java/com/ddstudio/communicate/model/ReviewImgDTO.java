package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 리뷰 이미지에 대한 데이터를 담는 DTO 클래스입니다.
 */
@Data
public class ReviewImgDTO {

	private String review_img_seq;
	private String img;
	private String review_seq;
	
}
