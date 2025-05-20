package com.sist.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.HotelService;
import com.sist.vo.hotel.HotelReserveVO;

@Controller
public class PreparedController {
	@Autowired
	private HotelService service;
	
//	@GetMapping("mypage/hotel_reserve_list.do")
//	public String hotel_reserve_list(Model model, HttpSession session)
//	{
//		String member_id = (String)session.getAttribute("id");
//		if (member_id == null) {
//	        return "redirect:../member/login.do"; // 로그인 안 된 경우 로그인 페이지로 이동
//	    }
//		List<HotelReserveVO> list = service.hotelReserveListData(member_id);
//		List<HotelReserveVO> ingList = new ArrayList<>();
//		List<HotelReserveVO> confirmedList = new ArrayList<>();
//		List<HotelReserveVO> pastList = new ArrayList<>();
//		
//		// 날짜 초기화
//		Date today = new Date();
//		
//		for(HotelReserveVO vo : list) {
//			if("예약 진행 중".equals(vo.getStatus())) {
//				ingList.add(vo);
//			}
//			// 예약 승인 & 체크인 날짜가 오늘 날짜 이후
//			if("예약 확정".equals(vo.getStatus())) {
//				confirmedList.add(vo);
//			}
//			if(vo.getCheckout().before(today)) {
//				pastList.add(vo);
//			}
//		}
//		model.addAttribute("ingList", ingList);
//		model.addAttribute("confirmedList", confirmedList);
//		model.addAttribute("pastList", pastList);
//		
//		model.addAttribute("mypage_jsp", "../mypage/hotel_reserve_list.jsp");
//		model.addAttribute("main_jsp", "../mypage/main.jsp");
//		return "main/main";
//	}
//	@GetMapping("mypage/hotel_reserve_detail.do")
//	public String hotel_reserve_detail(int no, Model model)
//	{
//		HotelReserveVO vo = service.hotelReserveDetailData(no);
//		
//		model.addAttribute("vo", vo);
//		model.addAttribute("mypage_jsp", "../mypage/hotel_reserve_detail.jsp");
//		model.addAttribute("main_jsp", "../mypage/main.jsp");
//		return "main/main";
//	}
//	@RequestMapping("mypage/hotel_reserve_update.do")
//	public String hotel_reserve_update(int no, Model model)
//	{
//		model.addAttribute("mypage_jsp", "../mypage/hotel_reserve_detail.jsp");
//		model.addAttribute("main_jsp", "../mypage/main.jsp");
//		return "main/main";
//	}
//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("admin/hotel_reserve_list.do")
	public String amdin_hotel_reserveList(int no, Model model)
	{
		List<HotelReserveVO> list = service.adminHotelListData(no);
		model.addAttribute("list", list);
		model.addAttribute("admin_jsp","../admin/hotel_reserve_list.jsp");
		return "admin/main";
	}
	
}
