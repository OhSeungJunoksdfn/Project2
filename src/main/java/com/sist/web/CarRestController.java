package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.CarService;
import com.sist.vo.car.CarVO;
import com.sist.vo.hotel.HotelReserveVO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

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
				String rdate,String rtime,
				String class_checked, String fuel_checked,String name_search_data,
				String loc_search_data) {
		
		int rowSize=9;

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Map map = new HashMap();
		map.put("start",(page-1)*rowSize+1);
		map.put("end",page*rowSize);

		System.out.println("lsd"+loc_search_data);	
		map.put("name_search_data", name_search_data);
		map.put("loc_search_data", loc_search_data.split(","));
		map.put("class_checked", class_checked.split(","));
		map.put("fuel_checked", fuel_checked.split(","));
		String puRegDateStr = pudate + " " + putime;
		String rRegDateStr = rdate + " " + rtime;
		Date puRegDate;
		Date rRegDate;
		try {
			puRegDate = formatter.parse(puRegDateStr);
			rRegDate = formatter.parse(rRegDateStr);
			map.put("pickup_date", puRegDate);
			map.put("return_date", rRegDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		List<CarVO> list=service.carSearchListData(map);
		int totalpage=service.carSearchTotalPage(map);
		
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
	
	@GetMapping("car/car_detail_vue.do")
	public Map car_detail_vue(int page, Model model,
				String pudate,String putime,
				String rdate) {
		
		return new HashMap();
	}
	
	
//	no: 5,//렌터카 pk
//    user_name: "홍길동",
//    user_phone: "010-1111-2222",
//    user_email: "oksdfn@gmail.com", <%-- ${vo.email} --%>
//    pudate:"06/15/2025",
//	putime:"10:00",
//	rdate:"06/16/2025",
//	rtime:"10:00",
//    price_total: 50000,
//    imp_uid: rsp.imp_uid,
//    merchant_uid: rsp.merchant_uid,
//    amount: rsp.paid_amount
	@PostMapping("car/car_reserve_insert_vue.do")
	public int car_reserve_insert_vue(int car_no,
				String pudate, String putime, String rdate, String rtime,
				int price_total, String imp_uid, String merchant_uid,String amount,int ins,
				HttpSession session){
		
		Map map = new HashMap();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String puRegDateStr = pudate + " " + putime;
		String rRegDateStr = rdate + " " + rtime;
		Date puRegDate = null;
		Date rRegDate = null;
		System.out.println("priceeee"+price_total);
		try {
			puRegDate = formatter.parse(puRegDateStr);
			rRegDate = formatter.parse(rRegDateStr);
			System.out.println(puRegDateStr.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println((String)session.getAttribute("id"));
		map.put("car_no", car_no);
		map.put("member_id", (String)session.getAttribute("id"));
		map.put("pickup_date", puRegDate);
		map.put("return_date", rRegDate);
		map.put("status", "예약 진행 중");
		map.put("price", price_total);
		map.put("ins", ins);
		service.insertCarReserve(map);
		
		return (Integer)map.get("no");
	}
	
	@PostMapping("mypage/car_reserve_delete.do")
	public void hotel_reserve_delete(int no)
	{
		service.carReserveDelete(no);
	}
	
//	@GetMapping("admin/car_reserve_list_vue.do")
//	public Map hotel_reserveList_vue(int page)
//	{
//		int rowSize = 10;
//		int start = (page-1) * rowSize+1;
//		int end = page * rowSize;
//		
//		Map map=new HashMap();
//		map.put("start", start);
//		map.put("end", end);
//		
//		int totalpage = service.adminHotelListTotalPage();
//		
//		final int BLOCK = 5;
//		int startPage = ((page - 1) / BLOCK * BLOCK) + 1;
//		int endPage = startPage + BLOCK - 1;
//		if (endPage > totalpage)
//			endPage = totalpage;
//		
//		List<HotelReserveVO> list = service.adminHotelListData(map);
//		
//		map = new HashMap();
//		map.put("list", list);
//		map.put("curpage", page);
//		map.put("startPage", startPage);
//		map.put("endPage", endPage);
//		map.put("totalpage", totalpage);
//		
//		return map;
//	}
}
