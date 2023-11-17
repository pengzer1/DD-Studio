package com.ddstudio.activity.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.Attraction;
import com.ddstudio.activity.model.AttractionCloseDTO;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.model.AttractionHashtagDTO;
import com.ddstudio.activity.model.AttractionImgDTO;
import com.ddstudio.activity.model.FestivalDTO;
import com.ddstudio.activity.model.FestivalHashtagDTO;
import com.ddstudio.activity.model.FestivalImgDTO;
import com.ddstudio.activity.model.LocationDTO;
import com.ddstudio.activity.model.MovieDTO;
import com.ddstudio.activity.model.PhotoZoneDTO;
import com.ddstudio.activity.model.PhotoZoneImgDTO;
import com.ddstudio.activity.model.TheaterDTO;
import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.shop.model.RestaurantDTO;


public class ActDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ActDAO() {
		this.conn = DBUtil.open();
	}
	
	//목록보기용(운영종료 어트랙션 제외) + 조건 포함
	public ArrayList<AttractionDTO> attractionList(String close) {

		try {
					String sql = "";
					
					
					if (close.equals("")) {
					sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1) as img from tblAttraction a where name not like '%(운영종료)%' order by a.attraction_seq";
					
					} else if (close.equalsIgnoreCase("open")) {
					
					sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1) as img from tblAttraction a where name not like '%(운영종료)%' and attraction_seq not in (select attraction_seq from tblAttractionClose  where TO_CHAR(sysdate,'YYYY-MM-DD') between TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(end_date,'YYYY-MM-DD')) order by a.attraction_seq";
					
					} else if (close.equalsIgnoreCase("close")) {
						sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1) as img from tblAttraction a where name not like '%(운영종료)%' and attraction_seq in (select attraction_seq from tblAttractionClose where TO_CHAR(sysdate,'YYYY-MM-DD') between TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(end_date,'YYYY-MM-DD')) order by a.attraction_seq";
						
					}
					
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
						//dto.setTheme_seq(rs.getString("theme_seq"));
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

	//운영종료된 어트랙션까지 seq 입력하면 해당 정보 가져오기
	public AttractionDTO getAttraction(String seq) {

		try {
					
					String sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1) as img from tblAttraction a where attraction_seq = ?";
					
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
						//dto.setTheme_seq(rs.getString("theme_seq"));
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
	
	//이건잠시보류 로케이션 형태 바꿔서
//	public ArrayList<LocationDTO> locationList() {
//
//		try {
//					
//					String sql = "select * from tblLocation";
//					
//					stat = conn.createStatement();
//					rs = stat.executeQuery(sql);
//					
//					ArrayList<LocationDTO> list = new ArrayList<LocationDTO>();
//					while (rs.next()) {
//						
//						LocationDTO dto = new LocationDTO();
//						
//						dto.setLocation_seq(rs.getString("location_seq"));
//						dto.setInfo(rs.getString("info"));
//						
//						list.add(dto);
//						
//					}
//					
//					return list;
//					
//				} catch (Exception e) {
//					System.out.println("at ActDAO.locationList");
//					e.printStackTrace();
//				}
//		
//		return null;
//	}

//	public ArrayList<ThemeDTO> themeList() {
//
//		try {
//					
//					String sql = "select * from tblTheme";
//					
//					stat = conn.createStatement();
//					rs = stat.executeQuery(sql);
//					
//					ArrayList<ThemeDTO> list = new ArrayList<ThemeDTO>();
//					while (rs.next()) {
//						
//						ThemeDTO dto = new ThemeDTO();
//						
//						dto.setTheme_seq(rs.getString("theme_seq"));
//						dto.setName(rs.getString("name"));
//						
//						
//						list.add(dto);
//						
//					}
//					
//					return list;
//					
//				} catch (Exception e) {
//					System.out.println("at ActDAO.themeList");
//					e.printStackTrace();
//				}
//		
//		
//		
//		return null;
//	}

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

	public ArrayList<FestivalDTO> festivalList(String date) {

		try {
					
					String sql = "";
					
					//view에 start_date, end_date to_char 처리 해놓음!
					if (date.equalsIgnoreCase("")) {
						sql = "select * from vwFestival where name not like '%(공연중단)%' and to_char(sysdate, 'yyyy-mm-dd') <= end_date order by festival_seq ";
					} else {
						sql = "select * from vwFestival where name not like '%(공연중단)%' and ? between start_date and end_date order by festival_seq";
					}
					
					if (date.equalsIgnoreCase("") ) {
						
						stat = conn.createStatement();
						rs = stat.executeQuery(sql);
					} else {
						
						pstat = conn.prepareStatement(sql);
						pstat.setString(1, date);
						
						rs = pstat.executeQuery();
					}
					
					ArrayList<FestivalDTO> list = new ArrayList<FestivalDTO>();
					while (rs.next()) {
						
						FestivalDTO dto = new FestivalDTO();
						
						dto.setFestival_seq(rs.getString("festival_seq"));
						dto.setName(rs.getString("name"));
						dto.setTime(rs.getString("time"));
						dto.setInfo(rs.getString("info"));
						dto.setStart_date(rs.getString("start_date"));
						dto.setEnd_date(rs.getString("end_date"));
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
	public void changeAttractionLocation(String seq) {

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
//	public void changeTheme(String seq) {
//
//		try {
//
//			String sql = "update tblAttraction set theme_seq = 0 where attraction_seq = ?";
//
//			pstat = conn.prepareStatement(sql);
//			pstat.setString(1, seq);
//
//			pstat.executeUpdate();
//
//		} catch (Exception e) {
//			System.out.println("at ActDAO.changeTheme");
//			e.printStackTrace();
//		}
//		
//	}

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

	public ArrayList<AttractionHashtagDTO> attractionHashtagList(String seq) {

		try {
					
					String sql = "select a.*,(select name from tblHashtag where hashtag_seq = a.hashtag_seq)as hashtag_name from tblattractionhashtag a where attraction_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					ArrayList<AttractionHashtagDTO> list = new ArrayList<AttractionHashtagDTO>();
					while (rs.next()) {
						
						AttractionHashtagDTO dto = new AttractionHashtagDTO();
						
						dto.setAttraction_hashtag_seq(rs.getString("attraction_hashtag_seq"));
						dto.setAttraction_seq(rs.getString("attraction_seq"));
						dto.setHashtag_seq(rs.getString("hashtag_seq"));
						dto.setHashtag_name(rs.getString("hashtag_name"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.hashtagList");
					e.printStackTrace();
				}
		
		
		return null;
	}

	public LocationDTO getAttractionLocation(String seq) {

		try {
					
					String sql = "SELECT * \r\n"
							+ "  FROM tblAttraction a\r\n"
							+ " INNER JOIN tblLocation l\r\n"
							+ "    ON l.location_seq = a.location_seq where attraction_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						LocationDTO dto = new LocationDTO();
						
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setLat(rs.getString("lat"));
						dto.setLng(rs.getString("lng"));
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getLocation");
					e.printStackTrace();
				}
		
		return null;
	}

	public ArrayList<PhotoZoneDTO> photozoneList() {

		try {
					
					String sql = "select a.*, (select img from tblPhotozoneImg where photozone_seq = a.photozone_seq and rownum = 1)as img from tblPhotozone a";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<PhotoZoneDTO> list = new ArrayList<PhotoZoneDTO>();
					while (rs.next()) {
						
						PhotoZoneDTO dto = new PhotoZoneDTO();
						
						dto.setPhotozone_seq(rs.getString("photozone_seq"));
						dto.setName(rs.getString("name"));
						dto.setTime(rs.getString("time"));
						dto.setInfo(rs.getString("info"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setImg(rs.getString("img"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.photozoneList");
					e.printStackTrace();
				}
		
		return null;
	}

	public LocationDTO getFestivalLocation(String seq) {

		try {
					
					String sql = "SELECT *\r\n"
							+ "  FROM tblFestival a\r\n"
							+ " INNER JOIN tblLocation l\r\n"
							+ "    ON l.location_seq = a.location_seq where festival_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						LocationDTO dto = new LocationDTO();
						
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setLat(rs.getString("lat"));
						dto.setLng(rs.getString("lng"));
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getFestivalLocation");
					e.printStackTrace();
				}
		
		
		
		
		return null;
	}

	public FestivalDTO getFestival(String seq) {

		try {
					
					String sql = "select * from vwFestival where festival_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						FestivalDTO dto = new FestivalDTO();
						
						dto.setFestival_seq(rs.getString("festival_seq"));
						dto.setName(rs.getString("name"));
						dto.setTime(rs.getString("time"));
						dto.setInfo(rs.getString("info"));
						dto.setStart_date(rs.getString("start_date"));
						dto.setEnd_date(rs.getString("end_date"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setImg(rs.getString("img"));
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getFestival");
					e.printStackTrace();
				}
		
		
		return null;
	}

	public ArrayList<FestivalHashtagDTO> festivalHashtagList(String seq) {

		try {
					
					String sql = "select a.*,(select name from tblHashtag where hashtag_seq = a.hashtag_seq)as hashtag_name from tblFestivalHashtag a where festival_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					ArrayList<FestivalHashtagDTO> list = new ArrayList<FestivalHashtagDTO>();
					while (rs.next()) {
						
						FestivalHashtagDTO dto = new FestivalHashtagDTO();
						
						dto.setFestival_hashtag_seq(rs.getString("festival_hashtag_seq"));
						dto.setFestival_seq(rs.getString("festival_seq"));
						dto.setHashtag_seq(rs.getString("hashtag_seq"));
						dto.setHashtag_name(rs.getString("hashtag_name"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.festivalHashtagList");
					e.printStackTrace();
				}
		
		
		return null;
	}

	public ArrayList<FestivalImgDTO> festivalImgList(String seq) {

		try {
					
					String sql = "select * from tblFestivalImg where festival_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					ArrayList<FestivalImgDTO> list = new ArrayList<FestivalImgDTO>();
					while (rs.next()) {
						
						FestivalImgDTO dto = new FestivalImgDTO();
						
						dto.setFestival_img_seq(rs.getString("festival_img_seq"));
						dto.setImg(rs.getString("img"));
						dto.setFestival_seq(rs.getString("festival_seq"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.festivalImgList");
					e.printStackTrace();
				}
		
		
		return null;
	}

	public HashMap<String, String> checkReservation(String seq, String time) {

		try {
					
					String sql = "SELECT *\r\n"
							+ "  FROM vwCheckBookable\r\n"
							+ "WHERE regdate = TO_CHAR(sysdate,'YYYY-MM-DD')\r\n"
							+ "  AND attraction_book_seq = ?\r\n"
							+ "  AND attraction_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, time);
					pstat.setString(2, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						HashMap<String, String> map = new HashMap<String, String>();
						
						map.put("bookable", rs.getString("bookable"));
						map.put("seq", seq);
						map.put(time, time);
						
						return map;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.checkReservation");
					e.printStackTrace();
				}
		
		
		
		return null;
	}

	public int reserveAttraction(String seq, String time, String capacity, String user_seq) {

		try {

			String sql = "INSERT INTO tblBookUser (book_user_seq, regdate, capacity, attraction_book_seq, user_seq, attraction_seq)\r\n"
					+ "VALUES (seqtblBookUser.NEXTVAL, DEFAULT, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, capacity);
			pstat.setString(2, time);
			pstat.setString(3, user_seq);
			pstat.setString(4, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.reserveAttraction");
			e.printStackTrace();
		}
		
		return 0;
	}


	public int attcloseadd(AttractionCloseDTO dto) {
        try {
           String sql = "insert into tblattractionclose(attraction_close_seq, start_date, end_date, attraction_seq) values (seqtblAttractionClose.nextVal, ?, ?, ?)";

           pstat = conn.prepareStatement(sql);
           pstat.setString(1, dto.getStart_date());
           pstat.setString(2, dto.getEnd_date());
           pstat.setString(3, dto.getAttraction_seq());

           return pstat.executeUpdate();

        } catch (Exception e) {
           e.printStackTrace();
        }
        return 0;
     }

	public int attcloseedit(AttractionCloseDTO dto) {
		try {
			String sql = "update tblattractionclose set start_date=?, end_date=? where attraction_close_seq=?";
        
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getStart_date());
			pstat.setString(2, dto.getEnd_date());
			pstat.setString(3, dto.getAttraction_close_seq());
        
			return pstat.executeUpdate();
        
		} catch (Exception e) {
			e.printStackTrace();
		}
     
		return 0;
	}

	public ArrayList<AttractionCloseDTO> closeattractionList() {  //운휴정보를 가진 어트랙션 목록들(name 포함해서)만 보여주기
		try {
        
			String sql = "select b.attraction_close_seq, a.attraction_seq, a.name, b.start_date, b.end_date from tblAttraction a\r\n"
					+ "inner join tblAttractionClose b\r\n"
					+ "on a.attraction_seq = b.attraction_seq\r\n"
					+ "where TO_CHAR(sysdate,'YYYY-MM-DD') <=TO_CHAR(end_date,'YYYY-MM-DD')";
        
        stat = conn.createStatement();
        rs = stat.executeQuery(sql);
        
        ArrayList<AttractionCloseDTO> list = new ArrayList<AttractionCloseDTO>();
        while (rs.next()) {
           
           AttractionCloseDTO dto = new AttractionCloseDTO();
           dto.setAttraction_close_seq(rs.getString("attraction_close_seq"));
           dto.setStart_date(rs.getString("start_date"));
           dto.setEnd_date(rs.getString("end_date"));
           dto.setAttraction_seq(rs.getString("attraction_seq"));
           dto.setName(rs.getString("name"));
           
           list.add(dto);
        }
        
        return list;
        
     } catch (Exception e) {
        System.out.println("at ActDAO.list");
        e.printStackTrace();
     }

     return null;
  }

	public int del(AttractionCloseDTO dto) {
		try {
			String sql = "delete from tblAttractionClose where attraction_close_seq=?";

         pstat = conn.prepareStatement(sql);
         pstat.setString(1, dto.getAttraction_close_seq());
      } catch (Exception e) {
			System.out.println("at ActDAO.del");
			e.printStackTrace();
		}
return 0;
}
	public ArrayList<PhotoZoneImgDTO> photozoneImgList(String seq) {

		try {
					
					String sql = "select * from tblPhotozoneImg where photozone_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					ArrayList<PhotoZoneImgDTO> list = new ArrayList<PhotoZoneImgDTO>();
					while (rs.next()) {
						
						PhotoZoneImgDTO dto = new PhotoZoneImgDTO();
						
						dto.setPhotozone_img_seq("photozone_img_seq");
						dto.setImg("img");
						dto.setPhotozone_seq("photozone_seq");
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.photozoneImgList");
					e.printStackTrace();
				}
		
		
		return null;
	}

	public PhotoZoneDTO getPhotozone(String seq) {

		try {
					
					String sql = "select a.*, (select img from tblPhotozoneImg where photozone_seq = a.photozone_seq and rownum = 1)as img from tblPhotozone a where photozone_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						PhotoZoneDTO dto = new PhotoZoneDTO();
						
						dto.setPhotozone_seq(rs.getString("photozone_seq"));
						dto.setName(rs.getString("name"));
						dto.setTime(rs.getString("time"));
						dto.setInfo(rs.getString("info"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setImg(rs.getString("img"));
						dto.setLat(rs.getString("lat"));
						dto.setLng(rs.getString("lng"));
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getPhotozone");
					e.printStackTrace();
				}
		
		
		
		return null;
	}

	public LocationDTO getPhotozoneLocation(String seq) {

		try {
					
					String sql = "SELECT *\r\n"
							+ "  FROM tblPhotozone a\r\n"
							+ " INNER JOIN tblLocation b\r\n"
							+ "    ON b.location_seq = a.location_seq where photozone_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						LocationDTO dto = new LocationDTO();
						
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setLat(rs.getString("lat"));
						dto.setLng(rs.getString("lng"));
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getPhotozoneLocation");
					e.printStackTrace();
				}
		
		
		
		return null;
	}

	public ArrayList<HashTagDTO> getHashtagList() {

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
					System.out.println("at ActDAO.getHashtagList");
					e.printStackTrace();
				}
		
		
		return null;
	}

	//액티비티 추가용 method overloading
	//- addLocation(dto)
	public int addLocation(AttractionDTO dto) {
		
		try {

			String sql = "insert into tbllocation (location_seq, lat, lng) select seqtblLocation.nextVal, ?, ? from dual where not exists (select 1 from tbllocation where lat = ? and lng = ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());
			pstat.setString(3, dto.getLat());
			pstat.setString(4, dto.getLng());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ActDAO.addLocation()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int addLocation(FestivalDTO dto) {
		
		try {
			
			String sql = "insert into tbllocation (location_seq, lat, lng) select seqtblLocation.nextVal, ?, ? from dual where not exists (select 1 from tbllocation where lat = ? and lng = ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());
			pstat.setString(3, dto.getLat());
			pstat.setString(4, dto.getLng());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ActDAO.addLocation()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int addLocation(TheaterDTO dto) {
		
		try {
			
			String sql = "insert into tbllocation (location_seq, lat, lng) select seqtblLocation.nextVal, ?, ? from dual where not exists (select 1 from tbllocation where lat = ? and lng = ?)";
			
			/*
			 * pstat = conn.prepareStatement(sql); pstat.setString(1, dto.getLat());
			 * pstat.setString(2, dto.getLng()); pstat.setString(3, dto.getLat());
			 * pstat.setString(4, dto.getLng());
			 */
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ActDAO.addLocation()");
			e.printStackTrace();
		}
		
		return 0;
	}
	public int addLocation(PhotoZoneDTO dto) {
		
		try {
			
			String sql = "insert into tbllocation (location_seq, lat, lng) select seqtblLocation.nextVal, ?, ? from dual where not exists (select 1 from tbllocation where lat = ? and lng = ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());
			pstat.setString(3, dto.getLat());
			pstat.setString(4, dto.getLng());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("ActDAO.addLocation()");
			e.printStackTrace();
		}
		
		return 0;
	}

	//getLocationSeq(dto)
	public String getLocationSeq(AttractionDTO dto) {

		try {

			String sql = "select location_seq from tbllocation where lat = ? and lng = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getString("location_seq");
			}

		} catch (Exception e) {
			System.out.println("ActDAO.getLocationSeq()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String getLocationSeq(FestivalDTO dto) {
		
		try {

			String sql = "select location_seq from tbllocation where lat = ? and lng = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getString("location_seq");
			}

		} catch (Exception e) {
			System.out.println("ActDAO.getLocationSeq()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String getLocationSeq(TheaterDTO dto) {
		
		try {
			
			String sql = "select location_seq from tbllocation where lat = ? and lng = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("location_seq");
			}
			
		} catch (Exception e) {
			System.out.println("ActDAO.getLocationSeq()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String getLocationSeq(PhotoZoneDTO dto) {
		
		try {
			
			String sql = "select location_seq from tbllocation where lat = ? and lng = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("location_seq");
			}
			
		} catch (Exception e) {
			System.out.println("ActDAO.getLocationSeq()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int addAttraction(AttractionDTO dto) {
	
		try {
	
			String sql = "INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test) VALUES (seqtblAttraction.NEXTVAL, ?, ?, ?, '10:00 - 22:00', ?, ?)";
	
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getCapacity());
			pstat.setString(3, dto.getLocation_seq());
			pstat.setString(4, dto.getRestriction());
			pstat.setString(5, dto.getIs_test());
			
	
			return pstat.executeUpdate();
	
		} catch (Exception e) {
			System.out.println("at ActDAO.addAttraction");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int addFestival(FestivalDTO dto) {

		try {

			String sql = "INSERT INTO tblFestival (festival_seq, name, time, info, start_date, end_date, location_seq) VALUES (seqtblFestival.NEXTVAL, ?, ?, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getTime());
			pstat.setString(3, dto.getInfo());
			pstat.setString(4, dto.getStart_date());
			pstat.setString(5, dto.getEnd_date());
			pstat.setString(6, dto.getLocation_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.addFestival");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getAttractionSeq() {
	
		try {
					
			String sql = "select max(attraction_seq) as attraction_seq from tblAttraction";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				return rs.getString("attraction_seq");
			}
			
		} catch (Exception e) {
			System.out.println("at ActDAO.getAttractionSeq");
			e.printStackTrace();
		}
		
		return null;
	}

	public String getFestivalSeq() {

		try {
					
					String sql = "select max(festival_seq) as festival_seq from tblFestival";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					if (rs.next()) {
						return rs.getString("festival_seq");
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getFestivalSeq");
					e.printStackTrace();
				}
		return null;
	}

	public int addAttractionImg(ArrayList<String> fileList, String attraction_seq) {
	
		//ArrayList를 탐색하며 null개수 count > null이 3개면 > default 로 insert
		//이미지가 1개라도 추가되었다면, 기존 insert문 > 나머지는 null처리로 DB 추가 불가
		int flag = 0;
		int result = 0;
		String sql = "";
		
		for (String name : fileList) {
			if (name == null) {
				flag++;
			}
		}
		
		if (flag == 3) { //이미지 추가X > default 입력
			
			try {
				
				sql = "insert into tblAttractionImg (attraction_img_seq, img, attraction_seq) values (seqtblattractionimg.nextVal, DEFAULT, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, attraction_seq);
				
				result += pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.addFestivalImg");
				e.printStackTrace();
			}
			
			
		} else { //이미지 1개 이상 추가 > 기존 insert문 사용(null값은 DB 에러발생으로 처리 안됨!)
			
			for (String name : fileList) {
				
				try {
					
					sql = "insert into tblAttractionImg (attraction_img_seq, img, attraction_seq) values (seqtblattractionimg.nextVal, ?, ?)";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, name);
					pstat.setString(2, attraction_seq);
					
					result += pstat.executeUpdate();
					
				} catch (Exception e) {
					System.out.println("at ActDAO.addAttractionImg");
					e.printStackTrace();
				}
				
			}
			
		}
		
		return result;
	}

	public int addFestivalImg(ArrayList<String> fileList, String festival_seq) {

		//ArrayList를 탐색하며 null개수 count > null이 3개면 > default 로 insert
		//이미지가 1개라도 추가되었다면, 기존 insert문 > 나머지는 null처리로 DB 추가 불가
		int flag = 0;
		int result = 0;
		String sql = "";
		
		for (String name : fileList) {
			if (name == null) {
				flag++;
			}
		}
		
		if (flag == 3) { //이미지 추가X > default 입력
			
			try {
				
				sql = "insert into tblFestivalImg (festival_img_seq, img, festival_seq) values (seqtblfestivalimg.nextVal, DEFAULT, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, festival_seq);
				
				result += pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.addFestivalImg");
				e.printStackTrace();
			}
			
			
		} else { //이미지 1개 이상 추가 > 기존 insert문 사용(null값은 DB 에러발생으로 처리 안됨!)
			
			for (String name : fileList) {
				
				try {
					
					sql = "insert into tblFestivalImg (festival_img_seq, img, festival_seq) values (seqtblfestivalimg.nextVal, ?, ?)";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, name);
					pstat.setString(2, festival_seq);
					
					result += pstat.executeUpdate();
					
				} catch (Exception e) {
					System.out.println("at ActDAO.addAttractionImg");
					e.printStackTrace();
				}
				
			}
			
		}
		
		
		return result;
	}

//	public ArrayList<AttractionHashtagDTO> getHashtagSeq(ArrayList<String> taglist) {
//	
//		ArrayList<AttractionHashtagDTO> list = new ArrayList<AttractionHashtagDTO>();
//		
//		for (String tag : taglist) {
//			
//			try {
//						
//						String sql = "select hashtag_seq from tblHashtag where name = ?";
//						
//						pstat = conn.prepareStatement(sql);
//						pstat.setString(1, tag);
//						
//						rs = pstat.executeQuery();
//						
//						
//						while (rs.next()) {
//							
//							AttractionHashtagDTO dto = new AttractionHashtagDTO();
//							
//							dto.setHashtag_seq(rs.getString("hashtag_seq"));
//							
//							list.add(dto);
//							
//						}
//						
//						
//					} catch (Exception e) {
//						System.out.println("at ActDAO.getHashtagSeq");
//						e.printStackTrace();
//						return null;
//					}
//			
//			
//			
//		}
//		return list;
//		
//	}

	public ArrayList<FestivalHashtagDTO> getHashtagSeq_festival(ArrayList<String> taglist) {
		
		ArrayList<FestivalHashtagDTO> list = new ArrayList<FestivalHashtagDTO>();
		
		for (String tag : taglist) {
			
			try {
				
				String sql = "select hashtag_seq from tblHashtag where name = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, tag);
				
				rs = pstat.executeQuery();
				
				
				while (rs.next()) {
					
					FestivalHashtagDTO dto = new FestivalHashtagDTO();
					
					dto.setHashtag_seq(rs.getString("hashtag_seq"));
					
					list.add(dto);
					
				}
				
				
			} catch (Exception e) {
				System.out.println("at ActDAO.getHashtagSeq");
				e.printStackTrace();
				return null;
			}
			
			
			
		}
		return list;
		
	}

	public int addAttractionHashtag(ArrayList<String> seqlist, String attraction_seq) {
	
		int result = 0;
		
		for (String tag : seqlist) {
			
			try {
				
				String sql = "INSERT INTO tblAttractionHashtag (attraction_hashtag_seq, attraction_seq, hashtag_seq)\r\n"
						+ "VALUES (seqtblAttractionHashtag.NEXTVAL, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, attraction_seq);
				pstat.setString(2, tag);
				
				result += pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.addAttractionHashtag");
				e.printStackTrace();
			}
			
		}
		
		return result;
	}

	public int addFestivalHashtag(ArrayList<String> seqlist, String festival_seq) {

		int result = 0;
		
		for (String tag : seqlist) {
			
			try {
				
				String sql = "INSERT INTO tblFestivalHashtag (festival_hashtag_seq, festival_seq, hashtag_seq)\r\n"
						+ "VALUES (seqtblAttractionHashtag.NEXTVAL, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, festival_seq);
				pstat.setString(2, tag);
				
				result += pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.addAttractionHashtag");
				e.printStackTrace();
			}
			
		}
		
		
		return result;
	}

	public int delFestival(String seq) {

		try {

			String sql = "update tblFestival set name = name || '(공연중단)', location_seq = 0 where festival_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delFestival");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int changeFestivalLocation(String seq) {

		try {

			String sql = "update tblFestival set location_seq = 0 where festival_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			FestivalDTO dto = new FestivalDTO();
			dto.setLat("0");
			dto.setLng("0");

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.changeFestivalLocation");
			e.printStackTrace();
		}
		
		
		
		return 0;
	}

	public int delFestivalImg(String seq) {

		
		try {

			String sql = "delete from tblFestivalImg where festival_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delFestivalImg");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int delFestivalHashtag(String seq) {

		try {

			String sql = "delete from tblFestivalHashtag where festival_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delFestivalHashtag");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public TheaterDTO getTheater(String seq) {

		try {
					
					String sql = "select * from tblTheater where theater_seq = ? ";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						TheaterDTO dto = new TheaterDTO();
						
						dto.setTheater_seq(rs.getString("theater_seq"));
						dto.setName(rs.getString("name"));
						dto.setLocation_seq(rs.getString("location_seq"));
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getTheater");
					e.printStackTrace();
				}
		
		return null;
	}

	public ArrayList<MovieDTO> movieList() {
	//오늘 날짜(sysdate)기준 상영하는 영화 가져오기
		try {
					
					String sql = "SELECT * FROM tblMovie WHERE TO_CHAR(sysdate, 'YYYY-MM-DD') between TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(end_date,'YYYY-MM-DD')) order by movie_seq";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();
					while (rs.next()) {
						
						MovieDTO dto = new MovieDTO();
						
						dto.setMovie_seq(rs.getString("movie_seq"));
						dto.setName(rs.getString("name"));
						dto.setStart_date(rs.getString("start_date"));
						dto.setEnd_date(rs.getString("end_date"));
						dto.setRunningtime(rs.getString("runningtime"));
						dto.setImg(rs.getString("img"));
						dto.setPreview(rs.getString("preview"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.movieList");
					e.printStackTrace();
				}
		
		return null;
	}

	public int addPhotozone(PhotoZoneDTO dto) {
		
		try {

			String sql = "INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq)\r\n"
					+ "VALUES (seqtblPhotoZone.NEXTVAL, ?, '10:00 - 22:00', ?, ?);";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(3, dto.getInfo());
			pstat.setString(6, dto.getLocation_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.addPhotozone");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getPhotozoneSeq() {

		try {
			
			String sql = "select max(photozone_seq) as photozone_seq from tblPhotozone";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("photozone_seq");
			}
			
		} catch (Exception e) {
			System.out.println("at ActDAO.getPhotozoneSeq");
			e.printStackTrace();
		}
		return null;
	}

	public int addPhotozoneImg(ArrayList<String> fileList, String photozone_seq) {

		//ArrayList를 탐색하며 null개수 count > null이 3개면 > default 로 insert
		//이미지가 1개라도 추가되었다면, 기존 insert문 > 나머지는 null처리로 DB 추가 불가
		int flag = 0;
		int result = 0;
		String sql = "";
		
		for (String name : fileList) {
			if (name == null) {
				flag++;
			}
		}
		
		if (flag == 3) { //이미지 추가X > default 입력
			
			try {
				
				sql = "insert into tblPhotozoneImg (photozone_img_seq, img, photozone_seq) values (seqtblphotozoneimg.nextVal, DEFAULT, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, photozone_seq);
				
				result += pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.addPhotozoneImg");
				e.printStackTrace();
			}
			
			
		} else { //이미지 1개 이상 추가 > 기존 insert문 사용(null값은 DB 에러발생으로 처리 안됨!)
			
			for (String name : fileList) {
				
				try {
					
					sql = "insert into tblPhotozoneImg (photozone_img_seq, img, photozone_seq) values (seqtblphotozoneimg.nextVal, ?, ?)";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, name);
					pstat.setString(2, photozone_seq);
					
					result += pstat.executeUpdate();
					
				} catch (Exception e) {
					System.out.println("at ActDAO.addPhotozoneImg");
					e.printStackTrace();
				}
				
			}
			
		}
		
		return result;
	}

	public int editAttraction(AttractionDTO dto) {

		try {

			String sql = "update tblAttraction set name = ?, capacity = ?, restriction = ?, is_test = ? where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getCapacity());
			pstat.setString(3, dto.getRestriction());
			pstat.setString(4, dto.getIs_test());
			pstat.setString(5, dto.getAttraction_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.editAttraction");
			e.printStackTrace();
		}
		
		
		
		return 0;
	}

	//String lat, String lng 입력받아 tblLocation에 추가하기(성공: 1, 실패: 0)
	public int addLocation(String lat, String lng) {

		try {

			String sql = "insert into tbllocation (location_seq, lat, lng) select seqtblLocation.nextVal, ?, ? from dual where not exists (select 1 from tbllocation where lat = ? and lng = ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, lat);
			pstat.setString(2, lng);
			pstat.setString(3, lat);
			pstat.setString(4, lng);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.addLocation");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	//String lat, String lng 입력받아 location_seq 얻기
	public String getLocationSeq(String lat, String lng) {

		try {

			String sql = "select location_seq from tbllocation where lat = ? and lng = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, lat);
			pstat.setString(2, lng);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getString("location_seq");
			}

		} catch (Exception e) {
			System.out.println("ActDAO.getLocationSeq()");
			e.printStackTrace();
		}
		
		return null;
	}	
	
	//ArrayList<String> 태그 list로 Hashtag 테이블의 seq 얻기
	public ArrayList<String> getHashtagSeq(ArrayList<String> taglist) {
		
		ArrayList<String> list = new ArrayList<String>();
		
		for (String tag : taglist) {
			
			try {
						
				String sql = "select hashtag_seq from tblHashtag where name = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, tag);
				
				rs = pstat.executeQuery();
				
				while (rs.next()) {
					
					list.add(rs.getString("hashtag_seq"));
				}
				
				
			} catch (Exception e) {
				System.out.println("at ActDAO.getHashtagSeq");
				e.printStackTrace();
				return null;
			}
			
		}
		return list;
	}

	
	//seq로 조회하여 해당 어트랙션의 해시태그 개수 찾기
	public int countAttractionHashtag(String seq) {
		
		try {

			String sql = "select * from tblAttractionHashtag where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.countAttractionHashtag");
			e.printStackTrace();
		}
		
		return 0;
	}

	//seq로 조회하여 해당 어트랙션 해시태그 제거하기
	public int delAttractionHashtag(String seq) {

		try {

			String sql = "delete from tblAttractionHashtag where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delAttractionHashtag");
			e.printStackTrace();
		}
		
		return 0;
	}

	//location_dto 안의 seq와 일치하는 레코드의 lat, lng 수정하기
	public int updateLocation(LocationDTO location_dto) {
		
		try {

			String sql = "update tblLocation set lat = ?, lng = ? where location_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, location_dto.getLat());
			pstat.setString(2, location_dto.getLng());
			pstat.setString(3, location_dto.getLocation_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.updateLocation");
			e.printStackTrace();
		}
		
		return 0;
	}

	//Attraction_seq 입력받아 어트랙션 이미지 삭제하기
	public int delAttractionImg(String seq) {

		try {

			String sql = "delete from tblAttractionImg where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delAttractionImg");
			e.printStackTrace();
		}
		
		return 0;
	}

	//seq 입력받아 어트랙션 삭제 > 위치, 테스트여부, 이름 변경
	public int delAttraction(String seq) {

		try {

			String sql = "update tblAttraction set location_seq = 0, is_test = 'N', name = name || '(운영종료)' where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delAttraction");
			e.printStackTrace();
		}
		
		return 0;
	}

	//seq 입력받아 존재하는 어트랙션 이미지 개수 확인
	public int countAttractionImg(String seq) {

		try {

			String sql = "select * from tblAttractionImg where attraction_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.countAttractionImg");
			e.printStackTrace();
		}
		
		return 0;
	}

	//dto 받아서 페스티벌 수정
	public int editFestival(FestivalDTO dto) {
		
		try {

			String sql = "update tblFestival set name = ?, time = ?, info = ?, start_date = ?, end_date = ? where festival_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getTime());
			pstat.setString(3, dto.getInfo());
			pstat.setString(4, dto.getStart_date());
			pstat.setString(5, dto.getEnd_date());
			pstat.setString(6, dto.getFestival_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.editFestival");
			e.printStackTrace();
		}
		
		return 0;
	}

	//seq로 조회하여 해당 페스티벌의 해시태그 개수 찾기
	public int countFestivalHashtag(String seq) {

		try {

			String sql = "select * from tblFestivalHashtag where festival_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.countAttractionHashtag");
			e.printStackTrace();
		}
		
		return 0;
	}

	//seq 입력받아 존재하는 페스티벌 이미지 개수 확인
	public int countFestivalImg(String seq) {

		try {

			String sql = "select * from tblFestivalImg where festival_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.countAttractionImg");
			e.printStackTrace();
		}
		return 0;
	}

	public int editPhotozone(PhotoZoneDTO dto) {

		try {

			String sql = "update tblPhotozone set name = ?, info = ? where photozone_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getInfo());
			pstat.setString(3, dto.getPhotozone_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.editPhotozone");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int countPhotozoneImg(String seq) {

		try {

			String sql = "select * from tblPhotozoneImg where photozone_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.countPhotozoneImg");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delPhotozoneImg(String seq) {

		try {
		
			String sql = "delete from tblPhotozoneImg where photozone_seq = ?";
	
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
	
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delPhotozoneImg");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delPhotozone(String seq) {

		try {

			String sql = "update tblPhotozone set name = name || '(운영중단)', location_seq = 0 where photozone_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delPhotozone");
			e.printStackTrace();
		}
		
		return 0;
	}



		
}
