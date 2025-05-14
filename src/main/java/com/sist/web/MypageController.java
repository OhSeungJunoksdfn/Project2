package com.sist.web;
import java.util.*;
import com.sist.vo.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	@GetMapping("mypage/main.do")
	public String mypage_main(Model model)
	{
		model.addAttribute("mypage_jsp","../mypage/home.jsp");
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
	@GetMapping("mypage/my.do")
	public String mypage_my(Model model)
	{
		model.addAttribute("mypage_jsp","../mypage/my.jsp");
		model.addAttribute("main_jsp","../mypage/main.jsp");
		return"main/main";
	}
}
