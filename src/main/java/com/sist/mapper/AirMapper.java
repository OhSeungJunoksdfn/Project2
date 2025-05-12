
package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Param;


import com.sist.vo.air.FlightInfoVO;


public interface AirMapper {

	    List<FlightInfoVO> flightListData(
	        @Param("start") int start,
	        @Param("end")   int end
	    );
	    int flightTotalPage();
	    FlightInfoVO flightDetailData(@Param("id") int id);

	    // ↓ 필터 + 페이징
	    List<FlightInfoVO> flightListDataFiltered(Map<String,Object> map);
	    int flightTotalPageFiltered(Map<String,Object> map);
	}
