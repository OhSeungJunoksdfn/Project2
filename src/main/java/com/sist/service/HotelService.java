package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.hotel.HotelImgVO;
import com.sist.vo.hotel.HotelInfoVO;
import com.sist.vo.hotel.HotelRoomVO;
import com.sist.vo.hotel.HotelVO;

public interface HotelService {
	public List<HotelVO> hotelListData(Map map);
	public int hotelTotalPage(Map map);
	public List<HotelRoomVO> hotelDetaiListlData(int no);
	public List<HotelImgVO> hotelImgListData(int no);
	public HotelVO hotelData(int no);
	public HotelInfoVO hotelInfoData(int no);
}
