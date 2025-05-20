package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
import com.sist.vo.hotel.HotelImgVO;
import com.sist.vo.hotel.HotelInfoVO;
import com.sist.vo.hotel.HotelReserveVO;
import com.sist.vo.hotel.HotelRoomVO;
import com.sist.vo.hotel.HotelVO;
public interface HotelMapper {
	public List<HotelVO> hotelListData(Map map);
	public int hotelTotalPage(Map map);
	
	@Select("SELECT no, hotel_no, title, person, person_max, price, room_img, bath1, bath2, aircondition, "
			+ "   tv, pc, cable, internet, fridge, toiletries, sofa, cook, tables, hairdryer "
			+ "FROM hotel_room "
			+ "WHERE hotel_no = #{no}")
	public List<HotelRoomVO> hotelDetaiListlData(int no);
	
	@Select("SELECT no, hotel_no, img_og "
			+ "FROM hotel_img "
			+ "WHERE hotel_no = #{no}")
	public List<HotelImgVO> hotelImgListData(int no);
	
	@Select("SELECT * FROM hotel WHERE no = #{no}")
	public HotelVO hotelData(int no);
	
	@Select("SELECT * "
			+ "FROM (SELECT h.no, h.title, h.addr, h.img, MIN(hr.price) AS price "
			+ "FROM hotel h "
			+ "JOIN hotel_room hr ON hr.hotel_no = h.no "
			+ "WHERE h.areacode = #{areacode} "
			+ "AND h.sigungucode = #{sigungucode} "
			+ "AND h.no != #{no} "
			+ "GROUP BY h.no, h.title, h.addr, h.img "
			+ "ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE ROWNUM <= 3")
	public List<HotelVO> hotelRelatedData(Map map);
	
	@Select("SELECT h.no AS hotel_no, h.title AS hotel_title, hr.title, hr.no, hr.person, hr.price, "
			+ "hi.checkintime, hi.checkouttime, m.name, m.phone, m.email "
			+ "FROM hotel_room hr "
			+ "JOIN hotel h ON hr.hotel_no = h.no "
			+ "JOIN hotel_info hi ON hi.hotel_no = h.no "
			+ "JOIN projectmember m ON m.id = #{member_id} "
			+ "WHERE hr.no = #{no}")
	public HotelRoomVO hotelReserveData(Map map);
	
	@Select("SELECT * "
			+ "FROM (SELECT h.no, h.title, h.addr, h.img, MIN(hr.price) AS price "
			+ "FROM hotel h "
			+ "JOIN hotel_room hr ON hr.hotel_no = h.no "
			+ "GROUP BY h.no, h.title, h.addr, h.img "
			+ "ORDER BY DBMS_RANDOM.RANDOM) "
			+ "WHERE ROWNUM <= 4")
	public List<HotelVO> hotelMainData();
	
	@Select("SELECT hotel_no, checkintime, checkouttime, food_place, parking, seminar, sports, "
			+ "sauna, beverage, barbecue, bicycle, fitness, publicpc, publicbath "
			+ "FROM hotel_info "
			+ "WHERE hotel_no = #{no}")
	public HotelInfoVO hotelInfoData(int no);
	
	@Insert("INSERT INTO hotel_reservation "
			+ "(no, hotel_no, room_no, member_id, username, useremail, userphone, checkin, checkout, person, "
			+ "total_price, stay_days, booking_date, status) "
			+ "VALUES "
			+ "(hotel_reservation_reserve_no_seq.nextval, #{hotel_no}, #{room_no}, #{member_id}, #{username}, "
			+ "#{useremail, jdbcType=VARCHAR}, #{userphone, jdbcType=VARCHAR}, #{checkin}, #{checkout}, #{person}, #{total_price}, #{stay_days}, SYSDATE, '예약 진행 중')")
	public int hotelReserveInsertData(HotelReserveVO vo);
	
	//////////////////////////////////////////////////////////////////////////////////////////
	@Select("SELECT rv.no, rv.hotel_no, rv.room_no, rv.username, checkin, checkout, "
			+ "rv.stay_days, rv.total_price, rv.booking_date, rv.status, rv.person, rv.useremail, rv.userphone, h.title AS hotel_title, hr.title AS room_title "
			+ "FROM hotel_reservation rv "
			+ "JOIN hotel h ON hotel_no = h.no "
			+ "JOIN hotel_room hr ON room_no = hr.no "
			+ "JOIN projectmember m ON member_id = m.id "
			+ "WHERE member_id = #{member_id}")
	public List<HotelReserveVO> mypageHotelReserveListData(String member_id);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) "
			+ "FROM hotel_reservation rv "
			+ "JOIN hotel h ON hotel_no = h.no "
			+ "JOIN hotel_room hr ON room_no = hr.no "
			+ "JOIN projectmember m ON member_id = m.id ")
	public int mypageHotelListTotalPage();
	
	@Select("SELECT rv.no, rv.hotel_no, rv.room_no, rv.member_id, rv.username, checkin, checkout, "
			+ " rv.stay_days, rv.total_price, rv.booking_date, rv.status, rv.person, rv.useremail, rv.userphone, "
			+ "h.title AS hotel_title, hr.title AS room_title, hi.checkintime, hi.checkouttime "
			+ "FROM hotel_reservation rv "
			+ "JOIN hotel h ON hotel_no = h.no "
			+ "JOIN hotel_info hi ON hi.hotel_no = h.no "
			+ "JOIN hotel_room hr ON room_no = hr.no "
			+ "WHERE rv.no = #{no}")
	public HotelReserveVO hotelReserveDetailData(int no);
	
	@Select("SELECT * "
			+ "FROM (SELECT rv.no, rv.hotel_no, rv.room_no, rv.checkin, rv.checkout, rv.total_price, rv.booking_date, rv.status, "
			+ "rv.person, rv.member_id, rv.username, rv.useremail, rv.userphone, h.title AS hotel_title, hr.title AS room_title, "
			+ "ROW_NUMBER() OVER (ORDER BY rv.no DESC) AS rn "
			+ "FROM hotel_reservation rv "
			+ "JOIN hotel h ON rv.hotel_no = h.no "
			+ "JOIN hotel_room hr ON rv.room_no = hr.no) "
			+ "WHERE rn BETWEEN #{start} AND #{end}")
	public List<HotelReserveVO> adminHotelListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) "
			+ "FROM hotel_reservation rv "
			+ "JOIN hotel h ON rv.hotel_no = h.no "
			+ "JOIN hotel_room hr ON rv.room_no = hr.no")
	public int adminHotelListTotalPage();
	
	@Update("UPDATE hotel_reservation SET status = '예약 확정' WHERE no = #{no}")
	public void adminHotelUpdate(HotelReserveVO vo);
	
	@Delete("DELETE FROM hotel_reservation WHERE no = #{no}")
	public void hotelReserveDelete(int no);
}
