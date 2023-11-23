package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.InquiryDTO;

/**
 * 문의내역 정보관련 데이터베이스 작업을 수행하는 클래스
 * 
 * @author 황주원
 *
 */
public class InquiryDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	
	public InquiryDAO() {
		this.conn = DBUtil.open();
	}

	
	/**
	 * 문의 내역 정보 출력
	 * 
	 * @param email 로그인한 회원의 객체 정보
	 * @return 문의 내역 정보 리스트 출력
	 */
	public ArrayList<InquiryDTO> get(String email) {
		
		try {
			
			String sql = "select inquiry_seq, type, subject, regdate, answer from vwUserInquiry where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();	
			
			ArrayList<InquiryDTO> list = new ArrayList<InquiryDTO>();
			
			while (rs.next()) {
				
				InquiryDTO dto = new InquiryDTO();
				
				dto.setSeq(rs.getString("inquiry_seq"));
				dto.setType(rs.getString("type"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
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
	 * 문의 내역 자세하기보기 출력 
	 * 
	 * @param seq 문의내역번호
	 * @return 문의내역자세히보기 출력
	 */
	public InquiryDTO detail(String seq) {
		
		try {
			
			String sql = "select * from tblinquiry where inquiry_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				InquiryDTO dto = new InquiryDTO();
				
				dto.setSeq(rs.getString("inquiry_seq"));
				dto.setType(rs.getString("type"));
				dto.setSubject(rs.getString("subject"));
				dto.setAnswer(rs.getString("answer"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setContent(rs.getString("content"));
				dto.setAttach(rs.getString("attach"));
				dto.setUser_seq(rs.getString("user_seq"));
				
				return dto;
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	
}
