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
	
}
