package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.AirMapper;
import com.sist.vo.air.*;

@Repository
public class AirDAO {
	@Autowired
	AirMapper mapper;
	public List<FlightInfoVO> flightListData(int start,int end){
		return mapper.flightListData(start, end);
	}
	
	public int flightTotalPage() {
		return mapper.flightTotalPage();
	}
}
