package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.dao.CarDAO;
import com.sist.vo.car.CarVO;

@Repository
public class CarServiceImpl implements CarService{
	@Autowired
	CarDAO dao;
	
	@Override
	public List<CarVO> carListData(int start, int end) {
		// TODO Auto-generated method stub
		return dao.carListData(start, end);
	}

	@Override
	public int carTotalPage() {
		// TODO Auto-generated method stub
		return dao.carTotalPage();
	}

	

}
