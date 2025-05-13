package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.CarService;
import com.sist.vo.car.CarVO;

import java.util.*;

@RestController
public class CarRestController {
	@Autowired
	CarService service;
	
	@GetMapping("car/list_vue.do")
	public Map car_list(int page,String tabVal) {
		
		int rowSize=6;
		Map map = new HashMap();
		map.put("start",(page-1)*rowSize+1);
		map.put("end",page*rowSize);
		map.put("tabVal",tabVal);
		List<CarVO> list=service.carListData(map);
		int totalpage=service.carTotalPage(tabVal);
		
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		// Vue로 전송
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}
	
	@GetMapping("car/list_search_vue.do")
	public Map car_list_search(int page,
				String pudate,String putime,
				String rdate,String rtime) {
		
		int rowSize=9;
		Map map = new HashMap();
		map.put("start",(page-1)*rowSize+1);
		map.put("end",page*rowSize);
		List<CarVO> list=service.carSearchListData(map);
		int totalpage=service.carSearchTotalPage();
		
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		// Vue로 전송
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("test", "test");
		return map;
	}
}
