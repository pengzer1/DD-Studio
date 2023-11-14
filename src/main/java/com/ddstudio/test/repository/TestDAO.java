package com.ddstudio.test.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

			String sql = "select * from tblCourse";

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

			String sql = "delete from tblCourse where course_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, courseSeq);

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

}
