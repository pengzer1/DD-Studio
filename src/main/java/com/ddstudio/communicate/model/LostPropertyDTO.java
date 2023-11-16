package com.ddstudio.communicate.model;

import lombok.Data;

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
