package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.hotel.HotelVO;

public interface HotelService {
	public List<HotelVO> hotelListData(Map map);
	public int hotelTotalPage();
}
