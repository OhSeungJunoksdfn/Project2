package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.HotelDAO;
import com.sist.vo.hotel.HotelVO;

@Service
public class HotelServiceImpl implements HotelService {
	@Autowired
	private HotelDAO dao;
	
	@Override
	public List<HotelVO> hotelListData(Map map) {
		// TODO Auto-generated method stub
		return dao.hotelListData(map);
	}

	@Override
	public int hotelTotalPage() {
		// TODO Auto-generated method stub
		return dao.hotelTotalPage();
	}
	
}
