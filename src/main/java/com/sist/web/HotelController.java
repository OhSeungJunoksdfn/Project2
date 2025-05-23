package com.sist.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.aop.LoginCheck;
import com.sist.service.HotelService;
import com.sist.vo.admin.NoticeVO;
import com.sist.vo.hotel.HotelImgVO;
import com.sist.vo.hotel.HotelInfoVO;
import com.sist.vo.hotel.HotelRoomVO;
import com.sist.vo.hotel.HotelVO;

@Controller
public class HotelController {
	@Autowired
	private HotelService service;
	
	@GetMapping("hotel/hotel_list.do")
	public String hotel_list(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam(value = "checkin",  required = false) String checkin,
		    @RequestParam(value = "checkout", required = false) String checkout,
		    @RequestParam(value = "person",   defaultValue = "2")  int person)
	{
		if (checkin  != null) session.setAttribute("checkin",  checkin);
	    if (checkout != null) session.setAttribute("checkout", checkout);
	    if (person   != 0) session.setAttribute("person",   person);
		
		model.addAttribute("main_jsp", "../hotel/hotel_list.jsp");
		return "main/main";
	}
	@GetMapping("hotel/hotel_detail.do")
	public String hotel_detail(int no, Model model, HttpSession session, HttpServletResponse res)
	{	
		String id = (String) session.getAttribute("member_id");
		String checkin = (String) session.getAttribute("checkin");
		String checkout = (String) session.getAttribute("checkout");
		Integer person = (Integer) session.getAttribute("person");
		if (person == null) {
		    person = 2; 
		}
		
	    
		HotelVO vo = service.hotelData(no);
		HotelInfoVO hiVo = service.hotelInfoData(no);
		
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
		
		// 사이드바 출력용
	    model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("person", person);
		model.addAttribute("no",no);
		model.addAttribute("vo", vo);
		model.addAttribute("hiVo", hiVo);
		model.addAttribute("r3List", r3List); // 지역 근처 추천 숙소
		model.addAttribute("rList", rList);
		model.addAttribute("iList", iList);
		model.addAttribute("main_jsp", "../hotel/hotel_detail.jsp");
		return "main/main";
	}
	@GetMapping("hotel/hotel_reserve.do")
	public String hotel_reserve(int no, Model model, HttpSession session, HttpServletResponse res) 
			throws ServletException, IOException 
	{
		String member_id = (String)session.getAttribute("id");
		String checkin = (String) session.getAttribute("checkin");
		String checkout = (String) session.getAttribute("checkout");
		Integer person = (Integer) session.getAttribute("person");
		if (person == null) {
		    person = 2; 
		}
		
		if (member_id == null) {
	        return "redirect:../member/login.do"; // 로그인 안 된 경우 로그인 페이지로 이동
	    }
		
		if (checkin == null || checkin.trim().equals("")) {
	        res.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = res.getWriter();
	        out.println("<script>");
	        out.println("alert(\"날짜 선택 후 객실 예약을 진행 해주세요.\");");
	        out.println("location.href='../main/main.do';");
	        out.println("</script>");
	        return null;
	    }
		
		// DATE 값으로 변경 후 N 박으로 계산
		LocalDate checkinDate = LocalDate.parse(checkin);
		LocalDate checkoutDate = LocalDate.parse(checkout);
		int stay_day = (int) ChronoUnit.DAYS.between(checkinDate, checkoutDate);
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("member_id", member_id);
		
		HotelRoomVO vo = service.hotelReserveData(map);
		int price = vo.getPrice();
		int price_total = price * stay_day;
		
		System.out.println(price_total);
		
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("person", person);
		model.addAttribute("stay_day", stay_day);
		model.addAttribute("price_total", price_total);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../hotel/hotel_reserve.jsp");
		return "main/main";
	}
	@GetMapping("hotel/hotel_reserve_ok.do")
	@LoginCheck
	public String hotel_reserve_ok(Model model)
	{
		model.addAttribute("main_jsp", "../hotel/hotel_reserve_ok.jsp");
		return "main/main";
	}
	///////////////////////// 마이페이지
	@GetMapping("mypage/hotel_reserve_delete_ok.do")
	public String hotel_reserve_delete_ok(Model model, HttpSession session)
	{
		return "redirect:../mypage/hotel_reserve_list.do";
	}
	
	///////////////////////// 어드민페이지
	@GetMapping("admin/hotel_reserve_list.do")
	@LoginCheck
	public String amdin_hotel_reserveList(Model model)
	{
		model.addAttribute("admin_jsp","../admin/hotel_reserve_list.jsp");
		return "admin/main";
	}
	@GetMapping("admin/reserve.do")
	public String admin_reserve(Model model)
	{
		model.addAttribute("admin_jsp","../admin/hotel_reserve_list.jsp");
		return "admin/main";
	}
}
