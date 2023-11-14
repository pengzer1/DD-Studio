package com.ddstudio.pb.repository;

import com.ddstudio.DBUtil;
import com.ddstudio.pb.Benefit;
import com.ddstudio.pb.model.BenefitDTO;
import com.ddstudio.pb.model.PriceDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BenefitDAO {
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    public BenefitDAO() {

        this.conn = DBUtil.open();

    }

    public ArrayList<BenefitDTO> list() {  // 혜택 리스트 가져오기

        ArrayList<BenefitDTO> list = new ArrayList<>();


        try {

            String sql = "SELECT benefit_seq, name, type,  TO_CHAR(START_DATE, 'YYYY-MM-DD') AS start_date, TO_CHAR(END_DATE,'YYYY-MM-DD') AS end_date, discount_rate, img FROM TBLBENEFIT order by BENEFIT_SEQ desc ";

            stat = conn.createStatement();

            rs = stat.executeQuery(sql);

            //rs == 메모 목록

            //rs를  list로 옮기기
            while (rs.next()) {

                //레코드 1줄 > MemoDTO 1개
                BenefitDTO dto = new BenefitDTO();
                dto.setBenefit_seq(rs.getString("benefit_seq"));
                dto.setName(rs.getString("name"));
                dto.setType(rs.getString("type"));
                dto.setStart_date(rs.getString("start_date"));
                dto.setEnd_date(rs.getString("end_date"));
                dto.setDiscount_rate(rs.getString("discount_rate"));
                dto.setImg(rs.getString("img"));


                list.add(dto);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }



    public ArrayList<BenefitDTO> benefitInfo(String seq) {


        try {

            String sql = "SELECT benefit_seq, name, type,  TO_CHAR(START_DATE, 'YYYY-MM-DD') AS start_date, TO_CHAR(END_DATE,'YYYY-MM-DD') AS end_date, discount_rate, img FROM TBLBENEFIT where BENEFIT_SEQ = ?";

            pstat = conn.prepareStatement(sql);
            pstat.setString(1, seq);

            rs = pstat.executeQuery();

            ArrayList<BenefitDTO> list = new ArrayList<>();

            while (rs.next()) {

                BenefitDTO dto = new BenefitDTO();
                dto.setBenefit_seq(rs.getString("benefit_seq"));
                dto.setName(rs.getString("name"));
                dto.setType(rs.getString("type"));
                dto.setStart_date(rs.getString("start_date"));
                dto.setEnd_date(rs.getString("end_date"));
                dto.setDiscount_rate(rs.getString("discount_rate"));
                dto.setImg(rs.getString("img"));



                list.add(dto);
            }

            return list;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    public int benefitAdd(BenefitDTO dto) {


        try {
            String sql = "insert into TBLBENEFIT(benefit_seq, name, type, start_date, end_date, discount_rate, img) values (SEQTBLBENEFIT.nextval,?,'일반',?,?,?,?)";

            pstat = conn.prepareStatement(sql);
            pstat.setString(1,dto.getName());
            pstat.setString(2, dto.getStart_date());
            pstat.setString(3, dto.getEnd_date());
            pstat.setString(4, dto.getDiscount_rate());
            pstat.setString(5, dto.getImg());

            return pstat.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;

    }

    public int partnerShipBenefitAdd(BenefitDTO dto) {
        try {
            String sql = "insert into TBLBENEFIT(benefit_seq, name, type, start_date, end_date, discount_rate, img) values (SEQTBLBENEFIT.nextval,?,?,?,?,?,?)";

            pstat = conn.prepareStatement(sql);
            pstat.setString(1,dto.getName());
            pstat.setString(2,dto.getType());
            pstat.setString(3, dto.getStart_date());
            pstat.setString(4, dto.getEnd_date());
            pstat.setString(5, dto.getDiscount_rate());
            pstat.setString(6, dto.getImg());

            return pstat.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;

    }


    public BenefitDTO get(String seq) {
        try {

            String sql = "SELECT benefit_seq, name, type,  TO_CHAR(START_DATE, 'YYYY-MM-DD') AS start_date, TO_CHAR(END_DATE,'YYYY-MM-DD') AS end_date, discount_rate, img FROM TBLBENEFIT where BENEFIT_SEQ = ?";

            pstat = conn.prepareStatement(sql);
            pstat.setString(1, seq);

            rs = pstat.executeQuery();

            if (rs.next()) {

                BenefitDTO dto = new BenefitDTO();

                dto.setBenefit_seq(rs.getString("benefit_seq"));
                dto.setName(rs.getString("name"));
                dto.setType(rs.getString("type"));
                dto.setStart_date(rs.getString("start_date"));
                dto.setEnd_date(rs.getString("end_date"));
                dto.setDiscount_rate(rs.getString("discount_rate"));
                dto.setImg(rs.getString("img"));

                dto.setName(rs.getString("name"));

                return dto;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int benefitEdit(BenefitDTO dto) {
        try {

            String sql = "update TBLBENEFIT set NAME = ?,START_DATE = ? , END_DATE = ? ,DISCOUNT_RATE = ? ,IMG = ? where BENEFIT_SEQ = ?";

            pstat = conn.prepareStatement(sql);
            pstat.setString(1, dto.getName());
            pstat.setString(2, dto.getStart_date());
            pstat.setString(3, dto.getEnd_date());
            pstat.setString(4, dto.getDiscount_rate());
            pstat.setString(5, dto.getImg());
            pstat.setString(6, dto.getBenefit_seq());

            return pstat.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }


        return 0;


    }

    public int del(String seq) {
        try {

            String sql = "delete from TBLBENEFIT where BENEFIT_SEQ = ?";

            pstat = conn.prepareStatement(sql);
            pstat.setString(1, seq);

            return pstat.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;

    }
}




