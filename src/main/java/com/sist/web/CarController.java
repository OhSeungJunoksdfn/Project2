package com.sist.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.CarService;
import com.sist.vo.car.CarVO;

@Controller
public class CarController {
	@Autowired
	CarService service;
	
	@GetMapping("car/car_list.do")
	public String car_list(Model model)
	{
		model.addAttribute("main_jsp","../car/car_list.jsp");
		return "main/main";
	}
	
	@GetMapping("car/car_search_list.do")
	public String car_search_list(Model model,
			String pudate, String putime,String rdate, String rtime)
	{
		model.addAttribute("pudate",pudate);
		model.addAttribute("putime",putime);
		model.addAttribute("rdate",rdate);
		model.addAttribute("rtime",rtime);
		model.addAttribute("main_jsp","../car/car_search_list.jsp");
		return "main/main";
	}
	
	@GetMapping("car/car_detail.do")
	public String car_detail(Model model,int no,
			String pudate, String putime,String rdate, String rtime)
	{
		System.out.println(pudate);
		
		CarVO vo=service.carDetailData(no);
		// 배열 => List로 변경 asList
		//String id=(String)session.getAttribute("userid");
		//model.addAttribute("sessionId", id);
		model.addAttribute("vo", vo);
		model.addAttribute("pudate",pudate);
		model.addAttribute("putime",putime);
		model.addAttribute("rdate",rdate);
		model.addAttribute("rtime",rtime);
		model.addAttribute("main_jsp","../car/car_detail.jsp");
		return "main/main";
	}
	
	@GetMapping("car/car_reserve.do")
	public String car_reserve(Model model,String no,
			String pudate, String putime,String rdate, String rtime,String ins)
	{
		System.out.println(pudate);
		
		CarVO vo=service.carDetailData(Integer.parseInt(no));
		// 배열 => List로 변경 asList
		//String id=(String)session.getAttribute("userid");
		//model.addAttribute("sessionId", id);
		model.addAttribute("vo", vo);
		model.addAttribute("pudate",pudate);
		model.addAttribute("putime",putime);
		model.addAttribute("rdate",rdate);
		model.addAttribute("rtime",rtime);
		model.addAttribute("main_jsp","../car/car_reserve.jsp");
		return "main/main";
	}
	
	@GetMapping("car/car_reserve_ok.do")
	public String car_reserve_ok(Model model)
	{
		
		model.addAttribute("main_jsp","../car/car_reserve_ok.jsp");
		return "main/main";
	}
	
}
