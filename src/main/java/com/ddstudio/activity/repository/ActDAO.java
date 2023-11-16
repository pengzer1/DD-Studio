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
import com.ddstudio.activity.model.PhotoZoneDTO;
import com.ddstudio.activity.model.PhotoZoneImgDTO;
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

	public int delAttraction(String seq) {

		/* 어트랙션 삭제 */
		//1. 기존 어트랙션명 + (운영종료) 텍스트 추가
		changeAttractionName(seq);
		
		//2. 위치정보번호 > 0번으로 변경(위치 0: 운영종료)
		changeLocation(seq);
		
		//3. 테마번호 > 0번으로 변경(테마 0: 운영종료)
		//changeTheme(seq);
		
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

	public ArrayList<FestivalDTO> festivalList(String status) {

		try {
					
					String sql = "";
					
					//view에 start_date, end_date to_char 처리 해놓음!
					if (status.equalsIgnoreCase("")) {
						sql = "select * from vwFestival where name not like '%(공연중단)%' and to_char(sysdate, 'yyyy-mm-dd') <= end_date order by festival_seq ";
					} else if (status.equalsIgnoreCase("ing")) {
						sql = "select * from vwFestival where name not like '%(공연중단)%' and to_char(sysdate, 'yyyy-mm-dd') between start_date and end_date order by festival_seq";
					} else if (status.equalsIgnoreCase("will")) {
						sql = "select * from vwFestival where name not like '%(공연중단)%' and to_char(sysdate, 'yyyy-mm-dd') < start_date order by festival_seq";
					}
					
			
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
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
					
//					String sql = "select a.*, (select img from tblFestivalImg where festival_seq = a.festival_seq and rownum = 1)as img from tblFestival a where festival_seq = ?";
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
         String sql = "delete from tblAttractionClose where attraction_close_seq=?"   ;

         pstat = conn.prepareStatement(sql);
         pstat.setString(1, dto.getAttraction_close_seq());

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

	public int addAttraction(AttractionDTO dto) {

		try {

			String sql = "INSERT INTO tblAttraction (attraction_seq, name, capacity, location_seq, time, restriction, is_test)\r\n"
					+ "VALUES (seqtblAttraction.NEXTVAL, ?, ?, ?, '10:00 - 22:00', ?, ?);";

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

	public int addAttractionImg(ArrayList<String> fileList, String attraction_seq) {

		int result = 0;
		
		for (String name : fileList) {
			
			
			try {

				String sql = "insert into tblAttractionImg (attraction_img_seq, img, attraction_seq) values (seqtblattractionimg.nextVal, ?, ?)";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, name);
				pstat.setString(2, attraction_seq);

				result += pstat.executeUpdate();

			} catch (Exception e) {
				System.out.println("at ActDAO.addAttractionImg");
				e.printStackTrace();
			}
			
		}
		
		
		return result;
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

	public int addAttractionHashtag(ArrayList<AttractionHashtagDTO> list) {

		int result = 0;
		
		for (AttractionHashtagDTO dto : list) {
			
			try {
				
				String sql = "INSERT INTO tblAttractionHashtag (attraction_hashtag_seq, attraction_seq, hashtag_seq)\r\n"
						+ "VALUES (seqtblAttractionHashtag.NEXTVAL, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getAttraction_seq());
				pstat.setString(2, dto.getHashtag_seq());
				
				result += pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.addAttractionHashtag");
				e.printStackTrace();
			}
			
		}
		
		return result;
	}

	public ArrayList<AttractionHashtagDTO> getHashtagSeq(ArrayList<String> taglist, String attraction_seq) {

		
		for (String tag : taglist) {
			
			try {
						
						String sql = "select a.attraction_seq, a.hashtag_seq, (select name from tblHashtag where hashtag_seq = a.hashtag_seq)as hashtag_name from tblAttractionHashtag a where (select name from tblHashtag where hashtag_seq = a.hashtag_seq) = ?";
						
						pstat = conn.prepareStatement(sql);
						pstat.setString(1, tag);
						
						rs = pstat.executeQuery();
						
						ArrayList<AttractionHashtagDTO> list = new ArrayList<AttractionHashtagDTO>();
						while (rs.next()) {
							
							AttractionHashtagDTO dto = new AttractionHashtagDTO();
							
							dto.setAttraction_seq(rs.getString("attraction_seq"));
							dto.setHashtag_seq(rs.getString("hashtag_seq"));
							dto.setHashtag_name(rs.getString("hashtag_name"));
							
							list.add(dto);
							
						}
						
						return list;
						
					} catch (Exception e) {
						System.out.println("at ActDAO.getHashtagSeq");
						e.printStackTrace();
					}
			
			
			
		}
		
		return null;
	}

      } catch (Exception e) {
         e.printStackTrace();
      }
      return 0;
   }
	
}
