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

/**
 * BenefitDAO 입니다.
 * 데이터베이스와 상호 작용하여 혜택 정보를 처리하는 DAO 클래스로, 혜택의 조회, 추가, 수정, 삭제 등의 기능을 제공합니다.
 * 
 * @author 김형우
 */
public class BenefitDAO {
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    /**
     * 데이터베이스와 연결합니다.
     */
    public BenefitDAO() {

        this.conn = DBUtil.open();

    }

    /**
     * 일반혜택 리스트를 불러옵니다.
     * @return 혜택리스트를 반환합니다.
     */
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

    /**
     * 입력받은 시퀀스번호의 혜택정보를 불러옵니다.
     * @param seq 혜택의 시퀀스 번호입니다.
     * @return 혜택정보의 리스트를 리턴합니다.
     */
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

    /**
     * 일반 혜택을 추가합니다.
     * @param dto 혜택 객체를 받습니다.
     * @return 추가 성공시 1 을 실패시 0을 반환합니다.
     */
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

    /**
     * 카드/통신사 혜택을 추가하는 메서드입니다.
     * @param dto 추가할 혜택 객체를 받습니다.
     * @return  추가성공시 1을 , 실패시 0 을 반환합니다.
     */
    public int partnerShipBenefitAdd(BenefitDTO dto) {
        try {
            String sql = "insert into TBLBENEFIT(benefit_seq, name, type, start_date, end_date, discount_rate, img) values (SEQTBLBENEFIT.nextval,?,'카드/통신사',?,?,?,?)";

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

    /**
     * 혜택 하나의 객체를 불러옵니다.
     * @param seq 불러올 혜택의 시퀀스를 입력받습니다.
     * @return 입력받은 시퀀스의 혜택을 리턴합니다.
     */
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

    /**
     * 혜택부분을 수정하는 메서드입니다.
     * @param dto 수정할 혜택 객체를 받습니다.
     * @return 수정에 성공하면 1을 , 실패하면 0을 리턴합니다.
     */
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

    /**
     * 혜택을 삭제합니다.
     * @param seq 삭제할 혜택의 시퀀스번호를 받습니다.
     * @return  삭제에 성공하면 1을 , 실패하면  0을 리턴합니다.
     */
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

    /**
     * 헤택의 이름을 불러옵니다.
     * @param seq 불러올 헤택의 시퀀스 번호를 받습니다.
     * @return  해당 시퀀스 번호의 혜택이름을 반환합니다.
     */
    public BenefitDTO getName(String seq) {

        try {

            String sql = "SELECT  name FROM TBLBENEFIT where BENEFIT_SEQ = ?";

            pstat = conn.prepareStatement(sql);
            pstat.setString(1, seq);

            rs = pstat.executeQuery();

            ArrayList<BenefitDTO> list = new ArrayList<>();

            while (rs.next()) {

                BenefitDTO dto = new BenefitDTO();
                dto.setName(rs.getString("name"));


                list.add(dto);
            }



        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 일반혜택의 리스트를 불러옵니다.
     * @return 일반헤택의 리스트를 리턴합니다.
     */
    public ArrayList<BenefitDTO> nomalList() {

        ArrayList<BenefitDTO> list = new ArrayList<>();


        try {

            String sql = "SELECT benefit_seq, name, type,  TO_CHAR(START_DATE, 'YYYY-MM-DD') AS start_date, TO_CHAR(END_DATE,'YYYY-MM-DD') AS end_date, discount_rate, img FROM TBLBENEFIT where TYPE='일반'order by BENEFIT_SEQ desc  ";

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

    /**
     * 카드/통신사혜택을 불러옵니다.
     * @return 카드/통신사 혜택의 리스트를 반환합니다.
     */
    public ArrayList<BenefitDTO> cardList() {

        ArrayList<BenefitDTO> list = new ArrayList<>();


        try {

            String sql = "SELECT benefit_seq, name, type,  TO_CHAR(START_DATE, 'YYYY-MM-DD') AS start_date, TO_CHAR(END_DATE,'YYYY-MM-DD') AS end_date, discount_rate, img FROM TBLBENEFIT where TYPE='카드/통신사'order by BENEFIT_SEQ desc  ";

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
}




