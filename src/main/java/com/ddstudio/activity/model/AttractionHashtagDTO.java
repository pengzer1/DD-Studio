package com.ddstudio.activity.model;


public class AttractionHashtagDTO {

	private String attraction_hashtag_seq;
	private String attraction_seq;
	private String hashtag_seq;
	
	private String hashtag_name;

	public String getAttraction_hashtag_seq() {
		return attraction_hashtag_seq;
	}

	public void setAttraction_hashtag_seq(String attraction_hashtag_seq) {
		this.attraction_hashtag_seq = attraction_hashtag_seq;
	}

	public String getAttraction_seq() {
		return attraction_seq;
	}

	public void setAttraction_seq(String attraction_seq) {
		this.attraction_seq = attraction_seq;
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
