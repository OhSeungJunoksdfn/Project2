package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.AirService;
import com.sist.vo.air.FlightInfoVO;

@RestController
@RequestMapping("air/")
public class AirRestController {
   @Autowired
   private AirService service;
   
   @GetMapping("list_vue.do")
   public Map food_list(int page)
   {
	   int rowSize=12;
	   List<FlightInfoVO> list=
		 service.flightListData((page-1)*rowSize, page*rowSize);
	   int totalpage=service.flightTotalPage();
	   
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
