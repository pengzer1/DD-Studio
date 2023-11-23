package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.InquiryDTO;
import com.ddstudio.member.model.VOCDTO;

/**
 * VOC(고객 문의) 정보에 관련된 데이터베이스 작업을 수행하는 클래스입니다.
 * 
 * 이 클래스는 DBUtil을 사용하여 데이터베이스 연결을 관리합니다.
 * 
 * 작성자: 황주원
 */
public class VOCDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public VOCDAO() {
		this.conn = DBUtil.open();
	}

	 /**
     * 특정 이메일로 사용자의 VOC(고객 문의) 목록을 조회하는 메서드입니다.
     * 
     * @param email VOC 목록을 조회할 사용자의 이메일 주소
     * @return      사용자의 VOC 목록을 담은 VOCDTO 객체들의 리스트
     */
	public ArrayList<VOCDTO> get(String email) {

		try {

			String sql = "select voc_seq, type, subject, regdate, answer from vwUserVOC where email = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);

			rs = pstat.executeQuery();

			ArrayList<VOCDTO> list = new ArrayList<VOCDTO>();

			while (rs.next()) {

				VOCDTO dto = new VOCDTO();

				dto.setSeq(rs.getString("voc_seq"));
				dto.setType(rs.getString("type"));
				dto.setSubject(rs.getString("subject"));
				dto.setAnswer(rs.getString("answer"));
				dto.setRegdate(rs.getString("regdate"));
				

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
     * 특정 VOC(고객 문의) 번호에 해당하는 상세 정보를 조회하는 메서드입니다.
     * 
     * @param seq 조회할 VOC 번호
     * @return    VOC 번호에 해당하는 상세 정보를 담은 VOCDTO 객체
     */
	public VOCDTO detail(String seq) {

		try {

			String sql = "select * from tblvoc where voc_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				VOCDTO dto = new VOCDTO();

				dto.setSeq(rs.getString("voc_seq"));
				dto.setType(rs.getString("type"));
				dto.setService_type(rs.getString("service_type"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAttach(rs.getString("attach"));
				dto.setVisit_date(rs.getString("visit_date"));
				dto.setAnswer(rs.getString("answer"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setUser_seq(rs.getString("user_seq"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}
