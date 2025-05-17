package com.sist.service;

import java.util.*;

import com.sist.vo.car.CarVO;

public interface CarService {
	public List<CarVO> carListData(Map map);
	public int carTotalPage(String tabVal);
	public List<CarVO> carSearchListData(Map map);
	public int carSearchTotalPage();
	public CarVO carDetailData(int no);
	public void insertCarReserve(Map map);
}
