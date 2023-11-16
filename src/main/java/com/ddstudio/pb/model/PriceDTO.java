package com.ddstudio.pb.model;

public class PriceDTO {
    private String ticket_seq;
    private String ticket_type;
    private String person_type;
    private String age;
    private String price;

    public String getTicket_seq() {
        return ticket_seq;
    }

    public void setTicket_seq(String ticket_seq) {
        this.ticket_seq = ticket_seq;
    }

    public String getTicket_type() {
        return ticket_type;
    }

    public void setTicket_type(String ticket_type) {
        this.ticket_type = ticket_type;
    }

    public String getPerson_type() {
        return person_type;
    }

    public void setPerson_type(String person_type) {
        this.person_type = person_type;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
