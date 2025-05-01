package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import com.sist.vo.hotel.HotelVO;
import com.sist.service.*;

@RestController
@RequestMapping("hotel/")
public class HotelRestController {
	@Autowired
	private HotelService service;
	
	@GetMapping("list_vue.do")
	public Map hotel_list_vue(int page, @RequestParam(value = "sort") String sort,
			@RequestParam(value = "areacode", required = false) Integer areacode)
	{
		int rowSize = 8;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		int totalpage = service.hotelTotalPage();
		
		final int BLOCK = 10;
		int startPage = ((page - 1) / BLOCK * BLOCK) + 1;
		int endPage = startPage + BLOCK - 1;
		if (endPage > totalpage)
			endPage = totalpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		if(areacode != null)map.put("areacode", areacode);
		map.put("sort", sort);
		
		List<HotelVO> list = service.hotelListData(map);

		map = new HashMap();
		
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		System.out.println("start=" + start + ", end=" + end + ", page=" + page);
		
		return map;
	}
}
