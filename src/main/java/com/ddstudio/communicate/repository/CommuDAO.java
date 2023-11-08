package com.ddstudio.communicate.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.ddstudio.DBUtil;
import com.ddstudio.communicate.model.NoticeDTO;

public class CommuDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CommuDAO() {
		
		this.conn = DBUtil.open();
		
	}
	
	/* 공지사항	*/
	
	public int addNotice(NoticeDTO dto) {
		
		try {

			String sql = "insert into tblNotice (notice_seq, subject, content, regdate, attach, fix) values (seqtblNotice, ?, ?, default, ?, ?)";

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
	
	public ArrayList<NoticeDTO> getNoticeList(HashMap<String, String> map) {

		try {
			
			String condition = "";
			
			if (map.get("searchStatus").equals("y")) {
				
				condition = String.format("where %s like '%%%s%%'", map.get("category"), map.get("word"));
				
			}
			
			String sql = String.format("select * from (select n.*, rownum as rnum from tblNotice n %s) where rnum between %s and %s order by fix desc, regdate desc", condition, map.get("startIndex"), map.get("endIndex"));
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
			
			while (rs.next()) {
				
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_seq(rs.getString("notice_seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAttach(rs.getString("attach"));
				dto.setFix(rs.getString("fix"));
				
				list.add(dto);
				
			}	
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	public int getTotalPosts() {

		try {

			String sql = "select count(*) as cnt from tblNotice";

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
	
	public NoticeDTO getNotice(String seq) {

		try {
			
			String sql = "select * from tblNotice where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_seq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAttach(rs.getString("attach"));
				dto.setFix(rs.getString("fix"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	public int editNotice(NoticeDTO dto) {

		try {

			String sql = "update tblNotice set subject = ?, content = ?, attach = ?, fix = ? where seq = ?";

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

	public int deleteNotice(String seq) {

		try {

			String sql = "delete from tblNotice where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

}
