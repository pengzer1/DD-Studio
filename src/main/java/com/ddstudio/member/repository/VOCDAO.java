package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.InquiryDTO;
import com.ddstudio.member.model.VOCDTO;

public class VOCDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public VOCDAO() {
		this.conn = DBUtil.open();
	}

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
