package com.ddstudio.activity.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.model.AttractionCloseDTO;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.AttractionImgDTO;
import com.ddstudio.activity.model.FestivalDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.admin.model.ThemeDTO;


public class ActDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ActDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<AttractionDTO> attractionList() {

		try {
					
					String sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1)as img from tblAttraction a where name not like '%(운영종료)%'";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<AttractionDTO> list = new ArrayList<AttractionDTO>();
					while (rs.next()) {
						
						AttractionDTO dto = new AttractionDTO();
						
						dto.setAttraction_seq(rs.getString("attraction_seq"));
						dto.setName(rs.getString("name"));
						dto.setCapacity(rs.getString("capacity"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setTime(rs.getString("time"));
						dto.setRestriction(rs.getString("restriction"));
						dto.setTheme_seq(rs.getString("theme_seq"));
						dto.setIs_test(rs.getString("is_test"));
						dto.setImg(rs.getString("img"));
						
						list.add(dto);
						
					}
					
//					pstat.close();
//					conn.close();
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.list");
					e.printStackTrace();
				}
		
		
		return null;
	}

	public AttractionDTO getAttraction(String seq) {

		try {
					
					String sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1)as img from tblAttraction a where attraction_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						AttractionDTO dto = new AttractionDTO();
							
						dto.setAttraction_seq(rs.getString("attraction_seq"));
						dto.setName(rs.getString("name"));
						dto.setCapacity(rs.getString("capacity"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setTime(rs.getString("time"));
						dto.setRestriction(rs.getString("restriction"));
						dto.setTheme_seq(rs.getString("theme_seq"));
						dto.setIs_test(rs.getString("is_test"));
						dto.setImg(rs.getString("img"));
						
//						pstat.close();
//						conn.close();
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.get");
					e.printStackTrace();
				}
		
		
		return null;
	}

	public ArrayList<AttractionImgDTO> attractionImgList(String seq) {

		try {
					
					String sql = "select * from tblAttractionImg where attraction_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					ArrayList<AttractionImgDTO> list = new ArrayList<AttractionImgDTO>();
					while (rs.next()) {
						
						AttractionImgDTO dto = new AttractionImgDTO();
						
						dto.setAttraction_img_seq(rs.getString("attraction_img_seq"));
						dto.setImg(rs.getString("img"));
						dto.setAttraction_seq(rs.getString("attraction_seq"));
						
						list.add(dto);
						
					}
					
//					pstat.close();
//					conn.close();
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.imgList");
					e.printStackTrace();
				}
		
		
		
		return null;
	}

	public AttractionCloseDTO getAttractionClose(String seq) {

		try {
					
					String sql = "select * from tblAttractionClose where attraction_seq = ? and TO_CHAR(sysdate,'YYYY-MM-DD') >= TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(sysdate,'YYYY-MM-DD') <= TO_CHAR(end_date,'YYYY-MM-DD')";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						AttractionCloseDTO dto = new AttractionCloseDTO();
						
						dto.setAttraction_close_seq(rs.getString("attraction_close_seq"));
						dto.setStart_date(rs.getString("start_date"));
						dto.setEnd_date(rs.getString("end_date"));
						dto.setAttraction_seq(rs.getString("attraction_seq"));
						
//						pstat.close();
//						conn.close();
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getAttractionClose");
					e.printStackTrace();
				}
		
		
		
		return null;
	}

	
	//위치, 테마, 해시태그 가져오기 임시로 작성(나중에 병합 후에 해당 담당자가 구현한 메서드에서 가져와야 함!
	
	public ArrayList<LocationDTO> locationList() {

		try {
					
					String sql = "select * from tblLocation";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<LocationDTO> list = new ArrayList<LocationDTO>();
					while (rs.next()) {
						
						LocationDTO dto = new LocationDTO();
						
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setInfo(rs.getString("info"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.locationList");
					e.printStackTrace();
				}
		
		return null;
	}

	public ArrayList<ThemeDTO> themeList() {

		try {
					
					String sql = "select * from tblTheme";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<ThemeDTO> list = new ArrayList<ThemeDTO>();
					while (rs.next()) {
						
						ThemeDTO dto = new ThemeDTO();
						
						dto.setTheme_seq(rs.getString("theme_seq"));
						dto.setName(rs.getString("name"));
						
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.themeList");
					e.printStackTrace();
				}
		
		
		
		return null;
	}

	public ArrayList<HashTagDTO> hashtagList() {

		try {
					
					String sql = "select * from tblHashtag";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<HashTagDTO> list = new ArrayList<HashTagDTO>();
					while (rs.next()) {
						
						HashTagDTO dto = new HashTagDTO();

						dto.setHashtag_seq(rs.getString("hashtag_seq"));
						dto.setName(rs.getString("name"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.hashtagList");
					e.printStackTrace();
				}
		
		
		return null;
	}

	public int delAttraction(String seq) {

		/* 어트랙션 삭제 */
		//1. 기존 어트랙션명 + (운영종료) 텍스트 추가
		changeAttractionName(seq);
		
		//2. 위치정보번호 > 0번으로 변경(위치 0: 운영종료)
		changeLocation(seq);
		
		//3. 테마번호 > 0번으로 변경(테마 0: 운영종료)
		changeTheme(seq);
		
		//4. 테스트채택 'n'으로 변경
		changeIsTest(seq);
		
		//5. 어트/해시 태그 삭제
		try {

			String sql = "delete from tblAttractionHashTag where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delAttraction");
			e.printStackTrace();
		}
		
		return 0;
	
	}

	public ArrayList<FestivalDTO> festivalList() {

		try {
					
					String sql = "select a.*, (select img from tblFestivalImg where festival_seq = a.festival_seq and rownum = 1)as img from tblFestival a";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<FestivalDTO> list = new ArrayList<FestivalDTO>();
					while (rs.next()) {
						
						FestivalDTO dto = new FestivalDTO();
						
						dto.setFestival_seq(rs.getString("festival_seq"));
						dto.setName(rs.getString("name"));
						dto.setTime(rs.getString("time"));
						dto.setInfo(rs.getString("info"));
						dto.setPeriod(rs.getString("period"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setImg(rs.getString("img"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.festivalList");
					e.printStackTrace();
				}
		
		
		return null;
	}

	//어트랙션 삭제 > 어트랙션 이름 변경
	private void changeAttractionName(String seq) {

		try {

			String sql = "update tblattraction set name = name || '(운영종료)' where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.changeAttractionName");
			e.printStackTrace();
		}
		
		
	}

	//어트랙션 삭제 > 위치정보 변경
	public void changeLocation(String seq) {

		try {

			String sql = "update tblAttraction set location_seq = 0 where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.changeLocation");
			e.printStackTrace();
		}
	}

	//어트랙션 삭제 > 테마정보 변경
	public void changeTheme(String seq) {

		try {

			String sql = "update tblAttraction set theme_seq = 0 where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.changeTheme");
			e.printStackTrace();
		}
		
	}

	//어트랙션 삭제 > 테스트 채택 변경 
	public void changeIsTest(String seq) {

		try {

			String sql = "update tblAttraction set is_test = 'N' where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.changeIsTest");
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
}
