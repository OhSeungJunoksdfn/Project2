package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.hotel.HotelVO;
import com.sist.service.*;

@RestController
@RequestMapping("hotel/")
public class HotelRestController {
	@Autowired
	private HotelService service;
	
	@GetMapping("list_vue.do")
	public Map hotel_list_vue(int page, HttpSession session, @RequestParam("sort") String sort,
			@RequestParam(value = "checkin", required = false) String checkin, 
			@RequestParam(value = "checkout", required = false) String checkout, 
			@RequestParam(value = "person") int person,
			@RequestParam(value = "areacode", defaultValue = "0" ) int areacode,
			@RequestParam(value = "sigungucode", defaultValue = "0") int sigungucode,
			@RequestParam(value = "cat3", defaultValue = "") String cat3,
			@RequestParam(value = "parking", defaultValue = "0")int parking,
			@RequestParam(value = "sauna", defaultValue = "0")int sauna,
			@RequestParam(value = "sports", defaultValue = "0")int sports,
			@RequestParam(value = "seminar", defaultValue = "0")int seminar,
			@RequestParam(value = "beverage", defaultValue = "0")int beverage,
			@RequestParam(value = "barbecue", defaultValue = "0")int barbecue,
			@RequestParam(value = "bicycle", defaultValue = "0")int bicycle,
			@RequestParam(value = "publicpc", defaultValue = "0")int publicpc,
			@RequestParam(value = "publicbath", defaultValue = "0")int publicbath)
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
		if(cat3.isEmpty() && cat3 != null)map.put("cat3", cat3);
		
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("person", person);
		
		map.put("parking", parking);
		map.put("sauna", sauna);
		map.put("sports", sports);
		map.put("seminar", seminar);
		map.put("beverage", beverage);
		map.put("bicycle", bicycle);
		map.put("barbecue", barbecue);
		map.put("publicpc", publicpc);
		map.put("publicbath", publicbath);
		
		
		
		List<HotelVO> list = service.hotelListData(map);
		
		int totalpage = service.hotelTotalPage(map);
		final int BLOCK = 10;
		int startPage = ((page - 1) / BLOCK * BLOCK) + 1;
		int endPage = startPage + BLOCK - 1;
		if (endPage > totalpage)
			endPage = totalpage;
		
		map = new HashMap();
		
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		System.out.println("start=" + start + ", end=" + end + ", page=" + page + ", areacode=" + areacode + ", sigungucode=" + sigungucode);
		System.out.println("▶️ checkin=" + checkin + ", checkout=" + checkout + ", person=" + person);
		return map;
	}
}
