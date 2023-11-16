package com.ddstudio.activity.model;


public class FestivalHashtagDTO {

	private String festival_hashtag_seq;
	private String festival_seq;
	private String hashtag_seq;
	
	private String hashtag_name;

	public String getFestival_hashtag_seq() {
		return festival_hashtag_seq;
	}

	public void setFestival_hashtag_seq(String festival_hashtag_seq) {
		this.festival_hashtag_seq = festival_hashtag_seq;
	}

	public String getFestival_seq() {
		return festival_seq;
	}

	public void setFestival_seq(String festival_seq) {
		this.festival_seq = festival_seq;
	}

	public String getHashtag_seq() {
		return hashtag_seq;
	}

	public void setHashtag_seq(String hashtag_seq) {
		this.hashtag_seq = hashtag_seq;
	}

	public String getHashtag_name() {
		return hashtag_name;
	}

	public void setHashtag_name(String hashtag_name) {
		this.hashtag_name = hashtag_name;
	}
}
