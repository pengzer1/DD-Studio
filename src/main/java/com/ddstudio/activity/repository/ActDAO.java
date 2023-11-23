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
import com.ddstudio.activity.model.MovieHashtagDTO;
import com.ddstudio.activity.model.PhotoZoneDTO;
import com.ddstudio.activity.model.PhotoZoneImgDTO;
import com.ddstudio.activity.model.TheaterDTO;
import com.ddstudio.admin.model.HashTagDTO;
import com.ddstudio.shop.model.RestaurantDTO;

/**
 * 액티비티 관련 데이터베이스 작업을 수행하는 클래스
 * 
 * @author 박나래
 *
 */
public class ActDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ActDAO() {
		this.conn = DBUtil.open();
	}
	
	/**
	 * 운영 종료 어트랙션을 제외한 어트랙션 목록을 조회하는 메서드
	 * 
	 * @param close 정상운영/운휴 조건이 담긴 변수
	 * @return 어트랙션 목록을 담은 ArrayList 객체
	 */
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

	/**
	 * 어트랙션 번호(seq)를 입력받아 해당하는 어트랙션을 조회하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 어트랙션 정보를 담은 AttractionDTO 객체
	 */
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

	/**
	 * 어트랙션 번호(seq)를 입력받아 해당하는 어트랙션의 이미지들을 조회하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 특정 어트랙션의 이미지 목록을 담은 ArrayList 객체
	 */
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

	/**
	 * 어트랙션 번호(seq)를 입력받아 해당하는 어트랙션의 당일(시스템 날짜 기준) 운휴 여부를 조회하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 특정 어트랙션의 당일(시스템 날짜 기준) 운휴 정보를 담은 AttractionCloseDTO 객체
	 */
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

	
	/**
	 * 공연 중단 페스티벌을 제외한 페스티벌 목록을 조회하는 메서드
	 * 
	 * @param date 특정 날짜 또는 당일(시스템 날짜 기준) 날짜가 담긴 변수
	 * @return 페스티벌 목록을 담은 ArrayList 객체
	 */
	public ArrayList<FestivalDTO> festivalList(String date) {

		try {
					
					String sql = "";
					
					//view에 start_date, end_date to_char 처리 해놓음!
					if (date.equalsIgnoreCase("")) {
						sql = "select * from vwFestival where name not like '%(공연중단)%' and to_char(sysdate, 'yyyy-mm-dd') between start_date and end_date order by festival_seq ";
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


	/**
	 * 어트랙션 번호(seq)를 입력받아 해당하는 어트랙션의 해시태그들을 조회하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 어트랙션 해시태그 목록을 담은 ArrayList 객체
	 */
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

	/**
	 * 어트랙션 번호(seq)를 입력받아 해당하는 어트랙션의 위치 정보를 조회하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 특정 어트랙션의 위치 정보를 담은 LocationDTO 객체
	 */
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

	/**
	 * 운영 종료 포토존을 제외한 포토존 목록을 조회하는 메서드
	 * 
	 * @return 포토존 목록을 담은 ArrayList 객체
	 */
	public ArrayList<PhotoZoneDTO> photozoneList() {

		try {
					
					String sql = "select a.*, (select img from tblPhotozoneImg where photozone_seq = a.photozone_seq and rownum = 1)as img from tblPhotozone a where name not like '%(운영종료)%'";
					
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

	/**
	 * 페스티벌 번호(seq)를 입력받아 해당하는 페스티벌의 위치 정보를 조회하는 메서드
	 * 
	 * @param seq 페스티벌 번호
	 * @return 특정 페스티벌의 위치 정보를 담은 LocationDTO 객체
	 */
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

	/**
	 * 페스티벌 번호(seq)를 입력받아 해당하는 페스티벌을 조회하는 메서드
	 * 
	 * @param seq 페스티벌 번호
	 * @return 페스티벌 정보를 담은 FestivalDTO 객체
	 */
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

	/**
	 * 페스티벌 번호(seq)를 입력받아 해당하는 페스티벌의 해시태그들을 조회하는 메서드
	 * 
	 * @param seq 페스티벌 번호
	 * @return 페스티벌 해시태그 목록을 담은 ArrayList 객체
	 */
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

	/**
	 * 페스티벌 번호(seq)를 입력받아 해당하는 페스티벌의 이미지들을 조회하는 메서드
	 * 
	 * @param seq 페스티벌 번호
	 * @return 특정 페스티벌의 이미지 목록을 담은 ArrayList 객체
	 */
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

	/**
	 * 당일 특정 어트랙션의 시간대별 예약 가능 인원을 조회하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @param time 예약 시간 번호
	 * @return
	 */
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

	/**
	 * 어트랙션을 예약하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @param time 예약할 시간
	 * @param capacity 예약 인원
	 * @param user_seq 유저 번호
	 * @return 데이터베이스에 추가된 행의 수
	 */
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


	/**
	 * 
	 * 
	 * @param dto
	 * @return
	 */
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

	/**
	 * 
	 * 
	 * @param dto
	 * @return
	 */
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

	/**
	 * 
	 * 
	 * @return
	 */
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

	/**
	 * 
	 * 
	 * @param dto
	 * @return
	 */
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
	/**
	 * 포토존 번호(seq)를 입력받아 해당하는 포토존의 이미지들을 조회하는 메서드
	 * 
	 * @param seq 포토존 번호
	 * @return 특정 포토존의 이미지 목록을 담은 ArrayList 객체
	 */
	public ArrayList<PhotoZoneImgDTO> photozoneImgList(String seq) {

		try {
					
					String sql = "select * from tblPhotozoneImg where photozone_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					ArrayList<PhotoZoneImgDTO> list = new ArrayList<PhotoZoneImgDTO>();
					
					while (rs.next()) {
						
						PhotoZoneImgDTO dto = new PhotoZoneImgDTO();
						
						dto.setPhotozone_img_seq(rs.getString("photozone_img_seq"));
						dto.setImg(rs.getString("img"));
						dto.setPhotozone_seq(rs.getString("photozone_seq"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.photozoneImgList");
					e.printStackTrace();
				}
		
		
		return null;
	}

	/**
	 * 포토존 번호(seq)를 입력받아 해당하는 포토존을 조회하는 메서드
	 * 
	 * @param seq 포토존 번호
	 * @return 포토존 정보를 담은 PhotoZoneDTO 객체
	 */
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

	/**
	 * 포토존의 위치 정보를 조회하는 메서드
	 * 
	 * @param seq 포토존 번호
	 * @return 위치 정보를 담은 LocationDTO 객체
	 */
	public LocationDTO getPhotozoneLocation(String seq) {

		try {
					
					String sql = "SELECT * FROM tblPhotozone a INNER JOIN tblLocation b ON b.location_seq = a.location_seq where photozone_seq = ?";
					
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

	/**
	 * 전체 해시태그 목록을 가져오는 메서드
	 * 
	 * @return 해시태그 목록을 담은 ArrayList 객체
	 */
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


	/**
	 * 어트랙션을 추가하는 메서드
	 * 
	 * @param dto 어트랙션의 정보를 담은 AttractionDTO 객체
	 * @return 데이터베이스에 추가된 행의 수
	 */
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

	/**
	 * 페스티벌을 추가하는 메서드
	 * 
	 * @param dto 페스티벌 정보를 담은 FestivalDTO 객체
	 * @return 데이터베이스에 추가된 행의 수
	 */
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

	/**
	 * 가장 최근에 추가한 어트랙션 테이블의 어트랙션 번호를 가져오는 메서드
	 * 
	 * @return 어트랙션 번호
	 */
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

	/**
	 * 가장 최근에 추가한 페스티벌 테이블의 페스티벌 번호를 가져오는 메서드
	 * 
	 * @return 페스티벌 번호
	 */
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

	/**
	 * 어트랙션 이미지를 추가하는 메서드
	 * 
	 * @param fileList 이미지 파일 이름의 목록을 담은 ArrayList 객체
	 * @param attraction_seq 어트랙션 번호
	 * @return 데이터베이스에 추가된 행의 수
	 */
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

	/**
	 * 페스티벌 이미지를 추가하는 메서드
	 * 
	 * @param fileList 이미지 파일 이름의 목록을 담은 ArrayList 객체
	 * @param festival_seq 페스티벌 번호
	 * @return 데이터베이스에 추가된 행의 수
	 */
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


	/**
	 * 어트랙션 해시태그를 추가하는 메서드
	 * 
	 * @param seqlist 추가할 해시태그의 번호들이 담긴 ArrayList 객체
	 * @param attraction_seq 어트랙션 번호
	 * @return 데이터베이스에 추가된 행의 수
	 */
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

	/**
	 * 페스티벌 해시태그를 추가하는 메서드
	 * 
	 * @param seqlist 추가할 해시태그의 번호들이 담긴 ArrayList 객체
	 * @param festival_seq 페스티벌 번호
	 * @return 데이터베이스에 추가된 행의 수
	 */
	public int addFestivalHashtag(ArrayList<String> seqlist, String festival_seq) {

		int result = 0;
		
		for (String tag : seqlist) {
			
			try {
				
				String sql = "INSERT INTO tblFestivalHashtag (festival_hashtag_seq, festival_seq, hashtag_seq)\r\n"
						+ "VALUES (seqtblFestivalHashtag.NEXTVAL, ?, ?)";
				
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

	/**
	 * 페스티벌을 삭제하는 메서드(업데이트 처리)
	 * 
	 * @param seq 페스티벌 번호
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
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


	/**
	 * 페스티벌 이미지를 삭제하는 메서드
	 * 
	 * @param seq 페스티벌 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
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

	/**
	 * 페스티벌 해시태그를 삭제하는 메서드
	 * 
	 * @param seq 페스티벌 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
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

	/**
	 * 영화관 번호(seq)를 입력받아 해당하는 영화관의 정보를 조회하는 메서드
	 * 
	 * @param seq 영화관 번호
	 * @return 영화관 정보를 담은 TheaterDTO 객체
	 */
	public TheaterDTO getTheater(String seq) {

		try {
					
					String sql = "select * from tblTheater a inner join tblLocation b on b.location_seq = a.location_seq where theater_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						TheaterDTO dto = new TheaterDTO();
						
						dto.setTheater_seq(rs.getString("theater_seq"));
						dto.setName(rs.getString("name"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setLat(rs.getString("lat"));
						dto.setLng(rs.getString("lng"));
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getTheater");
					e.printStackTrace();
				}
		
		return null;
	}


	/**
	 * 포토존을 추가하는 메서드
	 * 
	 * @param dto 포토존 정보를 담은 PhotoZoneDTO 객체
	 * @return 데이터베이스에 추가된 행의 수
	 */
	public int addPhotozone(PhotoZoneDTO dto) {
		
		try {

			String sql = "INSERT INTO tblPhotoZone (photozone_seq, name, time, info, location_seq) VALUES (seqtblPhotoZone.NEXTVAL, ?, '10:00 - 22:00', ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getInfo());
			pstat.setString(3, dto.getLocation_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.addPhotozone");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 가장 최근에 추가한 포토존 테이블의 포토존 번호를 가져오는 메서드
	 * 
	 * @return 포토존 번호
	 */
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

	/**
	 * 포토존 이미지를 추가하는 메서드
	 * 
	 * @param fileList 이미지 파일 이름의 목록을 담은 ArrayList 객체
	 * @param photozone_seq 포토존 번호
	 * @return 데이터베이스에 추가된 행의 수
	 */
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

	/**
	 * 어트랙션을 수정하는 메서드
	 * 
	 * @param dto 어트랙션 정보를 담은 AttractionDTO 객체
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
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

	/**
	 * 위치 정보를 추가하는 메서드
	 * 
	 * @param lat 위도
	 * @param lng 경도
	 * @return 데이터베이스에 추가된 행의 수
	 */
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

	/**
	 * 위치번호를 찾는 메서드
	 * 
	 * @param lat 위도
	 * @param lng 경도
	 * @return 위치 번호
	 */
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
	
	/**
	 * 해시태그 이름으로 해당 해시태그의 번호를 찾는 메서드
	 * 
	 * @param taglist 해시태그 이름들이 담긴 ArrayList 객체
	 * @return 해시태그의 번호가 담긴 ArrayList 객체
	 */
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

	/**
	 * 어트랙션 번호(seq)를 입력받아 해당하는 어트랙션 해시태그의 개수를 세는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 해당하는 어트랙션 해시태그의 개수
	 */
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

	/**
	 * 어트랙션 해시태그를 삭제하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
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

	/**
	 * 위지 정보를 수정하는 메서드
	 * 
	 * @param location_dto 위치정보를 담은 LocationDTO 객체
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
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

	/**
	 * 어트랙션 이미지를 삭제하는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
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

	/**
	 * 어트랙션을 삭제하는 메서드(업데이트 처리)
	 * 
	 * @param seq 어트랙션 번호
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
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

	/**
	 * 어트랙션 번호(seq)를 입력받아 해당하는 어트랙션 이미지의 개수를 세는 메서드
	 * 
	 * @param seq 어트랙션 번호
	 * @return 해당하는 어트랙션 이미지의 개수
	 */
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

	/**
	 * 페스티벌을 수정하는 메서드
	 * 
	 * @param dto 페스티벌 정보를 담은 FestivalDTO 객체
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
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

	/**
	 * 페스티벌 번호(seq)를 입력받아 해당하는 페스티벌 해시태그의 개수를 세는 메서드
	 * 
	 * @param seq 페스티벌 번호
	 * @return 해당하는 페스티벌 해시태그의 개수
	 */
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

	/**
	 * 페스티벌 번호(seq)를 입력받아 해당하는 페스티벌 이미지의 개수를 세는 메서드
	 * 
	 * @param seq 페스티벌 번호
	 * @return 해당하는 페스티벌 이미지의 개수
	 */
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

	/**
	 * 포토존을 수정하는 메서드
	 * 
	 * @param dto 포토존 정보를 담은 PhotoZoneDTO 객체
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
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

	/**
	 * 포토존 번호(seq)를 입력받아 해당하는 포토존 이미지의 개수를 세는 메서드
	 * 
	 * @param seq 포토존 번호
	 * @return 해당하는 포토존 이미지의 개수
	 */
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

	/**
	 * 포토존 이미지를 삭제하는 메서드
	 * 
	 * @param seq 포토존 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
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

	/**
	 * 포토존을 삭제하는 메서드(업데이트 처리)
	 * 
	 * @param seq 포토존 번호
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
	public int delPhotozone(String seq) {

		try {

			String sql = "update tblPhotozone set location_seq = 0, name = name || '(운영종료)' where photozone_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delPhotozone");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 선택한 날짜에 상영중인 영화의 목록을 조회하는 메서드
	 * 
	 * @param date 특정 날짜 또는 당일(시스템 날짜 기준) 날짜가 담긴 변수
	 * @return 영화 목록을 담은 ArrayList 객체
	 */
	public ArrayList<MovieDTO> movieList(String date) {

		try {
		
				String sql = "";
			
				//view에 start_date, end_date to_char 처리 해놓음!
				if (date.equalsIgnoreCase("")) {
					sql = "select * from vwMovie where to_char(sysdate, 'yyyy-mm-dd') between start_date and end_date order by movie_seq";
				} else {
					sql = "select * from vwMovie where ? between start_date and end_date order by movie_seq";
				}
				
				if (date.equalsIgnoreCase("") ) {
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
				} else {
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, date);
					
					rs = pstat.executeQuery();
				}
			
				ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();
				while (rs.next()) {
					
					MovieDTO dto = new MovieDTO();
					
					dto.setMovie_seq(rs.getString("movie_seq"));
					dto.setMovie_name(rs.getString("movie_name"));
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

	/**
	 * 영화 번호(seq)를 입력받아 해당하는 영화를 조회하는 메서드
	 * 
	 * @param seq 영화 번호
	 * @return 영화 정보를 담은 MovieDTO 객체
	 */
	public MovieDTO getMovie(String seq) {

		try {
					
					String sql = "select * from vwMovie where movie_seq = ?";
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, seq);
					
					rs = pstat.executeQuery();
					
					if (rs.next()) {
						
						MovieDTO dto = new MovieDTO();
						
						dto.setMovie_seq(rs.getString("movie_seq"));
						dto.setMovie_name(rs.getString("movie_name"));
						dto.setStart_date(rs.getString("start_date"));
						dto.setEnd_date(rs.getString("end_date"));
						dto.setRunningtime(rs.getString("runningtime"));
						dto.setImg(rs.getString("img"));
						dto.setPreview(rs.getString("preview"));
						dto.setStart_time(rs.getString("start_time"));
						dto.setTheater_seq(rs.getString("theater_seq"));
						dto.setTheater_name(rs.getString("theater_name"));
						dto.setLocation_seq(rs.getString("location_seq"));
						dto.setLat(rs.getString("lat"));
						dto.setLng(rs.getString("lng"));
						
						return dto;
					}
					
				} catch (Exception e) {
					System.out.println("at ActDAO.getMovie");
					e.printStackTrace();
				}
		
		
		
		return null;
	}

	/**
	 * 영화 번호(seq)를 입력받아 해당하는 영화의 해시태그들을 조회하는 메서드
	 * 
	 * @param seq 영화 번호
	 * @return 영화 해시태그 목록을 담은 ArrayList 객체
	 */
	public ArrayList<MovieHashtagDTO> movieHashtagList(String seq) {

		try {
			
			String sql = "select a.*,(select name from tblHashtag where hashtag_seq = a.hashtag_seq)as hashtag_name from tblmoviehashtag a where movie_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<MovieHashtagDTO> list = new ArrayList<MovieHashtagDTO>();
			while (rs.next()) {
				
				MovieHashtagDTO dto = new MovieHashtagDTO();
				
				dto.setMovie_hashtag_seq(rs.getString("movie_hashtag_seq"));
				dto.setMovie_seq(rs.getString("movie_seq"));
				dto.setHashtag_seq(rs.getString("hashtag_seq"));
				dto.setHashtag_name(rs.getString("hashtag_name"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("at ActDAO.movieHashtagList");
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * 영화관을 추가하는 메서드
	 * 
	 * @param dto 영화관 정보를 담은 TheaterDTO 객체
	 * @return 데이터베이스에 추가된 행의 수
	 */
	public int addTheater(TheaterDTO dto) {

		try {

			String sql = "INSERT INTO tblTheater (theater_seq, name, location_seq) VALUES (seqtblTheater.NEXTVAL, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getLocation_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.addTheater");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 운영 종료 영화관을 제외한 영화관 목록을 조회하는 메서드
	 * 
	 * @return 영화관 목록을 담은 ArrayList 객체
	 */
	public ArrayList<TheaterDTO> theaterList() {

		try {
					
					String sql = "select * from tblTheater where name not like '%(운영종료)%'";
					
					stat = conn.createStatement();
					rs = stat.executeQuery(sql);
					
					ArrayList<TheaterDTO> list = new ArrayList<TheaterDTO>();
					while (rs.next()) {
						
						TheaterDTO dto = new TheaterDTO();
						
						dto.setTheater_seq(rs.getString("theater_seq"));
						dto.setName(rs.getString("name"));
						dto.setLocation_seq(rs.getString("location_seq"));
						
						list.add(dto);
						
					}
					
					return list;
					
				} catch (Exception e) {
					System.out.println("at ActDAO.theaterList");
					e.printStackTrace();
				}
		
		return null;
	}

	/**
	 * 영화를 추가하는 메서드
	 * 
	 * @param dto 영화 정보를 담은 MovieDTO 객체
	 * @return 데이터베이스에 추가된 행의 수
	 */
	public int addMovie(MovieDTO dto) {

		try {

			String sql = "INSERT INTO tblMovie (movie_seq, name, start_date, end_date, runningtime, img, preview) VALUES (seqtblMovie.NEXTVAL, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getMovie_name());
			pstat.setString(2, dto.getStart_date());
			pstat.setString(3, dto.getEnd_date());
			pstat.setString(4, dto.getRunningtime());
			
			if (dto.getImg() == null) {
				pstat.setString(5, "movie.png");
			} else {
				pstat.setString(5, dto.getImg());
			}
			
			pstat.setString(6, dto.getPreview());
			

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.addMovie");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 가장 최근에 추가한 영화 테이블의 영화 번호를 가져오는 메서드
	 * 
	 * @return 영화 번호
	 */
	public String getMovieSeq() {

		try {
			
			String sql = "select max(movie_seq) as movie_seq from tblMovie";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("movie_seq");
			}
			
		} catch (Exception e) {
			System.out.println("at ActDAO.getMovieSeq");
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * 영화 상영 정보를 추가하는 메서드
	 * 
	 * @param dto 영화 정보를 담은 MovieDTO 객체
	 * @return 데이터베이스에 추가된 행의 수
	 */
	public int addMoviePlay(MovieDTO dto) {

		try {

			String sql = "INSERT INTO tblMoviePlay (movie_play_seq, start_time, theater_seq, movie_seq) VALUES (seqtblMoviePlay.NEXTVAL, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getStart_time());
			pstat.setString(2, dto.getTheater_seq());
			pstat.setString(3, dto.getMovie_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.addMoviePlay");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 영화 해시태그를 추가하는 메서드
	 * 
	 * @param seqlist 추가할 해시태그의 번호들이 담긴 ArrayList 객체
	 * @param movie_seq 영화 번호
	 * @return 데이터베이스에 추가된 행의 수
	 */
	public int addMovieHashtag(ArrayList<String> seqlist, String movie_seq) {

		int result = 0;
		
		for (String tag : seqlist) {
			
			try {
				
				String sql = "INSERT INTO tblMovieHashtag (movie_hashtag_seq, movie_seq, hashtag_seq) VALUES (seqtblMovieHashtag.NEXTVAL, ?, ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, movie_seq);
				pstat.setString(2, tag);
				
				result += pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.addMovieHashtag");
				e.printStackTrace();
			}
			
		}
		
		
		return result;
	}

	/**
	 * 영화관 정보를 삭제하는 메서드
	 * 
	 * @param seq 영화관 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
	public int delTheater(String seq) {

		try {

			String sql = "update tblTheater set name = name || '(운영종료)', location_seq = 0 where theater_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delTheater");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	/**
	 * 영화관 번호(seq)를 입력받아 해당하는 영화관의 위치 정보를 조회하는 메서드
	 * 
	 * @param seq 영화관 번호
	 * @return 특정 영화관의 위치 정보를 담은 LocationDTO 객체
	 */
	public LocationDTO getTheaterLocation(String seq) {

		try {
					
					String sql = "select * from tblTheater a inner join tblLocation b on b.location_seq = a.location_seq where theater_seq = ?";
					
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
					System.out.println("at ActDAO.getTheaterLocation");
					e.printStackTrace();
				}
		
		
		return null;
	}

	/**
	 * 영화관 정보를 수정하는 메서드
	 * 
	 * @param dto 영화관 정보를 담은 TheaterDTO 객체
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
	public int editTheater(TheaterDTO dto) {

		try {

			String sql = "update tblTheater set name = ?, location_seq = ? where theater_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getLocation_seq());
			pstat.setString(3, dto.getTheater_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.editTheater");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 영화 번호(seq)를 입력받아 해당하는 영화 상영 정보를 삭제하는 메서드
	 * 
	 * @param seq 영화 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
	public int delMoviePlay(String seq) {

		try {

			String sql = "delete from tblMoviePlay where movie_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delMoviePlay");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 영화 번호(seq)를 입력받아 해당하는 영화를 삭제하는 메서드
	 * 
	 * @param seq 영화 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
	public int delMovie(String seq) {

		try {

			String sql = "delete from tblMovie where movie_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delMovie");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	/**
	 * 영화 번호(seq)를 입력받아 해당하는 영화 해시태그를 삭제하는 메서드
	 * 
	 * @param seq 영화 번호
	 * @return 데이터베이스에 삭제된 행의 수
	 */
	public int delMovieHashtag(String seq) {

		try {

			String sql = "delete from tblMovieHashtag where movie_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.delMovieHashtag");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	/**
	 * 영화 번호(seq)를 입력받아 해당하는 영화 해시태그의 개수를 세는 메서드
	 * 
	 * @param seq 영화 번호
	 * @return 해당하는 영화 해시태그의 개수
	 */
	public int countMovieHashtag(String seq) {

		try {

			String sql = "select count(*) from tblMovieHashtag where movie_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.countMovieHashtag");
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 영화 정보를 수정하는 메서드
	 * 
	 * @param dto 영화 정보를 담은 MovieDTO 객체
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
	public int editMovie(MovieDTO dto) {

		if (dto.getImg() == null) {
			
			try {
				
				String sql = "update tblMovie set name = ?, start_date = ?, end_date = ?, runningtime = ?, preview = ? where movie_seq = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getMovie_name());
				pstat.setString(2, dto.getStart_date());
				pstat.setString(3, dto.getEnd_date());
				pstat.setString(4, dto.getRunningtime());
				pstat.setString(5, dto.getPreview());
				pstat.setString(6, dto.getMovie_seq());
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.editMovie");
				e.printStackTrace();
			}

			
		} else {
			
			try {
				
				String sql = "update tblMovie set name = ?, start_date = ?, end_date = ?, runningtime = ?, img = ?, preview = ? where movie_seq = ?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getMovie_name());
				pstat.setString(2, dto.getStart_date());
				pstat.setString(3, dto.getEnd_date());
				pstat.setString(4, dto.getRunningtime());
				pstat.setString(5, dto.getImg());
				pstat.setString(6, dto.getPreview());
				pstat.setString(7, dto.getMovie_seq());
				
				return pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("at ActDAO.editMovie");
				e.printStackTrace();
			}
		}
		
		
		
		return 0;
	}

	/**
	 * 영화 상영 정보를 수정하는 메서드
	 * 
	 * @param dto 영화 정보를 담은 MovieDTO 객체
	 * @return 데이터베이스에 업데이트된 행의 수
	 */
	public int editMoviePlay(MovieDTO dto) {

		try {

			String sql = "update tblMoviePlay set start_time = ?, theater_seq = ? where movie_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getStart_time());
			pstat.setString(2, dto.getTheater_seq());
			pstat.setString(3, dto.getMovie_seq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("at ActDAO.editMoviePlay");
			e.printStackTrace();
		}
		
		return 0;
	}

		
}
