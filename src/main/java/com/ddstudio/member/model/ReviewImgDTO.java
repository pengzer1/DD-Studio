package com.ddstudio.member.model;

import lombok.Data;

/**
 * 리뷰이미지 정보를 담는 데이터 전송 객체(DTO)입니다.
 * 
 * 
 * @author 황주원
 *
 */
@Data
public class ReviewImgDTO {
	
	private String img;
	private String review_img_seq;
	private String review_seq;
	
}
