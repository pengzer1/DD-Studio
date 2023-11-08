package com.ddstudio.pb.model;

import com.ddstudio.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class PriceDTO {
    private String ticketSeq;
    private String ticketType;
    private String personType;
    private String age;
    private int price;

    public String getTicketSeq() {
        return ticketSeq;
    }

    public void setTicketSeq(String ticketSeq) {
        this.ticketSeq = ticketSeq;
    }

    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public String getPersonType() {
        return personType;
    }

    public void setPersonType(String personType) {
        this.personType = personType;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
