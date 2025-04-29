package com.sist.dao;

import java.util.List;

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
	public List<CarVO> carListData(int start,int end){
		return mapper.carListData(start, end);
	}
	
	public int carTotalPage() {
		return mapper.carTotalPage();
	}
}
