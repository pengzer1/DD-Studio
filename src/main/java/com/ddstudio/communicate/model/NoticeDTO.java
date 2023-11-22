package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * @author 차수민
 */
@Data
public class NoticeDTO {
	
	private String notice_seq;
	private String subject;
	private String content;
	private String attach;
	private String regdate;
	private String fix;

}
