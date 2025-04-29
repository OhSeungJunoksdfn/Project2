package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HotelController {
	@GetMapping("hotel/hotel_list.do")
	public String hotel_list(Model model)
	{
		model.addAttribute("main_jsp", "../hotel/hotel_list.jsp");
		return "main/main";
	}
}
