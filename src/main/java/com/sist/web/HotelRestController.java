package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
			@RequestParam(value = "areacode", defaultValue = "0" ) int areacode,
			@RequestParam(value = "sigungucode", defaultValue = "0") int sigungucode,
			@RequestParam(value = "cat3", defaultValue = "") String cat3)
	{
		int rowSize = 8;
		int start = (rowSize*page)-(rowSize-1);
		int end = rowSize*page;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("sort", sort);
		if(areacode != 0)map.put("areacode", areacode);
		if(sigungucode != 0)map.put("sigungucode", sigungucode);
		if(cat3.isEmpty() || cat3 != null)map.put("cat3", cat3);
//		map.put("minPrice", 50000);
//		map.put("maxPrice", 250000);
		
		List<HotelVO> list = service.hotelListData(map);
		
		int totalpage = service.hotelTotalPage(map);
		final int BLOCK = 10;
		int startPage = ((page - 1) / BLOCK * BLOCK) + 1;
		int endPage = startPage + BLOCK - 1;
		if (endPage > totalpage)
			endPage = totalpage;
		
		
//		List<Map<String, Object>> SGGList = new ArrayList<>();
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 0, "name", "서울 전체"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 1, "name", "강남구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 2, "name", "강동구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 3, "name", "강북구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 4, "name", "강서구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 6, "name", "광진구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 7, "name", "구로구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 11, "name", "동대문구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 13, "name", "마포구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 14, "name", "서대문구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 15, "name", "서초구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 16, "name", "성동구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 17, "name", "성북구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 18, "name", "송파구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 20, "name", "영등포구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 21, "name", "용산구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 23, "name", "종로구"));
//		SGGList.add(Map.of("areacode", 1, "sigungucode", 24, "name", "중구"));
//		
//		SGGList.add(Map.of("areacode", 39, "sigungucode", 0, "name", "제주 전체"));
//		SGGList.add(Map.of("areacode", 39, "sigungucode", 3, "name", "서귀포시"));
//		SGGList.add(Map.of("areacode", 39, "sigungucode", 4, "name", "제주시"));
		
		
		map = new HashMap();
		
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
//		map.put("SGGList", SGGList);
		
		
		System.out.println("start=" + start + ", end=" + end + ", page=" + page + ", areacode=" + areacode + ", sigungucode=" + sigungucode);
		
		return map;
	}
}
