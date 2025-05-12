package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.HotelService;
import com.sist.vo.hotel.HotelImgVO;
import com.sist.vo.hotel.HotelRoomVO;
import com.sist.vo.hotel.HotelVO;

@Controller
@RequestMapping("hotel/")
public class HotelController {
	@Autowired
	private HotelService service;
	
	
	@GetMapping("hotel_list.do")
	public String hotel_list(Model model)
	{
		model.addAttribute("main_jsp", "../hotel/hotel_list.jsp");
		return "main/main";
	}
	@GetMapping("hotel_detail.do")
	public String hotel_detail(int no, Model model)
	{
		HotelVO vo = service.hotelData(no);
		
		Map map = new HashMap();
		map.put("areacode", vo.getAreacode());
		map.put("sigungucode", vo.getSigungucode());
		map.put("no", no);
		
		List<HotelVO> r3List = service.hotelRelatedData(map);
		List<HotelRoomVO> rList = service.hotelDetaiListlData(no);
		List<HotelImgVO> iList = service.hotelImgListData(no);
		for(HotelRoomVO room : rList)
		{
			if(room.getRoom_img() == null)
			{
				room.setRoom_img("http://tong.visitkorea.or.kr/cms/resource/96/2639696_image2_1.jpg,http://tong.visitkorea.or.kr/cms/resource/95/2639695_image2_1.jpg");
			}
		}
		model.addAttribute("vo", vo);
		model.addAttribute("r3List", r3List);
		model.addAttribute("rList", rList);
		model.addAttribute("iList", iList);
		model.addAttribute("main_jsp", "../hotel/hotel_detail.jsp");
		return "main/main";
	}
}
