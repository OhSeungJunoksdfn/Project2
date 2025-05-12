package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import com.sist.vo.*;


@Controller
public class CustomerController {
	
	
	@GetMapping("customer/main.do")
	public String customer_main(Model model)
	{
		model.addAttribute("support_jsp","../support/notice.jsp");
		model.addAttribute("main_jsp","../support/main.jsp");
		return "main/main";
	}
	
	@GetMapping("customer/list.do")
	public String customer_list(Model model)
	{
		model.addAttribute("support_jsp","../support/list.jsp");
		model.addAttribute("main_jsp","../support/main.jsp");
		return "main/main";
	}
	
	@GetMapping("customer/insert.do")
	public String customer_insert(Model model)
	{
		model.addAttribute("support_jsp","../support/insert.jsp");
		model.addAttribute("main_jsp","../support/main.jsp");
		return "main/main";
	}
	@GetMapping("customer/detail.do")
	public String customer_detail(int no,Model model)
	{
		model.addAttribute("no",no);
		model.addAttribute("support_jsp","../support/detail.jsp");
		model.addAttribute("main_jsp","../support/main.jsp");
		return "main/main";
	}
}
