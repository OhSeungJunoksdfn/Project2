package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.hotel.HotelImgVO;
import com.sist.vo.hotel.HotelInfoVO;
import com.sist.vo.hotel.HotelReserveVO;
import com.sist.vo.hotel.HotelRoomVO;
import com.sist.vo.hotel.HotelVO;

import java.util.*;

@Repository
public class HotelDAO {
	@Autowired
	private HotelMapper mapper;
	
	public List<HotelVO> hotelListData(Map map)
	{
		return mapper.hotelListData(map);
	}
	public int hotelTotalPage(Map map)
	{
		return mapper.hotelTotalPage(map);
	}
	public List<HotelRoomVO> hotelDetaiListlData(int no)
	{
		return mapper.hotelDetaiListlData(no);
	}
	public List<HotelImgVO> hotelImgListData(int no)
	{
		return mapper.hotelImgListData(no);
	}
	public HotelVO hotelData(int no)
	{
		return mapper.hotelData(no);
	}
	public HotelInfoVO hotelInfoData(int no)
	{
		return mapper.hotelInfoData(no);
	}
	public List<HotelVO> hotelRelatedData(Map map)
	{
		return mapper.hotelRelatedData(map);
	}
	public HotelRoomVO hotelReserveData(Map map)
	{
		return mapper.hotelReserveData(map);
	}
	public int hotelReserveInsertData(HotelReserveVO vo)
	{
		return mapper.hotelReserveInsertData(vo);
	}
	public List<HotelVO> hotelMainData()
	{
		return mapper.hotelMainData();
	}
	////////////////////////////////////////////////////////////////// 옮길지 의논하기
	public List<HotelReserveVO> hotelReserveListData(String member_id)
	{
		return mapper.hotelReserveListData(member_id);
	}
	public HotelReserveVO hotelReserveDetailData(int no)
	{
		return mapper.hotelReserveDetailData(no);
	}
	public List<HotelReserveVO> adminHotelListData(Map map)
	{
		return mapper.adminHotelListData(map);
	}
	public void hotelReserveDelete(int no)
	{
		mapper.hotelReserveDelete(no);
	}
	public int adminHotelListTotalPage()
	{
		return mapper.adminHotelListTotalPage();
	}
	public void adminHotelUpdate(HotelReserveVO vo)
	{
		mapper.adminHotelUpdate(vo);
	}
}
