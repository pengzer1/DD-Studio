package com.ddstudio.member.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.member.model.InquiryDTO;

public class InquiryDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public InquiryDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<InquiryDTO> get() {

		try {

			String sql = "select inquiry_seq, type, subject, regdate, answer from tblInquiry";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<InquiryDTO> list = new ArrayList<InquiryDTO>();

			while (rs.next()) {

				InquiryDTO dto = new InquiryDTO();

				dto.setInquiry_seq(rs.getString("inquiry_seq"));
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
}
