package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
import com.sist.vo.hotel.HotelVO;
public interface HotelMapper {
	public List<HotelVO> hotelListData(Map map);
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM hotel")
	public int hotelTotalPage();
}
