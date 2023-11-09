package com.ddstudio.pb.model;

import javax.persistence.Entity;


public class BenefitDTO {
//    BENEFIT_SEQ, NAME, TYPE, BENEFIT_DATE, DISCOUNT_RATE

    private String benefit_seq;
    private String name;

    private String type;
    private String benefit_date;
    private String discount_rate;

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

    public String getBenefit_date() {
        return benefit_date;
    }

    public void setBenefit_date(String benefit_date) {
        this.benefit_date = benefit_date;
    }

    public String getDiscount_rate() {
        return discount_rate;
    }

    public void setDiscount_rate(String discount_rate) {
        this.discount_rate = discount_rate;
    }
}
