package com.sist.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.service.CarService;
import com.sist.service.MemberService;
import com.sist.vo.MemberVO;
import com.sist.vo.car.CarReserveVO;
import com.sist.vo.car.CarVO;

@Controller
public class CarController {
	@Autowired
	CarService service;
	
	@Autowired
	MemberService mService;
	
	@GetMapping("car/car_list.do")
	public String car_list(Model model)
	{
		model.addAttribute("main_jsp","../car/car_list.jsp");
		return "main/main";
	}
	
	@GetMapping("car/car_search_list.do")
	public String car_search_list(Model model,
			String pudate, String putime,String rdate, String rtime,HttpSession session)
	{
		String member_id = (String)session.getAttribute("id");
		if (member_id == null) {
	        return "redirect:../member/login.do"; // 로그인 안 된 경우 로그인 페이지로 이동
	    }
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
		System.out.println("carnameeeeeee"+vo.getBranch().getBranch_name());
		System.out.println("carvoooo"+vo.getBranch().getNo());
		System.out.println("carvoooo"+vo.getName());
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
	
	@PostMapping("car/car_reserve.do")
	public String car_reserve(Model model,String no,
			String pudate, String putime,String rdate, String rtime,String ins,int price,HttpSession session)
	{
		System.out.println(rdate);

		CarVO vo=service.carDetailData(Integer.parseInt(no));
		System.out.println("idddd"+session.getAttribute("id"));
		MemberVO mvo=mService.memberSessionData((String)session.getAttribute("id"));
		model.addAttribute("vo", vo);
		model.addAttribute("pudate",pudate);
		model.addAttribute("putime",putime);
		model.addAttribute("rdate",rdate);
		model.addAttribute("rtime",rtime);
		model.addAttribute("ins",ins);
		model.addAttribute("price",price);
		model.addAttribute("main_jsp","../car/car_reserve.jsp");
		System.out.println(mvo.getEmail());
		model.addAttribute("mvo",mvo);
		return "main/main";
	}
	
	@PostMapping("car/car_reserve_ok.do")
	public String car_reserve_ok(Model model,int reservation_no)
	{
		
		System.out.println(reservation_no);
		model.addAttribute("no",reservation_no);
		model.addAttribute("main_jsp","../car/car_reserve_ok.jsp");
		return "main/main";
	}
	
	@PostMapping("car/car_reserve_detail.do")
	public String car_reserve_detail(Model model,int reservation_no)
	{
		
		System.out.println(reservation_no);
		
		CarReserveVO crvo = service.reserveDetailData(reservation_no);
		MemberVO mvo=mService.memberSessionData(crvo.getMember_id());
		CarVO cvo = service.carDetailData(crvo.getCar_no());
		
		model.addAttribute("crvo",crvo);
		model.addAttribute("mvo",mvo);
		model.addAttribute("cvo",cvo);
		model.addAttribute("main_jsp","../car/reserve_detail.jsp");
		return "main/main";
	}
	
}
