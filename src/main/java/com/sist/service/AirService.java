package com.sist.service;

import java.util.List;
import com.sist.vo.air.*;

public interface AirService {
	public List<FlightInfoVO> flightListData(int start,int end);
	public int flightTotalPage();
}
