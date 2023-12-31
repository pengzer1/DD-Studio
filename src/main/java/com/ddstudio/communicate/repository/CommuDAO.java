package com.ddstudio.communicate.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.ddstudio.DBUtil;
import com.ddstudio.communicate.model.FAQDTO;
import com.ddstudio.communicate.model.InquiryDTO;
import com.ddstudio.communicate.model.LostPropertyDTO;
import com.ddstudio.communicate.model.NoticeDTO;
import com.ddstudio.communicate.model.ReviewDTO;
import com.ddstudio.communicate.model.ReviewImgDTO;
import com.ddstudio.communicate.model.VOCDTO;

/**
 * CommuDAO는 커뮤니케이션과 관련된 데이터베이스 액세스를 담당하는 클래스입니다.
 * 
 * @author 차수민
 */
public class CommuDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	/**
     * CommuDAO의 생성자입니다. 데이터베이스 연결을 수행합니다.
     */
	public CommuDAO() {
		
		this.conn = DBUtil.open();
		
	}
	
	/* 공지사항	*/
	
	/**
     * 공지사항을 추가하는 메서드입니다.
     *
     * @param dto 추가할 NoticeDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int addNotice(NoticeDTO dto) {
		
		try {

			String sql = "insert into tblNotice (notice_seq, subject, content, attach, fix) values (seqtblNotice.nextVal, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getAttach());
			pstat.setString(4, dto.getFix());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	/**
     * 공지사항 목록을 조회하는 메서드입니다.
     *
     * @param map 조회 조건을 담고 있는 HashMap
     * @return 조회된 NoticeDTO 객체의 목록
     */
	public ArrayList<NoticeDTO> getNoticeList(HashMap<String, String> map) {

		try {
			
			String condition = "";
			
			if (map.get("searchStatus").equals("y")) {
				
				condition = String.format("where %s like '%%%s%%'", map.get("category"), map.get("word"));
				
			}

			String sql = String.format("select * from (select n.*, rownum as rnum from (select * from tblNotice order by fix desc, regdate desc, notice_seq desc) n %s) where rnum between %s and %s", condition, map.get("startIndex"), map.get("endIndex"));
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
			
			while (rs.next()) {
				
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_seq(rs.getString("notice_seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAttach(rs.getString("attach"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setFix(rs.getString("fix"));
				
				list.add(dto);
				
			}	
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	/**
     * 전체 공지사항 게시물 수를 반환하는 메서드입니다.
     *
     * @param map 검색 조건을 담고 있는 HashMap
     * @return 전체 공지사항 게시물 수
     */
	public int getTotalPosts(HashMap<String, String> map) {

		try {
			
			String sql = "";
			
			if (map.get("searchStatus").equals("y")) {
				
				String condition = String.format("where %s like '%%%s%%'", map.get("category"), map.get("word"));
				
				sql = String.format("select count(*) as cnt from (select n.*, rownum as rnum from (select * from tblNotice order by fix desc, regdate desc, notice_seq desc) n %s)", condition);
				
			} else {
				
				sql = "select count(*) as cnt from tblNotice";
				
			}

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	/**
     * 특정 공지사항의 상세 정보를 조회하는 메서드입니다.
     *
     * @param seq 조회할 공지사항의 고유 번호
     * @return 조회된 NoticeDTO 객체
     */
	public NoticeDTO getNotice(String seq) {

		try {
			
			String sql = "select * from tblNotice where notice_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_seq(rs.getString("notice_seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAttach(rs.getString("attach"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setFix(rs.getString("fix"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	/**
     * 공지사항을 수정하는 메서드입니다.
     *
     * @param dto 수정할 NoticeDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int editNotice(NoticeDTO dto) {

		try {

			String sql = "update tblNotice set subject = ?, content = ?, attach = ?, fix = ? where notice_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getAttach());
			pstat.setString(4, dto.getFix());
			pstat.setString(5, dto.getNotice_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 공지사항을 삭제하는 메서드입니다.
     *
     * @param seq 삭제할 공지사항의 고유 번호
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int deleteNotice(String seq) {

		try {

			String sql = "delete from tblNotice where notice_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	/* 이용문의 */

	/**
     * 이메일을 기반으로 사용자 정보를 조회하는 메서드입니다.
     *
     * @param email 조회할 사용자의 이메일
     * @return 조회된 사용자 정보를 담은 InquiryDTO 객체, 실패 시 null 반환
     */
	public InquiryDTO getUserInfo(String email) {
		
		try {
				
			String sql = "select user_seq, name from tblUser where email = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				InquiryDTO dto = new InquiryDTO();
				
				dto.setUser_seq(rs.getString("user_seq"));
				dto.setName(rs.getString("name"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * 이용문의를 추가하는 메서드입니다.
     *
     * @param dto 추가할 InquiryDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int addInquiry(InquiryDTO dto) {
		
		try {

			String sql = "insert into tblInquiry (inquiry_seq, type, subject, content, attach, user_seq) values (seqtblInquiry.nextVal, ?, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getType());
			pstat.setString(2, dto.getSubject());
			pstat.setString(3, dto.getContent());
			pstat.setString(4, dto.getAttach());
			pstat.setString(5, dto.getUser_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 이용문의 목록을 조회하는 메서드입니다.
     *
     * @param map 조회 조건을 담고 있는 HashMap
     * @return 조회된 InquiryDTO 객체의 목록, 실패 시 null 반환
     */
	public ArrayList<InquiryDTO> getInquiryList(HashMap<String, String> map) {

		try {
			
			String condition = "";
			
			if (map.get("searchStatus").equals("y")) {
				
				condition = String.format("where %s like '%%%s%%'", map.get("category"), map.get("word"));
				
			}

			String sql = String.format("select * from (select i.*, rownum as rnum from (select i.*, name, email from tblInquiry i inner join tblUser u on i.user_seq = u.user_seq order by regdate desc, inquiry_seq desc) i %s) where rnum between %s and %s", condition, map.get("startIndex"), map.get("endIndex"));
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<InquiryDTO> list = new ArrayList<InquiryDTO>();
			
			while (rs.next()) {
				
				InquiryDTO dto = new InquiryDTO();
				
				dto.setInquiry_seq(rs.getString("inquiry_seq"));
				dto.setType(rs.getString("type"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAttach(rs.getString("attach"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAnswer(rs.getString("answer"));
				dto.setUser_seq(rs.getString("user_seq"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				
				list.add(dto);
				
			}	
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * 전체 이용문의 수를 반환하는 메서드입니다.
     *
     * @param map 검색 조건을 담고 있는 HashMap
     * @return 전체 이용문의 수, 실패 시 0 반환
     */
	public int getTotalInquiries(HashMap<String, String> map) {

		try {
			
			String sql = "";
			
			if (map.get("searchStatus").equals("y")) {
				
				String condition = String.format("where %s like '%%%s%%'", map.get("category"), map.get("word"));
					
				sql = String.format("select count(*) as cnt from (select i.*, rownum as rnum from (select i.*, name, email from tblInquiry i inner join tblUser u on i.user_seq = u.user_seq order by regdate desc, inquiry_seq desc) i %s)", condition);

			} else {
				
				sql = "select count(*) as cnt from tblInquiry";
				
			}

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 특정 이용문의의 상세 정보를 조회하는 메서드입니다.
     *
     * @param seq 조회할 이용문의의 고유 번호
     * @return 조회된 InquiryDTO 객체, 실패 시 null 반환
     */
	public InquiryDTO getInquiry(String seq) {

		try {
			
			String sql = "select * from tblInquiry where inquiry_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				InquiryDTO dto = new InquiryDTO();
				
				dto.setInquiry_seq(rs.getString("inquiry_seq"));
				dto.setType(rs.getString("type"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAttach(rs.getString("attach"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAnswer(rs.getString("answer"));
				dto.setUser_seq(rs.getString("user_seq"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * 이용문의를 삭제하는 메서드입니다.
     *
     * @param seq 삭제할 이용문의의 고유 번호
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int deleteInquiry(String seq) {

		try {

			String sql = "delete from tblInquiry where inquiry_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 이용문의 답변을 업데이트하는 메서드입니다.
     *
     * @param action 답변 동작 (add, edit, delete)
     * @param dto    업데이트할 InquiryDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int updateInquiryAnswer(String action, InquiryDTO dto) {

		try {
			
			String sql = "update tblInquiry set answer = ? where inquiry_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			if (action.equals("add") || action.equals("edit")) {
				
				pstat.setString(1, dto.getAnswer());
				
			} else {
				
				pstat.setString(1, null);
				
			}

			pstat.setString(2, dto.getInquiry_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	/* VOC */
	
	/**
     * 이메일을 기반으로 사용자의 기본 정보를 조회하는 메서드입니다.
     *
     * @param email 조회할 사용자의 이메일
     * @return 조회된 사용자 정보를 담은 VOCDTO 객체, 실패 시 null 반환
     */
	public VOCDTO getUserBasicInfo(String email) {
		
		try {
				
			String sql = "select user_seq, name, tel from tblUser where email = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				VOCDTO dto = new VOCDTO();
				
				dto.setUser_seq(rs.getString("user_seq"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	/**
     * 개인 예약 정보를 조회하여 방문 날짜를 반환하는 메서드입니다.
     *
     * @param email     조회할 사용자의 이메일
     * @param visitDate 방문 날짜를 담을 ArrayList
     * @return 조회된 방문 날짜 목록, 실패 시 null 반환
     */
	public ArrayList<String> getIndividualBookingInfo(String email, ArrayList<String> visitDate) {
		
		try {
				
			String sql = "select name, email, tel, visit_date from tblUser u inner join tblUserBook ub on u.user_seq = ub.user_seq inner join tblTicketBook tb on ub.ticket_book_seq = tb.ticket_book_seq where (email = ?) and (visit_date between sysdate - interval '1' month and sysdate)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				String date = rs.getString("visit_date");
				
				date = date.substring(0, 10);
				
				visitDate.add(date);
				
			}
			
			return visitDate;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	/**
     * 단체 예약 정보를 조회하여 방문 날짜를 반환하는 메서드입니다.
     *
     * @param email     조회할 사용자의 이메일
     * @param visitDate 방문 날짜를 담을 ArrayList
     * @return 조회된 방문 날짜 목록, 실패 시 null 반환
     */
	public ArrayList<String> getGroupBookingInfo(String email, ArrayList<String> visitDate) {

		try {
			
			String sql = "select name, email, tel, visit_date from tblUser u inner join tblUserGroupBook ugb on u.user_seq = ugb.user_seq inner join tblGroupBook gb on ugb.group_book_seq = gb.group_book_seq where (email = ?) and (visit_date between sysdate - interval '1' month and sysdate)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				String date = rs.getString("visit_date");
				
				date = date.substring(0, 10);
				
				visitDate.add(date);
				
			}
			
			return visitDate;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	/**
     * VOC(고객 의견 및 불만)를 추가하는 메서드입니다.
     *
     * @param dto 추가할 VOCDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int addVOC(VOCDTO dto) {

		try {

			String sql = "insert into tblVOC (voc_seq, type, service_type, subject, content, attach, visit_date, user_seq) values (seqtblVOC.nextVal, ?, ?, ?, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getType());
			pstat.setString(2, dto.getService_type());
			pstat.setString(3, dto.getSubject());
			pstat.setString(4, dto.getContent());
			pstat.setString(5, dto.getAttach());
			pstat.setString(6, dto.getVisit_date());
			pstat.setString(7, dto.getUser_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * VOC 목록을 조회하는 메서드입니다.
     *
     * @param map 조회 조건을 담고 있는 HashMap
     * @return 조회된 VOCDTO 객체의 목록, 실패 시 null 반환
     */
	public ArrayList<VOCDTO> getVOCList(HashMap<String, String> map) {

		try {
			
			String condition = "";
			
			if (map.get("searchStatus").equals("y")) {
				
				condition = String.format("where %s like '%%%s%%'", map.get("category"), map.get("word"));
				
			}

			String sql = String.format("select * from (select v.*, rownum as rnum from (select v.*, name, email, tel from tblVOC v inner join tblUser u on v.user_seq = u.user_seq order by regdate desc) v %s) where rnum between %s and %s", condition, map.get("startIndex"), map.get("endIndex"));
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<VOCDTO> list = new ArrayList<VOCDTO>();
			
			while (rs.next()) {
				
				VOCDTO dto = new VOCDTO();
				
				dto.setVoc_seq(rs.getString("voc_seq"));
				dto.setType(rs.getString("type"));
				dto.setService_type(rs.getString("service_type"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAttach(rs.getString("attach"));
				dto.setVisit_date(rs.getString("visit_date"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAnswer(rs.getString("answer"));
				dto.setUser_seq(rs.getString("user_seq"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				
				list.add(dto);
				
			}	
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * 전체 VOC 수를 반환하는 메서드입니다.
     *
     * @param map 검색 조건을 담고 있는 HashMap
     * @return 전체 VOC 수, 실패 시 0 반환
     */
	public int getTotalVOC(HashMap<String, String> map) {

		try {
			
			String sql = "";
			
			if (map.get("searchStatus").equals("y")) {
				
				String condition = String.format("where %s like '%%%s%%'", map.get("category"), map.get("word"));
					
				sql = String.format("select count(*) as cnt from (select v.*, rownum as rnum from (select v.*, name, email, tel from tblVOC v inner join tblUser u on v.user_seq = u.user_seq order by regdate desc) v %s)", condition);

			} else {
				
				sql = "select count(*) as cnt from tblVOC";
				
			}

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 특정 VOC의 상세 정보를 조회하는 메서드입니다.
     *
     * @param seq 조회할 VOC의 고유 번호
     * @return 조회된 VOCDTO 객체, 실패 시 null 반환
     */
	public VOCDTO getVOC(String seq) {

		try {
			
			String sql = "select * from tblVOC where voc_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				VOCDTO dto = new VOCDTO();
				
				dto.setVoc_seq(rs.getString("voc_seq"));
				dto.setType(rs.getString("type"));
				dto.setService_type(rs.getString("service_type"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAttach(rs.getString("attach"));
				dto.setVisit_date(rs.getString("visit_date"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAnswer(rs.getString("answer"));
				dto.setUser_seq(rs.getString("user_seq"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * VOC를 삭제하는 메서드입니다.
     *
     * @param seq 삭제할 VOC의 고유 번호
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int deleteVOC(String seq) {

		try {

			String sql = "delete from tblVOC where voc_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * VOC 답변을 업데이트하는 메서드입니다.
     *
     * @param action 답변 동작 (add, edit, delete)
     * @param dto    업데이트할 VOCDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int updateVOCAnswer(String action, VOCDTO dto) {

		try {
			
			String sql = "update tblVOC set answer = ? where voc_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			if (action.equals("add") || action.equals("edit")) {
				
				pstat.setString(1, dto.getAnswer());
				
			} else {
				
				pstat.setString(1, null);
				
			}

			pstat.setString(2, dto.getVoc_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	/* LostProperty */
	
	/**
     * 분실물을 추가하는 메서드입니다.
     *
     * @param dto 추가할 LostPropertyDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int addLostProperty(LostPropertyDTO dto) {

		try {

			String sql = "insert into tblLostProperty (lost_property_seq, type, name, location, img, lost_property_date, result) values (seqtblLostProperty.nextVal, ?, ?, ?, ?, ?, '보관중')";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getType());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getLocation());
			pstat.setString(4, dto.getImg());
			pstat.setString(5, dto.getLost_property_date());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 분실물 목록을 조회하는 메서드입니다.
     *
     * @param map 조회 조건을 담고 있는 HashMap
     * @return 조회된 LostPropertyDTO 객체의 목록, 실패 시 null 반환
     */
	public ArrayList<LostPropertyDTO> getLostPropertyList(HashMap<String, String> map) {

		try {
			
			String condition = "";
			
			if (map.get("searchStatus").equals("y")) {

				condition = String.format("where %s like '%%%s%%'", map.get("category"), map.get("word"));

			}
			
			if (map.containsKey("startDate") && map.containsKey("endDate")) {
				
	            String dateCondition = String.format("lost_property_date between '%s' and '%s'", map.get("startDate"), map.get("endDate"));
	            
	            if (condition.isEmpty()) {
	            	
	                condition = "where " + dateCondition;
	                
	            } else {
	            	
	                condition += " and " + dateCondition;
	                
	            }
	            
	        }

			String sql = String.format("select * from (select l.*, rownum as rnum from (select * from tblLostProperty order by lost_property_seq desc) l %s) where rnum between %s and %s", condition, map.get("startIndex"), map.get("endIndex"));
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<LostPropertyDTO> list = new ArrayList<LostPropertyDTO>();
			
			while (rs.next()) {
				
				LostPropertyDTO dto = new LostPropertyDTO();
				
				dto.setLost_property_seq(rs.getString("lost_property_seq"));
				dto.setType(rs.getString("type"));
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setLost_property_date(rs.getString("lost_property_date"));
				dto.setImg(rs.getString("img"));
				dto.setResult(rs.getString("result"));
				
				list.add(dto);
				
			}	
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * 전체 분실물 수를 반환하는 메서드입니다.
     *
     * @param map 검색 조건을 담고 있는 HashMap
     * @return 전체 분실물 수, 실패 시 0 반환
     */
	public int getTotalLostProperty(HashMap<String, String> map) {

		try {
			
			 StringBuilder conditionBuilder = new StringBuilder();
			
			if (map.get("searchStatus").equals("y")) {
				
				conditionBuilder.append(String.format("where %s like '%%%s%%'", map.get("category"), map.get("word")));
	            
	        }

	        if (map.containsKey("startDate") && map.containsKey("endDate")) {
	        	
	            if (conditionBuilder.length() > 0) {
	            	
	            	conditionBuilder.append(" and ");
	                
	            } else {
	            	
	            	conditionBuilder.append("where ");
	                
	            }
	            
	            conditionBuilder.append(String.format("lost_property_date between '%s' and '%s'", map.get("startDate"), map.get("endDate")));
	        
	        }

	        String condition = conditionBuilder.toString();

	        String sql = "";

	        if (!condition.isEmpty()) {
	        	
	            sql = String.format("select count(*) as cnt from (select l.*, rownum as rnum from (select * from tblLostProperty %s order by lost_property_seq desc) l)", condition);
	        
	        } else {
	        	
	            sql = "select count(*) as cnt from tblLostProperty";
	            
	        }
			
			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 특정 분실물의 상세 정보를 조회하는 메서드입니다.
     *
     * @param seq 조회할 분실물의 고유 번호
     * @return 조회된 LostPropertyDTO 객체, 실패 시 null 반환
     */
	public LostPropertyDTO getLostProperty(String seq) {

		try {
			
			String sql = "select * from tblLostProperty where lost_property_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				LostPropertyDTO dto = new LostPropertyDTO();
				
				dto.setLost_property_seq(rs.getString("lost_property_seq"));
				dto.setType(rs.getString("type"));
				dto.setName(rs.getString("name"));
				dto.setLocation(rs.getString("location"));
				dto.setLost_property_date(rs.getString("lost_property_date"));
				dto.setImg(rs.getString("img"));
				dto.setResult(rs.getString("result"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * 분실물 정보를 수정하는 메서드입니다.
     *
     * @param dto 수정할 LostPropertyDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int editLostProperty(LostPropertyDTO dto) {

		try {

			String sql = "update tblLostProperty set type = ?, name = ?, location = ?, lost_property_date = ?, img = ?, result = ? where lost_property_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getType());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getLocation());
			pstat.setString(4, dto.getLost_property_date());
			pstat.setString(5, dto.getImg());
			pstat.setString(6, dto.getResult());
			pstat.setString(7, dto.getLost_property_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 분실물을 삭제하는 메서드입니다.
     *
     * @param seq 삭제할 분실물의 고유 번호
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int deleteLostProperty(String seq) {

		try {

			String sql = "delete from tblLostProperty where lost_property_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	/* FAQ */
	
	/**
     * FAQ를 추가하는 메서드입니다.
     *
     * @param dto 추가할 FAQDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int addFAQ(FAQDTO dto) {

		try {

			String sql = "insert into tblFAQ (faq_seq, type, question, answer) values (seqtblFAQ.nextVal, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getType());
			pstat.setString(2, dto.getQuestion());
			pstat.setString(3, dto.getAnswer());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * FAQ 목록을 조회하는 메서드입니다.
     *
     * @param map 조회 조건을 담고 있는 HashMap
     * @return 조회된 FAQDTO 객체의 목록, 실패 시 null 반환
     */
	public ArrayList<FAQDTO> getFAQList(HashMap<String, String> map) {

		try {
			
			String condition = "";
			
			if (map.get("searchStatus").equals("y")) {

				condition = String.format("where question like '%%%s%%'", map.get("word"));

			}

			String sql = String.format("select * from (select f.*, rownum as rnum from (select * from tblFAQ where type = '%s' order by faq_seq desc) f %s) where rnum between %s and %s", map.get("type"), condition, map.get("startIndex"), map.get("endIndex"));
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<FAQDTO> list = new ArrayList<FAQDTO>();
			
			while (rs.next()) {
				
				FAQDTO dto = new FAQDTO();
				
				dto.setFaq_seq(rs.getString("faq_seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				dto.setAnswer(rs.getString("answer"));
				
				list.add(dto);
				
			}	
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * 전체 FAQ 수를 반환하는 메서드입니다.
     *
     * @param map 검색 조건을 담고 있는 HashMap
     * @return 전체 FAQ 수, 실패 시 0 반환
     */
	public int getTotalFAQ(HashMap<String, String> map) {

		try {
			
			String sql = "";
			
			if (map.get("searchStatus").equals("y")) {
				
				String condition = String.format("where question like '%%%s%%'", map.get("word"));
					
				sql = String.format("select count(*) as cnt from (select f.*, rownum as rnum from (select * from tblFAQ f where type = '%s' order by faq_seq desc) f %s)", map.get("type"), condition);

			} else {
				
				sql = String.format("select count(*) as cnt from tblFAQ where type = '%s'", map.get("type"));
				
			}

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 특정 FAQ의 상세 정보를 조회하는 메서드입니다.
     *
     * @param seq 조회할 FAQ의 고유 번호
     * @return 조회된 FAQDTO 객체, 실패 시 null 반환
     */
	public FAQDTO getFAQ(String seq) {

		try {
			
			String sql = "select * from tblFAQ where faq_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				FAQDTO dto = new FAQDTO();
				
				dto.setFaq_seq(rs.getString("faq_seq"));
				dto.setType(rs.getString("type"));
				dto.setQuestion(rs.getString("question"));
				dto.setAnswer(rs.getString("answer"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	/**
     * FAQ 정보를 수정하는 메서드입니다.
     *
     * @param dto 수정할 FAQDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int editFAQ(FAQDTO dto) {

		try {

			String sql = "update tblFAQ set type = ?, question = ?, answer = ? where faq_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getType());
			pstat.setString(2, dto.getQuestion());
			pstat.setString(3, dto.getAnswer());
			pstat.setString(4, dto.getFaq_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * FAQ를 삭제하는 메서드입니다.
     *
     * @param seq 삭제할 FAQ의 고유 번호
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int deleteFAQ(String seq) {

		try {

			String sql = "delete from tblFAQ where faq_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	/* Review */

	/**
     * Review 목록을 조회하는 메서드입니다.
     *
     * @param map 조회 조건을 담고 있는 HashMap
     * @return 조회된 ReviewDTO 객체의 목록, 실패 시 null 반환
     */
	public ArrayList<ReviewDTO> getReviewList(HashMap<String, String> map) {

		try {
			
			String condition = "";
			
			if (map.get("sort").equals("최신순")) {

				condition = "order by regdate desc, review_seq desc";

			} else if (map.get("sort").equals("조회순")) {
				
				condition = "order by readcount desc, review_seq desc";
				
			}

			String sql = String.format("select * from (select r.*, rownum as rnum from (select r.*, visit_date, (select img from tblReviewImg i where r.review_seq = i.review_seq and rownum = 1) as img from tblReview r inner join tblUserBook ub on r.user_book_seq = ub.user_book_seq inner join tblTicketBook tb on ub.ticket_book_seq = tb.ticket_book_seq %s) r) where rnum between %s and %s", condition, map.get("startIndex"), map.get("endIndex"));
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_seq(rs.getString("review_seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setUser_book_seq(rs.getString("user_book_seq"));
				dto.setVisit_date(rs.getString("visit_date"));
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
     * 전체 Review 수를 반환하는 메서드입니다.
     *
     * @param map 검색 조건을 담고 있는 HashMap
     * @return 전체 Review 수, 실패 시 0 반환
     */
	public int getTotalReviews(HashMap<String, String> map) {

		try {
			
			String sql = "select count(*) as cnt from tblReview";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	/**
     * 특정 Review의 상세 정보를 조회하는 메서드입니다.
     *
     * @param seq 조회할 Review의 고유 번호
     * @return 조회된 ReviewDTO 객체, 실패 시 null 반환
     */
	public ReviewDTO getReview(String seq) {

		try {
			
			String sql = "select * from (select r.*, rownum as rnum from (select r.*, visit_date from tblReview r inner join tblUserBook ub on r.user_book_seq = ub.user_book_seq inner join tblTicketBook tb on ub.ticket_book_seq = tb.ticket_book_seq) r) where review_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_seq(rs.getString("review_seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setUser_book_seq(rs.getString("user_book_seq"));
				dto.setVisit_date(rs.getString("visit_date"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	/**
     * 특정 Review에 속한 이미지 목록을 조회하는 메서드입니다.
     *
     * @param seq Review의 고유 번호
     * @return 조회된 ReviewImgDTO 객체의 목록, 실패 시 null 반환
     */
	public ArrayList<ReviewImgDTO> getReviewImgList(String seq) {

		try {
			
			String sql = "select * from tblReviewImg where review_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<ReviewImgDTO> list = new ArrayList<ReviewImgDTO>();
			
			while (rs.next()) {
				
				ReviewImgDTO dto = new ReviewImgDTO();
				
				dto.setReview_img_seq(rs.getString("review_img_seq"));
				dto.setImg(rs.getString("img"));
				dto.setReview_seq(rs.getString("review_seq"));
				
				list.add(dto);
				
			}

			return list;
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}

		return null;

	}

	/**
     * 특정 Review의 조회수를 증가시키는 메서드입니다.
     *
     * @param seq 조회수를 증가시킬 Review의 고유 번호
     */
	public void updateReadcount(String seq) {

		try {

			String sql = "update tblReview set readcount = readcount + 1 where review_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);
			
			pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
	}

	/**
     * Review를 수정하는 메서드입니다.
     *
     * @param dto 수정할 ReviewDTO 객체
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int editReview(ReviewDTO dto) {

		try {

			String sql = "update tblReview set subject = ?, content = ? where review_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getReview_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	/**
     * 특정 Review에 속한 이미지 목록을 삭제하는 메서드입니다.
     *
     * @param seq Review의 고유 번호
     */
	public void deleteReviewImgList(String seq) {

		try {

			String sql = "delete from tblReviewImg where review_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
	}

	/**
     * Review를 삭제하는 메서드입니다.
     *
     * @param seq 삭제할 Review의 고유 번호
     * @return 성공 시 1, 실패 시 0을 반환
     */
	public int deleteReview(String seq) {

		try {

			String sql = "delete from tblReview where review_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

}
