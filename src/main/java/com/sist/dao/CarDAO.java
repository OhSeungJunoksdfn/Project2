package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CarMapper;
import com.sist.vo.car.CarVO;

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
	
	public int carSearchTotalPage() {
		return mapper.carSearchTotalPage();
	}
	
	public CarVO carDetailData(int no)
	{
		return mapper.carDetailData(no);
	}
}
