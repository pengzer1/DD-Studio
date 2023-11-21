package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 분실물에 대한 데이터를 담는 DTO 클래스입니다.
 */
@Data
public class LostPropertyDTO {
	
	private String lost_property_seq;
	private String type;
	private String name;
	private String location;
	private String lost_property_date;
	private String img;
	private String result;

}
