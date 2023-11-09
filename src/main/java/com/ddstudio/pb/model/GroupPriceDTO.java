package com.ddstudio.pb.model;


import javax.persistence.*;

@Entity
public class GroupPriceDTO {

    @Id@GeneratedValue(strategy = GenerationType.SEQUENCE)
    private String ticket_seq;

    @Column(name = "ticket_type")
    private String ticket_type;

    @Column(name = "person_type")
    private String person_type;

    @Column(name = "age")
    private String age;

    @Column(name = "price")
    private int price;

    // 생성자
    public GroupPriceDTO() {
        // 기본 생성자
    }

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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
