package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.dao.CarDAO;
import com.sist.vo.car.CarReserveVO;
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

	@Override
	public List<CarVO> carSearchListData(Map map) {
		// TODO Auto-generated method stub
		return dao.carSearchListData(map);
	}

	@Override
	public int carSearchTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.carSearchTotalPage(map);
	}

	@Override
	public CarVO carDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.carDetailData(no);
	}

	@Override
	public void insertCarReserve(Map map) {
		// TODO Auto-generated method stub
		dao.insertCarReserve(map);
	}

	@Override
	public CarReserveVO reserveDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.reserveDetailData(no);
	}

	@Override
	public List<CarReserveVO> reserveListData(String member_id) {
		// TODO Auto-generated method stub
		return dao.reserveListData(member_id);
	}

	@Override
	public void carReserveDelete(int no) {
		// TODO Auto-generated method stub
		dao.carReserveDelete(no);
	}

	@Override
	public List<CarReserveVO> adminCarListData(Map map) {
		// TODO Auto-generated method stub
		return dao.adminCarListData(map);
	}

	@Override
	public int adminCarTotalPage() {
		// TODO Auto-generated method stub
		return dao.adminCarTotalPage();
	}

	@Override
	public void carReserveUpdate(int no) {
		// TODO Auto-generated method stub
		dao.carReserveUpdate(no);
	}

	@Override
	public List<CarVO> carMainData() {
		// TODO Auto-generated method stub
		return dao.carMainData();
	}
	
}
