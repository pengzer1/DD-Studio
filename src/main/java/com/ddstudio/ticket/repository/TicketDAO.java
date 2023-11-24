package com.ddstudio.ticket.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.ticket.model.BenefitDTO;
import com.ddstudio.ticket.model.GroupBookDTO;
import com.ddstudio.ticket.model.TicketDTO;

/**
 * 데이터베이스와 상호 작용하여 예매 정보를 처리하는 DAO 클래스입니다.
 * 
 * @author pega0
 *
 */
public class TicketDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	/**
	 * TicketDAO 클래스의 생성자입니다. 데이터베이스 연결을 수행합니다.
	 */
	public TicketDAO() {

		this.conn = DBUtil.open();

	}

	/**
	 * 단체 예매를 추가합니다.
	 * @param dto 단체 예매 정보를 담고 있는 DTO
	 * @return 추가 확인 정수
	 */
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

	/**
	 * 예매한 단체 예매 일련번호를 조회합니다.
	 * @return 단체 예매 일련번호
	 */
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

	/**
	 * 유저 단체 예매를 추가합니다.
	 * @param user_seq 로그인한 유저 일련번호
	 * @param group_book_seq 단체 예매 일련번호
	 * @return 추가 확인 정수
	 */
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

	/**
	 * 혜택 정보를 조회합니다.
	 * @return 혜택 정보가 들어 있는 List
	 */
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

	/**
	 * 카드통신사 혜택을 조회합니다.
	 * @return 카드통신사 혜택이 들어 있는 List
	 */
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

	/**
	 * 개인 성인 금액을 조회합니다.
	 * @param type 티켓 타입
	 * @return 개인 성인 금액
	 */
	public TicketDTO getAdultPrice(String type) {

		try {

			String sql = "select * from tblticket where ticket_type = ? and age = '성인' and person_type = '개인'";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, type);

			rs = pstat.executeQuery();

			if (rs.next()) {

				TicketDTO dto = new TicketDTO();

				dto.setSeq(rs.getString("ticket_seq"));
				dto.setPrice(rs.getString("price"));

				return dto;
			}

		} catch (Exception e) {
			System.out.println("TicketDAO.getAdultPrice()");
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 개인 청소년 금액을 조회합니다.
	 * @param type 티켓 타입
	 * @return 개인 청소년 금액
	 */
	public TicketDTO getTeenagerPrice(String type) {

		try {

			String sql = "select * from tblticket where ticket_type = ? and age = '청소년' and person_type = '개인'";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, type);

			rs = pstat.executeQuery();

			if (rs.next()) {

				TicketDTO dto = new TicketDTO();

				dto.setSeq(rs.getString("ticket_seq"));
				dto.setPrice(rs.getString("price"));

				return dto;
			}

		} catch (Exception e) {
			System.out.println("TicketDAO.getTeenagerPrice()");
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 개인 어린이 금액을 조회합니다.
	 * @param type 티켓 타입
	 * @return 개인 어린이 금액
	 */
	public TicketDTO getChildPrice(String type) {

		try {

			String sql = "select * from tblticket where ticket_type = ? and age = '어린이' and person_type = '개인'";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, type);

			rs = pstat.executeQuery();

			if (rs.next()) {

				TicketDTO dto = new TicketDTO();

				dto.setSeq(rs.getString("ticket_seq"));
				dto.setPrice(rs.getString("price"));

				return dto;
			}

		} catch (Exception e) {
			System.out.println("TicketDAO.getChildPrice()");
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 개인 성인 예매를 추가합니다.
	 * @param adultDTO 개인 성인 예매 정보가 들어있는 DTO
	 * @return 추가 확인 정수
	 */
	public int addAdultReservation(TicketDTO adultDTO) {

		if (!adultDTO.getEa().equals("0")) {

			try {

				String sql = "insert into tblticketbook (ticket_book_seq, book_date, visit_date, ea, ticket_seq, benefit_seq, price) values (seqtblTicketBook.nextVal, sysdate, ?, ?, ?, ?, ?)";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, adultDTO.getDate());
				pstat.setString(2, adultDTO.getEa());
				pstat.setString(3, adultDTO.getSeq());
				pstat.setString(4, adultDTO.getBenefit_seq());
				pstat.setString(5, adultDTO.getPrice());

				return pstat.executeUpdate();

			} catch (Exception e) {
				System.out.println("TicketDAO.addAdultReservation()");
				e.printStackTrace();
			}

			return 0;

		}

		return -1;
	}

	/**
	 * 방금 예매한 일련번호를 조회합니다.
	 * @return 티켓 예매 일련번호
	 */
	public String getTicketBookSeq() {

		try {

			String sql = "select max(ticket_book_seq) as ticket_book_seq from tblTicketBook";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getString("ticket_book_seq");
			}

		} catch (Exception e) {
			System.out.println("TicketDAO.getTicketBookSeq()");
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 유저 예매를 추가합니다.
	 * @param user_seq 로그인한 유저 일련번호
	 * @param ticket_book_seq 예매 일련번호
	 * @return 추가 확인 정수
	 */
	public int addUserBook(String user_seq, String ticket_book_seq) {

		try {

			String sql = "insert into tbluserbook (user_book_seq, user_seq, ticket_book_seq) values (seqtbluserbook.nextVal, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user_seq);
			pstat.setString(2, ticket_book_seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("TicketDAO.addUserBook()");
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * 개인 청소년 예매를 추가합니다.
	 * @param teenagerDTO 개인 청소년 예매 정보가 들어있는 DTO
	 * @return 추가 확인 정수
	 */
	public int addTeenagerReservation(TicketDTO teenagerDTO) {

		if (!teenagerDTO.getEa().equals("0")) {

			try {

				String sql = "insert into tblticketbook (ticket_book_seq, book_date, visit_date, ea, ticket_seq, benefit_seq, price) values (seqtblTicketBook.nextVal, sysdate, ?, ?, ?, ?, ?)";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, teenagerDTO.getDate());
				pstat.setString(2, teenagerDTO.getEa());
				pstat.setString(3, teenagerDTO.getSeq());
				pstat.setString(4, teenagerDTO.getBenefit_seq());
				pstat.setString(5, teenagerDTO.getPrice());

				return pstat.executeUpdate();

			} catch (Exception e) {
				System.out.println("TicketDAO.addTeenagerReservation()");
				e.printStackTrace();
			}

			return 0;

		}

		return -1;

	}

	/**
	 * 개인 어린이 예매를 추가합니다.
	 * @param childDTO 개인 어린이 예매 정보가 들어있는 DTO
	 * @return 추가 확인 정수
	 */
	public int addChildReservation(TicketDTO childDTO) {
		if (!childDTO.getEa().equals("0")) {

			try {

				String sql = "insert into tblticketbook (ticket_book_seq, book_date, visit_date, ea, ticket_seq, benefit_seq, price) values (seqtblTicketBook.nextVal, sysdate, ?, ?, ?, ?, ?)";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, childDTO.getDate());
				pstat.setString(2, childDTO.getEa());
				pstat.setString(3, childDTO.getSeq());
				pstat.setString(4, childDTO.getBenefit_seq());
				pstat.setString(5, childDTO.getPrice());

				return pstat.executeUpdate();

			} catch (Exception e) {
				System.out.println("TicketDAO.addChildReservation()");
				e.printStackTrace();
			}

			return 0;

		}

		return -1;
	}

}
