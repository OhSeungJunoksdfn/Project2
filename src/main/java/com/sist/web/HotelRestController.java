package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.vo.*;
import com.sist.vo.hotel.HotelVO;
import com.sist.service.*;

@RestController
@RequestMapping("hotel/")
public class HotelRestController {
	@Autowired
	private HotelService service;
	
	@GetMapping("list_vue.do")
	public Map hotel_list_vue(String page, Map map)
	{
		if(page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 12;
		
		int totalpage = service.hotelTotalPage();
		
		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			endPage = totalpage;
		
		List<HotelVO> list = service.hotelListData(map);
		map = new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
//		map.put("areaCode", areaCode);
//		map.put("minPrice", minPrice);
//		map.put("maxPrice", paxPrice);
		
		return map;
	}

}
