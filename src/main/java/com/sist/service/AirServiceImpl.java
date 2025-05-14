package com.sist.service;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.air.*;
import com.sist.dao.AirDAO;
@Service
public class AirServiceImpl implements AirService{
	
	@Autowired
	private AirDAO aDAO;

	@Override
	public List<FlightInfoVO> flightListData(int start, int end) {
		// TODO Auto-generated method stub
		return aDAO.flightListData(start, end);
	}

	@Override
	public int flightTotalPage() {
		// TODO Auto-generated method stub
		return aDAO.flightTotalPage();
	}

	

}
