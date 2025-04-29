package com.sist.service;

import java.util.List;

import com.sist.vo.car.CarVO;

public interface CarService {
	public List<CarVO> carListData(int start,int end);
	public int carTotalPage();
}
