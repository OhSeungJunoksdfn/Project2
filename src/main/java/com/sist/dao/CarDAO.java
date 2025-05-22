package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CarMapper;
import com.sist.vo.car.CarReserveVO;
import com.sist.vo.car.CarVO;
import com.sist.vo.hotel.HotelReserveVO;

@Repository
public class CarDAO {
	@Autowired
	CarMapper mapper;
	public List<CarVO> carListData(Map map){
		return mapper.carListData(map);
	}
	
	public int carTotalPage(String tabVal) {
		return mapper.carTotalPage(tabVal);
	}
	
	public List<CarVO> carSearchListData(Map map){
		return mapper.carSearchListData(map);
	}
	
	public int carSearchTotalPage(Map map) {
		return mapper.carSearchTotalPage(map);
	}
	
	public CarVO carDetailData(int no)
	{
		return mapper.carDetailData(no);
	}
	
	public void insertCarReserve(Map map)
	{
		mapper.insertCarReserve(map);
	}
	
	public CarReserveVO reserveDetailData(int no)
	{
		return mapper.reserveDetailData(no);
	}
	
	public List<CarReserveVO> reserveListData(String member_id)
	{
		return mapper.reserveListData(member_id);
	}
	
	public void carReserveDelete(int no)
	{
		mapper.carReserveDelete(no);
	}
	
	public List<CarReserveVO> adminCarListData(Map map)
	{
		return mapper.adminCarListData(map);
	}
	
	public int adminCarTotalPage()
	{
		return mapper.adminCarTotalPage();
	}
	
	public void carReserveUpdate(int no)
	{
		mapper.carReserveUpdate(no);
	}
	
	public List<CarVO> carMainData()
	{
		return mapper.carMainData();
	}
}
