package com.ddstudio.test.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
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

}
