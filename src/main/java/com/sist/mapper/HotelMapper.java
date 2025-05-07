package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
import com.sist.vo.hotel.HotelImgVO;
import com.sist.vo.hotel.HotelInfoVO;
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
	
	@Select("SELECT hotel_no, checkintime, checkouttime, food_place, parking, seminar, sports, "
			+ "sauna, beverage, barbecue, bicycle, fitness, publicpc, publicbath "
			+ "FROM hotel_info "
			+ "WHERE hotel_no = #{no}")
	public HotelInfoVO hotelInfoData(int no);
}
