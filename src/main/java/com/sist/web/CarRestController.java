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
	public Map car_list(int page) {
		
		int rowSize=6;
		List<CarVO> list=service.carListData((page-1)*rowSize+1, page*rowSize);
		int totalpage=service.carTotalPage();
		
		final int BLOCK=10;
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		// Vue로 전송
		Map map=new HashMap();
		map.put("list", list);
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}
}
