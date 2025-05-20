package com.sist.web;

import java.util.*;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.HotelService;
import com.sist.vo.hotel.HotelReserveVO;

@Controller
public class PreparedController {
	@Autowired
	private HotelService service;
	
	@GetMapping("admin/hotel_reserve_list.do")
	public String amdin_hotel_reserveList(Model model)
	{
		model.addAttribute("admin_jsp","../admin/hotel_reserve_list.jsp");
		return "admin/main";
	}
	
}