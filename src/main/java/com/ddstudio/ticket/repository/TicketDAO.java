package com.ddstudio.ticket.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.ticket.model.BenefitDTO;
import com.ddstudio.ticket.model.GroupBookDTO;

public class TicketDAO {
	
	private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    public TicketDAO() {

        this.conn = DBUtil.open();

    }

	public int addGroupReservation(GroupBookDTO dto) {
		
		try {

			String sql = "insert into tblGroupBook (group_book_seq, book_date, group_division, region, group_name, address, visit_date, visit_time) values (seqGroupBook.nextVal, sysdate, ?, ?, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getGroup_division());
			pstat.setString(2, dto.getRegion());
			pstat.setString(3, dto.getGroup_name());
			pstat.setString(4, dto.getAddress());
			pstat.setString(5, dto.getVisit_date());
			pstat.setString(6, dto.getVisit_time());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("TicketDAO.addGroupReservation()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getGroupBookSeq() {
		
		try {

			String sql = "select max(group_book_seq) as group_book_seq from tblGroupBook";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getString("group_book_seq");
			}

		} catch (Exception e) {
			System.out.println("TicketDAO.getGroupBookSeq()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int addUserGroupReservation(String user_seq, String group_book_seq) {
		
		try {

			String sql = "insert into tblUserGroupBook (user_group_book_seq, user_seq, group_book_seq) values (seqUserGroupBook.nextVal, ?, ?)";
			

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user_seq);
			pstat.setString(2, group_book_seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("TicketDAO.addUserGroupReservation()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<BenefitDTO> getBenefit() {
		
		try {
			
			String sql = "select * from tblbenefit where type = '일반' and TO_CHAR(sysdate,'YYYY-MM-DD') >= TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(sysdate,'YYYY-MM-DD') <= TO_CHAR(end_date,'YYYY-MM-DD')";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BenefitDTO> list = new ArrayList<BenefitDTO>();
			
			while (rs.next()) {
				
				BenefitDTO dto = new BenefitDTO();
				
				
				
				dto.setBenefit_seq(rs.getString("benefit_seq"));
				dto.setName(rs.getString("name"));
				dto.setType(rs.getString("type"));
				dto.setStart_date(rs.getString("start_date").substring(0, 10));
				dto.setEnd_date(rs.getString("end_date").substring(0, 10));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setImg(rs.getString("img"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("TicketDAO.getBenefit()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<BenefitDTO> getCardBenefit() {
		
		try {
			
			String sql = "select * from tblbenefit where type like '%카드%' and TO_CHAR(sysdate,'YYYY-MM-DD') >= TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(sysdate,'YYYY-MM-DD') <= TO_CHAR(end_date,'YYYY-MM-DD')";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BenefitDTO> list = new ArrayList<BenefitDTO>();
			
			while (rs.next()) {
				
				BenefitDTO dto = new BenefitDTO();
				
				dto.setBenefit_seq(rs.getString("benefit_seq"));
				dto.setName(rs.getString("name"));
				dto.setType(rs.getString("type"));
				dto.setStart_date(rs.getString("start_date").substring(0, 10));
				dto.setEnd_date(rs.getString("end_date").substring(0, 10));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setImg(rs.getString("img"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("TicketDAO.getCardBenefit()");
			e.printStackTrace();
		}
		
		return null;
	}

}
