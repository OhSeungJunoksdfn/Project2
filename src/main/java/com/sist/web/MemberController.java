package com.sist.web;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	@GetMapping("member/login.do")
	public String member_login(Model model)
	{
		model.addAttribute("member_jsp","../member/login.jsp");
		return "member/main";
	}
}
