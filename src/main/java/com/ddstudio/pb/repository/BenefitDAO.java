package com.ddstudio.pb.repository;

import com.ddstudio.DBUtil;
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

            String sql = "select * from TBLBENEFIT ";

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
                dto.setBenefit_date(rs.getString("benefit_date"));
                dto.setDiscount_rate(rs.getString("discount_rate"));


                list.add(dto);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }
}
