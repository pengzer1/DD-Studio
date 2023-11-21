package com.ddstudio.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.user.model.SearchDTO;
import com.ddstudio.user.model.UserDTO;

/*
 * 작성자: 이승원
 */
public class UserDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	/**
	 * 생성자: 데이터베이스 연결
	 */
	public UserDAO() {
		this.conn = DBUtil.open();
	}

	/**
	 * 로그인
	 *
	 * @param dto 사용자 정보를 담은 UserDTO 객체
	 * @return 로그인 성공 시 UserDTO 객체, 실패 시 null
	 */
	public UserDTO login(UserDTO dto) {

		try {

			String sql = "select * from tblUser where email = ? and pw = ? and ing = 'Y'";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, dto.getPw());

			rs = pstat.executeQuery();

			if (rs.next()) {

				UserDTO result = new UserDTO();

				result.setEmail(rs.getString("email"));
				result.setUser_seq(rs.getString("user_seq"));
				result.setName(rs.getString("name"));
				result.setLv(rs.getString("lv"));

				return result;
			}

		} catch (Exception e) {
			System.out.println("UserDao.login()");
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 회원 가입
	 *
	 * @param dto 사용자 정보를 담은 UserDTO 객체
	 * @return 회원 가입 성공 시 1, 실패 시 0
	 */
	public int register(UserDTO dto) {

		try {
			String sql = "insert into tblUser (user_seq, name, email, pw, tel, address, birth, lv, ing) values (seqtblUser.nextVal, ?, ?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd'), '1', 'Y')";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getEmail());
			pstat.setString(3, dto.getPw());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getAddress());
			pstat.setString(6, dto.getBirth());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserDAO.register()");
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * 이메일 중복 검사
	 *
	 * @param email 검사할 이메일
	 * @return 중복된 이메일 수
	 */
	public int check(String email) {

		try {

			String sql = "select count(*) as cnt from tblUser where email = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("UserDAO.check()");
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * 아이디 찾기
	 *
	 * @param dto 사용자 정보를 담은 UserDTO 객체
	 * @return 찾은 이메일 정보를 담은 UserDTO 객체
	 */
	public UserDTO findId(UserDTO dto) {

		try {

			String sql = "select email from tblUser where name = ? and tel = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getTel());

			rs = pstat.executeQuery();

			if (rs.next()) {

				UserDTO result = new UserDTO();

				result.setEmail(rs.getString("email"));

				return result;
			}

		} catch (Exception e) {
			System.out.println("UserDao.findId()");
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 비밀번호 변경 전 계정 존재 여부 확인
	 *
	 * @param dto 사용자 정보를 담은 UserDTO 객체
	 * @return 계정 존재 여부를 나타내는 값 (존재 시 1, 미존재 시 0)
	 */
	public int isFindPw(UserDTO dto) {
		try {
			String sql = "select count(*) as cnt from tblUser where email = ? and tel = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getEmail());
			pstat.setString(2, dto.getTel());

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println("UserDao.isFindPw()");
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * 비밀번호 변경
	 *
	 * @param dto 사용자 정보를 담은 UserDTO 객체
	 * @return 비밀번호 변경 성공 시 1, 실패 시 0
	 */
	public int changePw(UserDTO dto) {

		try {

			String sql = "update tblUser set pw = ? where email = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getEmail());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserDao.changePw()");
			e.printStackTrace();
		}

		return 0;
	}

	/**
	 * 검색
	 *
	 * @param searchWord 검색어
	 * @return 검색 결과를 담은 SearchDTO 객체의 리스트
	 */
	public ArrayList<SearchDTO> search(String searchWord) {
		ArrayList<SearchDTO> searchResult = new ArrayList<>();

		try {
			String sql = "SELECT * FROM vwSearch WHERE " + "ATTRACTION_NAME LIKE ? OR " + "MBTI_RESULT LIKE ? OR "
					+ "MBTI_MBTI LIKE ? OR " + "COURSE_NAME LIKE ? OR " + "HASHTAG_NAME LIKE ? OR "
					+ "RESTAURANT_NAME LIKE ? OR " + "RESTAURANT_MENU LIKE ? OR " + "CATEGORY_NAME LIKE ? OR "
					+ "SHOP_NAME LIKE ? OR " + "SHOP_INFO LIKE ? OR " + "ITEM_NAME LIKE ? OR " + "ITEM_INFO LIKE ? OR "
					+ "CONVENIENT_NAME LIKE ? OR " + "FESTIVAL_NAME LIKE ? OR " + "FESTIVAL_INFO LIKE ? OR "
					+ "THEATER_NAME LIKE ? OR " + "MOVIE_NAME LIKE ? OR " + "NOTICE_SUBJECT LIKE ? OR "
					+ "NOTICE_CONTENT LIKE ? OR " + "BENEFIT_NAME LIKE ? OR " + "BENEFIT_TYPE LIKE ? OR "
					+ "FAQ_CATEGORY LIKE ? OR " + "FAQ_QUESTION LIKE ? OR " + "FAQ_ANSWER LIKE ?";

			pstat = conn.prepareStatement(sql);

			// 모든 컬럼에 대해 검색
			for (int i = 1; i <= 24; i++) {
				pstat.setString(i, "%" + searchWord + "%");
			}

			rs = pstat.executeQuery();

			while (rs.next()) {
				SearchDTO result = new SearchDTO();

				result.setAttractionName(rs.getString("ATTRACTION_NAME"));
				result.setMbtiResult(rs.getString("MBTI_RESULT"));
				result.setMbtiMbti(rs.getString("MBTI_MBTI"));
				result.setCourseName(rs.getString("COURSE_NAME"));
				result.setHashtagName(rs.getString("HASHTAG_NAME"));
				result.setRestaurantName(rs.getString("RESTAURANT_NAME"));
				result.setRestaurantMenu(rs.getString("RESTAURANT_MENU"));
				result.setCategoryName(rs.getString("CATEGORY_NAME"));
				result.setShopName(rs.getString("SHOP_NAME"));
				result.setShopInfo(rs.getString("SHOP_INFO"));
				result.setItemName(rs.getString("ITEM_NAME"));
				result.setItemInfo(rs.getString("ITEM_INFO"));
				result.setConvenientName(rs.getString("CONVENIENT_NAME"));
				result.setFestivalName(rs.getString("FESTIVAL_NAME"));
				result.setFestivalInfo(rs.getString("FESTIVAL_INFO"));
				result.setTheaterName(rs.getString("THEATER_NAME"));
				result.setMovieName(rs.getString("MOVIE_NAME"));
				result.setNoticeSubject(rs.getString("NOTICE_SUBJECT"));
				result.setNoticeContent(rs.getString("NOTICE_CONTENT"));
				result.setBenefitName(rs.getString("BENEFIT_NAME"));
				result.setBenefitType(rs.getString("BENEFIT_TYPE"));
				result.setFaqCategory(rs.getString("FAQ_CATEGORY"));
				result.setFaqQuestion(rs.getString("FAQ_QUESTION"));
				result.setFaqAnswer(rs.getString("FAQ_ANSWER"));

				// System.out.println("ATTRACTION_NAME: " + rs.getString("ATTRACTION_NAME"));

				searchResult.add(result);
			}
		} catch (Exception e) {
			System.out.println("UserDAO.search()");
			e.printStackTrace();
		}

		return searchResult;
	}

	/**
	 * 해시태그 목록 조회
	 *
	 * @return 해시태그 목록을 담은 문자열의 리스트
	 */
	public ArrayList<String> getHashtagList() {
		ArrayList<String> hashtagList = new ArrayList<>();

		try {
			String query = "SELECT NAME FROM tblHashtag";
			stat = conn.createStatement();
			rs = stat.executeQuery(query);

			while (rs.next()) {
				String hashtagName = rs.getString("NAME");

				hashtagList.add(hashtagName);
			}
		} catch (Exception e) {
			System.out.println("UserDAO.getHashtagList()");
			e.printStackTrace();
		}

		return hashtagList;
	}

}