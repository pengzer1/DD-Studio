package com.ddstudio.test.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.test.model.CourseDTO;
import com.ddstudio.test.model.MBTIDTO;

public class TestDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public TestDAO() {
		this.conn = DBUtil.open();
	}

	/*
	 * 코스 추가
	 */
	public int courseAdd(CourseDTO dto) {

		try {

			String sql = "INSERT INTO tblCourse (course_seq, name, img) VALUES (seqtblCourse.nextVal, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getImg());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("TestDAO.courseAdd()");
			e.printStackTrace();
		}

		return 0;
	}

	/*
	 * 코스 목록
	 */
	public ArrayList<CourseDTO> listCourse() {

		try {

			String sql = "select * from tblCourse order by course_seq";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<CourseDTO> list = new ArrayList<CourseDTO>();

			while (rs.next()) {

				CourseDTO dto = new CourseDTO();

				dto.setCourse_seq(rs.getString("course_seq"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			System.out.println("TestDAO.listCourse()");
			e.printStackTrace();
		}

		return null;
	}

	/*
	 * 코스 삭제
	 */
	public int deleteCourse(String courseSeq) {
		try {
			// tblMBTI에서 레코드 삭제
			String deleteMbtiSql = "delete from tblMBTI where course_seq = ?";
			pstat = conn.prepareStatement(deleteMbtiSql);
			pstat.setString(1, courseSeq);
			pstat.executeUpdate();

			// tblCourse에서 레코드 삭제
			String deleteCourseSql = "delete from tblCourse where course_seq = ?";
			pstat = conn.prepareStatement(deleteCourseSql);
			pstat.setString(1, courseSeq);

			// tblCourse 삭제 실행 및 결과 반환
			return pstat.executeUpdate();
		} catch (Exception e) {
			System.out.println("TestDAO.deleteCourse()");
			e.printStackTrace();
		}

		return 0;
	}

	/*
	 * MBTI 상세 정보 조회
	 */
	public MBTIDTO get(String mbti) {
		try {
			String sql = "select * from vwMBTIDetail where mbti = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mbti);

			rs = pstat.executeQuery();

			if (rs.next()) {
				MBTIDTO result = new MBTIDTO();

				result.setMbti_seq(rs.getString("mbti_seq"));
				result.setResult(rs.getString("result"));
				result.setMbti(rs.getString("mbti"));
				result.setCourse_seq(rs.getString("course_seq"));
				result.setCourse_name(rs.getString("course_name"));
				result.setCourse_img(rs.getString("course_img"));
				result.setAttraction_seq(rs.getString("attraction_seq"));
				result.setAttraction_name(rs.getString("attraction_name"));
				result.setAttraction_img(rs.getString("attraction_img"));

				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/*
	 * MBTI 목록
	 */
	public ArrayList<MBTIDTO> listMBTI() {

		try {

			String sql = "select * from tblMBTI order by mbti_seq";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<MBTIDTO> list = new ArrayList<MBTIDTO>();

			while (rs.next()) {

				MBTIDTO dto = new MBTIDTO();

				dto.setMbti_seq(rs.getString("mbti_seq"));
				dto.setResult(rs.getString("result"));
				dto.setMbti(rs.getString("mbti"));
				dto.setCourse_seq(rs.getString("course_seq"));
				dto.setAttraction_seq(rs.getString("attraction_seq"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			System.out.println("TestDAO.listMBTI()");
			e.printStackTrace();
		}

		return null;
	}

	/*
	 * 어트랙션 목록
	 */
	public ArrayList<AttractionDTO> listAttraction() {

		try {

			String sql = "select * from tblAttraction";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<AttractionDTO> list = new ArrayList<AttractionDTO>();

			while (rs.next()) {

				AttractionDTO dto = new AttractionDTO();

				dto.setAttraction_seq(rs.getString("attraction_seq"));
				dto.setName(rs.getString("name"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			System.out.println("TestDAO.listAttraction()");
			e.printStackTrace();
		}

		return null;
	}

	/*
	 * MBTI별 추천 추가
	 */
	public int mbtiAdd(MBTIDTO dto) {
		try {
			String sql = "INSERT INTO tblMBTI (mbti_seq, result, mbti, course_seq, attraction_seq) VALUES (seqtblMBTI.nextVal, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getResult());
			pstat.setString(2, dto.getMbti());
			pstat.setString(3, dto.getCourse_seq());
			pstat.setString(4, dto.getAttraction_seq());

			int result = pstat.executeUpdate();

			return result;
		} catch (Exception e) {
			System.out.println("TestDAO.mbtiAdd()");
			e.printStackTrace();
		}

		return 0;
	}

	/*
	 * MBTI (관련 정보 포함) 전체 호출
	 */
	public ArrayList<MBTIDTO> getAllMBTI() {
		ArrayList<MBTIDTO> mbtiList = new ArrayList<>();

		String sql = "SELECT * FROM vwMBTIDetail ORDER BY mbti_seq";

		try (PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				MBTIDTO mbti = new MBTIDTO();
				mbti.setMbti_seq(rs.getString("mbti_seq"));
				mbti.setResult(rs.getString("result"));
				mbti.setMbti(rs.getString("mbti"));
				mbti.setCourse_seq(rs.getString("course_seq"));
				mbti.setCourse_name(rs.getString("course_name"));
				mbti.setCourse_img(rs.getString("course_img"));
				mbti.setAttraction_seq(rs.getString("attraction_seq"));
				mbti.setAttraction_name(rs.getString("attraction_name"));
				mbti.setAttraction_img(rs.getString("attraction_img"));

				mbtiList.add(mbti);
			}
		} catch (Exception e) {
			System.out.println("TestDAO.getAllMBTI()");
			e.printStackTrace();
		}

		return mbtiList;
	}

	/*
	 * MBTI 삭제
	 */
	public int MBTIDel(String mbti_seq) {

		try {

			String sql = "delete from tblMBTI where mbti_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mbti_seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("TestDAO.MBTIDel()");
			e.printStackTrace();
		}

		return 0;
	}

	public ArrayList<AttractionDTO> getAttractionList() {
		
		ArrayList<AttractionDTO> list = new ArrayList<AttractionDTO>();

		try {
			String sql = "SELECT * FROM vwAttractionList ORDER BY attraction_seq";

			stat = conn.createStatement();

			// 쿼리 실행 및 결과 처리
			rs = stat.executeQuery(sql);

			while (rs.next()) {
				AttractionDTO dto = new AttractionDTO();
				dto.setAttraction_seq(rs.getString("attraction_seq"));
				dto.setName(rs.getString("attraction_name"));
				dto.setImg(rs.getString("attraction_img"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
