package com.ddstudio.activity.model;


public class MovieDTO {
	
	private String movie_seq;
	private String name;
	private String period;
	private String runningtime;
	private String img;
	private String preview;

	public String getMovie_seq() {
		return movie_seq;
	}

	public void setMovie_seq(String movie_seq) {
		this.movie_seq = movie_seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getRunningtime() {
		return runningtime;
	}

	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}
}
