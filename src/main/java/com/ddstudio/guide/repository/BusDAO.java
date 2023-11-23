package com.ddstudio.guide.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.guide.model.BusDTO;
import com.ddstudio.pb.model.PriceDTO;

/**
 * BusDAO 클래스입니다.
 * 클래스는 데이터베이스와 상호 작용하여 버스 정보를 처리하는 DAO 클래스로, 버스의 조회, 추가, 수정, 삭제 등의 기능을 제공합니다.
 */
public class BusDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BusDAO() {
		this.conn=DBUtil.open();
	}

	/**
	 * 어트랙션 리스트를 불러옵니다.
	 * @param close 어트랙션 운행 여부를 받습니다.
	 * @return	운행중인 어트랙션의 리스트를 반환합니다.
	 */
	public ArrayList<AttractionDTO> attractionList(String close) {


			try {
				String sql = "";


				if (close.equals("")) {
					sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1) as img from tblAttraction a where name not like '%(운영종료)%'";

				} else if (close.equalsIgnoreCase("open")) {

					sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1) as img from tblAttraction a where name not like '%(운영종료)%' and attraction_seq not in (select attraction_seq from tblAttractionClose  where TO_CHAR(sysdate,'YYYY-MM-DD') between TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(end_date,'YYYY-MM-DD'))";

				} else if (close.equalsIgnoreCase("close")) {
					sql = "select a.*, (select img from tblAttractionImg where attraction_seq = a.attraction_seq and rownum = 1) as img from tblAttraction a where name not like '%(운영종료)%' and attraction_seq in (select attraction_seq from tblAttractionClose where TO_CHAR(sysdate,'YYYY-MM-DD') between TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(end_date,'YYYY-MM-DD'))";

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

//               pstat.close();
//               conn.close();

				return list;

			} catch (Exception e) {
				System.out.println("at ActDAO.list");
				e.printStackTrace();
			}


			return null;
	}

	/**
	 * 버스 리스트를 불러옵니다.
	 * @return 버스 리스트를 반환합니다.
	 */
	public ArrayList<BusDTO> busList() {


		ArrayList<BusDTO> list = new ArrayList<>();


		try {

			String sql = "select * from TBLBUS ";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			//rs == 메모 목록

			//rs를  list로 옮기기
			while (rs.next()) {

				//레코드 1줄 > MemoDTO 1개
				BusDTO dto = new BusDTO();
				dto.setBus_seq(rs.getString("bus_seq"));
				dto.setStart_time(rs.getString("start_time"));
				dto.setInterval(rs.getString("interval"));
				dto.setCapacity(rs.getString("capacity"));


				list.add(dto);
			}
			return list;


		} catch (Exception e) {
			e.printStackTrace();

		}

		return list;

	}

	/**
	 * 버스 정보의 리스트를 불러옵니다.
	 * @return 버스 정보의 리스트를 리턴합니다.
	 */
	public ArrayList<BusDTO> getBusInfo() {


		try {

			String sql = "select * from TBLROUTE r INNER JOIN TBLBUS b on r.BUS_SEQ = b.BUS_SEQ";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<BusDTO> list = new ArrayList<>();

			while (rs.next()) {


				BusDTO dto = new BusDTO();

				dto.setRoute_seq(rs.getString("route_seq"));
				dto.setRoute_order(rs.getString("route_order"));
				dto.setBus_seq(rs.getString("bus_seq"));
				dto.setStart_attraction_seq("start_attraction_seq");
				dto.setEnd_attraction_seq("end_attraction_seq");
				dto.setInterval(rs.getString("interval"));
				dto.setCapacity(rs.getString("capacity"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 버스 노선을 추가합니다.
	 * @param dto 추가할 버스 노선 객체를 받습니다.
	 * @return 버스 노선이 추가되면 1을 ,실패시 0을 반환합니다.
	 */
	public int add(BusDTO dto) {


		try {

			String sql = " insert into TBLROUTE (ROUTE_SEQ, ROUTE_ORDER, BUS_SEQ, START_ATTRACTION_SEQ, END_ATTRACTION_SEQ) values (SEQTBLROUTE.nextval,?, ?, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getRoute_order());
			pstat.setString(2, dto.getBus_seq());
			pstat.setString(3, dto.getStart_name());
			pstat.setString(4, dto.getEnd_name());

			int result = pstat.executeUpdate();


			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}


		return 0;

	}

	/**
	 * 시작 어트랙션 번호를 가져옵니다.
	 * @param name 가져올 어트랙션의 이름을 받습니다.
	 * @return 매개변수로 입력받은 어트랙션의 시작번호를 반환합니다.
	 */
	public String startNum(String name) {  // 시작 어트랙션번호가져오기


		try {

			String sql = "select ATTRACTION_SEQ from TBLATTRACTION where NAME = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, name);

			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getString("attraction_seq");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

return null;
	}

	/**
	 * 도착 어트랙션의 번호를 가져옵니다.
	 * @param endName 도착 어트랙션의 이름을 받습니다.
	 * @return	 해당어트랙션의 번호를 반환합니다.
	 */
	public String endNum(String endName) { // 도착 어트랙션 번호 가져오기

		try {

			String sql = "select ATTRACTION_SEQ from TBLATTRACTION where NAME = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, endName);

			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getString("attraction_seq");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 버스 노선의 리스트를 가져옵니다.
	 * @return 버스 노선의 리스트를 반환합니다.
	 */
	public ArrayList<BusDTO> routeList() {


		try {

			String sql = "SELECT B.BUS_SEQ, A1.NAME AS START_ATTRACTION_NAME, A2.NAME AS END_ATTRACTION_NAME,  B.START_TIME, B.INTERVAL FROM TBLROUTE R JOIN TBLBUS B ON R.BUS_SEQ = B.BUS_SEQ JOIN TBLATTRACTION A1 ON R.START_ATTRACTION_SEQ = A1.ATTRACTION_SEQ JOIN TBLATTRACTION A2 ON R.END_ATTRACTION_SEQ = A2.ATTRACTION_SEQ order by BUS_SEQ asc ";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			ArrayList<BusDTO> list = new ArrayList<>();

			while (rs.next()) {

				BusDTO dto = new BusDTO();
				dto.setBus_seq(rs.getString("bus_seq"));
				dto.setStart_name(rs.getString("start_attraction_name"));
				dto.setEnd_name(rs.getString("end_attraction_name"));
				dto.setStart_time(rs.getString("start_time"));
				dto.setInterval(rs.getString("interval"));
				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
}
