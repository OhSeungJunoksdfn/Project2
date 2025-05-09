package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CarController {
	
	@GetMapping("car/car_list.do")
	public String car_list(Model model)
	{
		model.addAttribute("main_jsp","../car/car_list.jsp");
		return "main/main";
	}
	
	@GetMapping("car/car_calendar.do")
	public String car_calendar(Model model)
	{
		System.out.println("calendarrrrrrrrrrrr");
		
		model.addAttribute("main_jsp","../car/car_calendar.jsp");
		return "car/car_calendar";
	}
}
