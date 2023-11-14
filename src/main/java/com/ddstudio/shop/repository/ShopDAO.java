package com.ddstudio.shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ddstudio.DBUtil;
import com.ddstudio.shop.model.CategoryDTO;
import com.ddstudio.shop.model.GiftShopCloseDTO;
import com.ddstudio.shop.model.GiftShopDTO;
import com.ddstudio.shop.model.GiftShopImgDTO;
import com.ddstudio.shop.model.ItemDTO;
import com.ddstudio.shop.model.ItemImgDTO;
import com.ddstudio.shop.model.RestaurantCloseDTO;
import com.ddstudio.shop.model.RestaurantDTO;
import com.ddstudio.shop.model.RestaurantImgDTO;

public class ShopDAO {
	
	private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    public ShopDAO() {

        this.conn = DBUtil.open();

    }

	public ArrayList<RestaurantDTO> restaurantList() {
		
		try {
			
			String sql = "select * from vwRestaurant where location_seq != 0";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<RestaurantDTO> list = new ArrayList<RestaurantDTO>();
			
			while (rs.next()) {
				
				RestaurantDTO dto = new RestaurantDTO();
				
				dto.setRestaurant_seq(rs.getString("restaurant_seq"));
				dto.setName(rs.getString("name"));
				dto.setMenu(rs.getString("menu"));
				dto.setTime(rs.getString("time"));
				dto.setCapacity(rs.getString("capacity"));
				dto.setTel(rs.getString("tel"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setCategory(rs.getString("category"));
				dto.setImg(rs.getString("img"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("ShopDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<GiftShopDTO> giftShopList() {
		
try {
			
			String sql = "select * from vwShop where location_seq != 0";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<GiftShopDTO> list = new ArrayList<GiftShopDTO>();
			
			while (rs.next()) {
				
				GiftShopDTO dto = new GiftShopDTO();
				
				dto.setShop_seq(rs.getString("shop_seq"));
				dto.setName(rs.getString("name"));
				dto.setTime(rs.getString("time"));
				dto.setInfo(rs.getString("info"));
				dto.setTel(rs.getString("tel"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setImg(rs.getString("img"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("ShopDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

	public RestaurantDTO restaurantDedtail(String seq) {
		
		try {
			
			String sql = "select * from vwRestaurant where restaurant_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				RestaurantDTO dto = new RestaurantDTO();
				
				dto.setRestaurant_seq(rs.getString("restaurant_seq"));
				dto.setName(rs.getString("name"));
				dto.setMenu(rs.getString("menu"));
				dto.setTime(rs.getString("time"));
				dto.setCapacity(rs.getString("capacity"));
				dto.setTel(rs.getString("tel"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setCategory(rs.getString("category"));
				dto.setImg(rs.getString("img"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("ShopDAO.restaurantDedtail()");
			e.printStackTrace();
		}
		
		return null;
	}

	public RestaurantCloseDTO restaurantClose(String seq) {
		
		try {
			
			String sql = "select * from tblRestaurantClose where restaurant_seq = ? and TO_CHAR(sysdate,'YYYY-MM-DD') >= TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(sysdate,'YYYY-MM-DD') <= TO_CHAR(end_date,'YYYY-MM-DD')";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				RestaurantCloseDTO dto = new RestaurantCloseDTO();
				
				dto.setRestaurant_close_seq(rs.getString("restaurant_close_seq"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setRestaurant_seq(rs.getString("restaurant_seq"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("ShopDAO.restaurantClose()");
			e.printStackTrace();
		}
		
		return null;
	}

	public GiftShopDTO giftShopDetail(String seq) {
		
		try {
			
			String sql = "select * from vwshop where shop_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				GiftShopDTO dto = new GiftShopDTO();
				
				dto.setShop_seq(rs.getString("shop_seq"));
				dto.setName(rs.getString("name"));
				dto.setTime(rs.getString("time"));
				dto.setInfo(rs.getString("info"));
				dto.setTel(rs.getString("tel"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setImg(rs.getString("img"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("ShopDAO.giftShopDetail()");
			e.printStackTrace();
		}
		
		return null;
	}

	public GiftShopCloseDTO giftShopClose(String seq) {
		
		try {
			
			String sql = "select * from tblShopClose where shop_seq = ? and TO_CHAR(sysdate,'YYYY-MM-DD') >= TO_CHAR(start_date,'YYYY-MM-DD') and TO_CHAR(sysdate,'YYYY-MM-DD') <= TO_CHAR(end_date,'YYYY-MM-DD')";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				GiftShopCloseDTO dto = new GiftShopCloseDTO();
				
				dto.setShop_close_seq(rs.getString("shop_close_seq"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setShop_seq(rs.getString("shop_seq"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("ShopDAO.giftShopClose()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<ItemDTO> itemList(String seq) {
		
		try {
			
			String sql = "select i.*, (select img from tblitemImg where item_seq = i.item_seq and rownum = 1) as img from tblitem i where item_seq = ? and name not like '%종료%'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
			
			while (rs.next()) {
				
				ItemDTO dto = new ItemDTO();
				
				dto.setItem_seq(rs.getString("item_seq"));
				dto.setName(rs.getString("name"));
				dto.setInfo(rs.getString("info"));
				dto.setPrice(rs.getInt("price"));
				dto.setShop_seq(rs.getString("shop_seq"));
				dto.setImg(rs.getString("img"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("ShopDAO.itemList()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ItemDTO itemDetail(String seq) {
		
		try {
			
			String sql = "select *  from tblitem where item_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				ItemDTO dto = new ItemDTO();
				
				dto.setItem_seq(rs.getString("item_seq"));
				dto.setName(rs.getString("name"));
				dto.setInfo(rs.getString("info"));
				dto.setPrice(rs.getInt("price"));
				dto.setShop_seq(rs.getString("shop_seq"));
				
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("ShopDAO.itemDetail()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<ItemImgDTO> itemImgs(String seq) {
		
		try {
			
			String sql = "select * from tblitemimg where item_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<ItemImgDTO> list = new ArrayList<ItemImgDTO>();
			
			while (rs.next()) {
				
				ItemImgDTO dto = new ItemImgDTO();
				
				dto.setItem_img_seq(rs.getString("item_img_seq"));
				dto.setImg(rs.getString("img"));
				dto.setItem_seq(rs.getString("item_seq"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("ShopDAO.itemImgs()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<GiftShopImgDTO> giftShopImgs(String seq) {
		
		try {
			
			String sql = "select * from tblshopimg where shop_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<GiftShopImgDTO> list = new ArrayList<GiftShopImgDTO>();
			
			while (rs.next()) {
				
				GiftShopImgDTO dto = new GiftShopImgDTO();
				
				dto.setShop_img_seq(rs.getString("shop_img_seq"));
				dto.setImg(rs.getString("img"));
				dto.setShop_seq(rs.getString("shop_seq"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("ShopDAO.giftShopImgs()");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<RestaurantImgDTO> restaurantImgs(String seq) {
		
		try {
			
			String sql = "select * from tblrestaurantimg where restaurant_seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<RestaurantImgDTO> list = new ArrayList<RestaurantImgDTO>();
			
			while (rs.next()) {
				
				RestaurantImgDTO dto = new RestaurantImgDTO();
				
				dto.setRestaurant_img_seq(rs.getString("restaurant_img_seq"));
				dto.setImg(rs.getString("img"));
				dto.setRestaurant_seq(rs.getString("restaurant_seq"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("ShopDAO.restaurantImgs()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int changeItemName(String seq) {

		try {

			String sql = "update tblItem set name = name || '(판매 종료)' where item_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ShopDAO.changeItemName()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getShopSeq(String seq) {
		
		try {

			String sql = "select shop_seq from tblItem where item_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getString("shop_seq");
			}

		} catch (Exception e) {
			System.out.println("ShopDAO.getShopSeq()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int changeItemNameWithShop(String seq) {
		
		try {

			String sql = "update tblItem set name = name || '(판매종료)' where shop_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ShopDAO.changeItemNameWithShop()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int changeShop(String seq) {
		
		try {

			String sql = "update tblShop set location_seq = 0 where shop_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ShopDAO.changeShop()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int changeRestaurant(String seq) {
		
		try {

			String sql = "update tblRestaurant set location_seq = 0 where restaurant_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ShopDAO.changeRestaurant()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<CategoryDTO> getCategory() {

		try {
			
			String sql = "select * from tblcategory order by category_seq asc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
			
			while (rs.next()) {
				
				CategoryDTO dto = new CategoryDTO();
				
				dto.setCategory_seq(rs.getString("category_seq"));
				dto.setName(rs.getString("name"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("ShopDAO.getCategory()");
			e.printStackTrace();
		}
		
		return null;
	}



	public int addLocation(RestaurantDTO dto) {
		
		try {

			String sql = "insert into tbllocation (location_seq, lat, lng) select seqtblLocation.nextVal, ?, ? from dual where not exists (select 1 from tbllocation where lat = ? and lng = ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());
			pstat.setString(3, dto.getLat());
			pstat.setString(4, dto.getLng());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ShopDAO.addLocation()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getLocationSeq(RestaurantDTO dto) {

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
			System.out.println("ShopDAO.getLocationSeq()");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int addRestaurant(RestaurantDTO dto) {

		try {

			String sql = "insert into tblRestaurant (restaurant_seq, name, menu, time, capacity, tel, location_seq, category_seq) values (seqtblRestaurant.nextVal, ?, ?, ?, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getMenu());
			pstat.setString(3, dto.getTime());
			pstat.setString(4, dto.getCapacity());
			pstat.setString(5, dto.getTel());
			pstat.setString(6, dto.getLocation_seq());
			pstat.setString(7, dto.getCategory());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("ShopDAO.addRestaurant()");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getRestaurantSeq() {

		try {

			String sql = "select max(restaurant_seq) as restaurant_seq from tblRestaurant";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getString("restaurant_seq");
			}

		} catch (Exception e) {
			System.out.println("ShopDAO.getRestaurantSeq()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int addRestaurantImg(ArrayList<String> fileList, String restaurant_seq) {
		
		int result = 0;
		
		for (String name : fileList) {
			
			try {

				String sql = "insert into tblRestaurantImg (restaurant_img_seq, img, restaurant_seq) values (seqtblrestaurantimg.nextVal, ?, ?)";

				pstat = conn.prepareStatement(sql);
				pstat.setString(1, name);
				pstat.setString(2, restaurant_seq);
				
				result += pstat.executeUpdate();

			} catch (Exception e) {
				System.out.println("ShopDAO.addRestaurantImg()");
				e.printStackTrace();
			}
			
		}
		
		return result;
	}

}
