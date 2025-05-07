package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.AirService;

@Controller
@RequestMapping("air/")
public class AirController {
	@Autowired
	private AirService service;
	
	@GetMapping("air_list.do")
	public String air_list(Model model)
	{
		model.addAttribute("main_jsp","../air/air_list.jsp");
		return "main/main";
	}


}
