package com.ddstudio.test.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.test.model.CourseDTO;

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

}
