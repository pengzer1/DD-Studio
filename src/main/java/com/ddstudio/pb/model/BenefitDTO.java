package com.ddstudio.pb.model;

public class BenefitDTO {
//    BENEFIT_SEQ, NAME, TYPE, BENEFIT_DATE, DISCOUNT_RATE

    private String benefit_seq;
    private String name;

    private String type;
    private String start_date;
    private String end_date;
    private String discount_rate;
    private String img;

    public String getBenefit_seq() {
        return benefit_seq;
    }

    public void setBenefit_seq(String benefit_seq) {
        this.benefit_seq = benefit_seq;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getDiscount_rate() {
        return discount_rate;
    }

    public void setDiscount_rate(String discount_rate) {
        this.discount_rate = discount_rate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
