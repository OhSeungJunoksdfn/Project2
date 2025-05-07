package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.dao.CarDAO;
import com.sist.vo.car.CarVO;

@Repository
public class CarServiceImpl implements CarService{
	@Autowired
	CarDAO dao;
	
	@Override
	public List<CarVO> carListData(Map map) {
		// TODO Auto-generated method stub
		return dao.carListData(map);
	}

	@Override
	public int carTotalPage(String tabVal) {
		// TODO Auto-generated method stub
		return dao.carTotalPage(tabVal);
	}

	

}
