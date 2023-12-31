package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * @author 차수민
 */
@Data
public class VOCDTO {
	
	private String name;
	private String email;
	private String tel;
	
	private String voc_seq;
	private String type;
	private String service_type;
	private String subject;
	private String content;
	private String attach;
	private String visit_date;
	private String regdate;
	private String answer;
	private String user_seq;

}
