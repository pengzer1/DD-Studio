package com.ddstudio.communicate.model;

import lombok.Data;

/**
 * 공지사항에 대한 데이터를 담는 DTO 클래스입니다.
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
