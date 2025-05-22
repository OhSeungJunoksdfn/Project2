package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.aop.LoginCheck;
import com.sist.service.AirService;
import com.sist.service.CarService;
import com.sist.service.HotelService;
import com.sist.service.MemberService;
import com.sist.vo.*;
import com.sist.vo.car.CarReserveVO;
import com.sist.vo.car.CarVO;
import com.sist.vo.hotel.HotelReserveVO;
import com.sist.vo.air.PassengersVO;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	@Autowired
	private HotelService hService;
	
	@Autowired
	private CarService cService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private AirService aService;
	
	@GetMapping("mypage/main.do")
	public String mypage_main(Model model)
	{
		model.addAttribute("mypage_jsp","../mypage/my.jsp");
		model.addAttribute("main_jsp","../mypage/main.jsp");
		return"main/main";
	}
	@GetMapping("mypage/reserv.do")
	public String mypage_reserv(Model model)
	{
		model.addAttribute("mypage_jsp","../mypage/reserv.jsp");
		model.addAttribute("main_jsp","../mypage/main.jsp");
		return"main/main";
	}
	@GetMapping("mypage/coupon.do")
	public String mypage_coupon(Model model)
	{
		model.addAttribute("mypage_jsp","../mypage/coupon.jsp");
		model.addAttribute("main_jsp","../mypage/main.jsp");
		return"main/main";
	}
	@GetMapping("mypage/list.do")
	public String mypage_list(Model model)
	{
		model.addAttribute("mypage_jsp","../mypage/list.jsp");
		model.addAttribute("main_jsp","../mypage/main.jsp");
		return"main/main";
	}
	
	@GetMapping("mypage/hotel_reserve_list.do")
	@LoginCheck
	public String hotel_reserve_list(Model model, HttpSession session)
	{
		String member_id = (String)session.getAttribute("id");
		if (member_id == null) {
	        return "redirect:../member/login.do"; // 로그인 안 된 경우 로그인 페이지로 이동
	    }
		List<HotelReserveVO> list = hService.mypageHotelReserveListData(member_id);
		List<HotelReserveVO> ingList = new ArrayList<>();
		List<HotelReserveVO> confirmedList = new ArrayList<>();
		List<HotelReserveVO> pastList = new ArrayList<>();
		
		// 날짜 초기화
		Date today = new Date();
		
		for(HotelReserveVO vo : list) {
			if("예약 진행 중".equals(vo.getStatus())) {
				ingList.add(vo);
			}
			// 예약 승인 & 체크인 날짜가 오늘 날짜 이후
			else if("예약 확정".equals(vo.getStatus()) && !vo.getCheckout().before(today)) {
				confirmedList.add(vo);
			}
			else if(vo.getCheckout().before(today)) {
				pastList.add(vo);
			}
		}
		model.addAttribute("ingList", ingList);
		model.addAttribute("confirmedList", confirmedList);
		model.addAttribute("pastList", pastList);
		
		model.addAttribute("mypage_jsp", "../mypage/hotel_reserve_list.jsp");
		model.addAttribute("main_jsp", "../mypage/main.jsp");
		return "main/main";
	}
	
	//@CarLoginCheck
	@GetMapping("mypage/car_reserve_list.do")
	@LoginCheck
	public String car_reserve_list(Model model, HttpSession session)
	{
		String member_id = (String)session.getAttribute("id");
		List<CarReserveVO> list = cService.reserveListData(member_id);
		List<CarReserveVO> ingList = new ArrayList<>();
		List<CarReserveVO> confirmedList = new ArrayList<>();
		List<CarReserveVO> pastList = new ArrayList<>();
		
		// 날짜 초기화
		Date today = new Date();
		
		for(CarReserveVO vo : list) {
			if("예약 진행 중".equals(vo.getStatus())) {
				ingList.add(vo);
			}
			
			if("예약 확정".equals(vo.getStatus())) {
				confirmedList.add(vo);
			}
			if(vo.getReturn_date().before(today)) {
				pastList.add(vo);
			}
		}
		model.addAttribute("ingList", ingList);
		model.addAttribute("confirmedList", confirmedList);
		model.addAttribute("pastList", pastList);
		
		model.addAttribute("mypage_jsp", "../mypage/car_reserve_list.jsp");
		model.addAttribute("main_jsp", "../mypage/main.jsp");
		return "main/main";
	}
	
	@GetMapping("mypage/air_reserve_list.do")
	@LoginCheck
	public String air_reserve_list(Model model, HttpSession session)
	{
		String member_id = (String)session.getAttribute("id");
		if (member_id == null) {
	        return "redirect:../member/login.do"; // 로그인 안 된 경우 로그인 페이지로 이동
	    }
		List<PassengersVO> list = aService.mypageAirReserveListData(member_id);
		List<PassengersVO> ingList = new ArrayList<>();
		List<PassengersVO> confirmedList = new ArrayList<>();
		List<PassengersVO> pastList = new ArrayList<>();
		
		// 날짜 초기화
		Date today = new Date();
		
		for(PassengersVO vo : list) {
			if("예약 진행 중".equals(vo.getStatus())) {
				ingList.add(vo);
			}
			// 예약 승인 & 체크인 날짜가 오늘 날짜 이후
			else if("예약 확정".equals(vo.getStatus()) && !vo.getCheckout().before(today)) {
				confirmedList.add(vo);
			}
			else if(vo.getCheckout().before(today)) {
				pastList.add(vo);
			}
		}
		model.addAttribute("ingList", ingList);
		model.addAttribute("confirmedList", confirmedList);
		model.addAttribute("pastList", pastList);
		
		model.addAttribute("mypage_jsp", "../mypage/air_reserve_list.jsp");
		model.addAttribute("main_jsp", "../mypage/main.jsp");
		return "main/main";
	}
	
	
	@GetMapping("mypage/hotel_reserve_detail.do")
	@LoginCheck
	public String hotel_reserve_detail(int no, Model model)
	{
		HotelReserveVO vo = hService.hotelReserveDetailData(no);
		
		model.addAttribute("vo", vo);
		model.addAttribute("mypage_jsp", "../mypage/hotel_reserve_detail.jsp");
		model.addAttribute("main_jsp", "../mypage/main.jsp");
		return "main/main";
	}
	
	@GetMapping("mypage/car_reserve_detail.do")
	@LoginCheck
	public String car_reserve_detail(int no, Model model,HttpSession session)
	{
		CarReserveVO crvo = cService.reserveDetailData(no);
		MemberVO mvo=mService.memberSessionData(crvo.getMember_id());
		CarVO cvo = cService.carDetailData(crvo.getCar_no());
		
		model.addAttribute("crvo",crvo);
		model.addAttribute("mvo",mvo);
		model.addAttribute("cvo",cvo);
		model.addAttribute("mypage_jsp", "../mypage/car_reserve_detail.jsp");
		model.addAttribute("main_jsp", "../mypage/main.jsp");
		return "main/main";
	}
}
