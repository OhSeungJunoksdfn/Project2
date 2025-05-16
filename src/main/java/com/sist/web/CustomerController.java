package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import com.sist.vo.*;
import com.sist.vo.admin.*;
import com.sist.service.*;


@Controller
public class CustomerController {
	@Autowired
	private AdminService service;
	
	@GetMapping("customer/main.do")
	public String customer_main(Model model)
	{
		model.addAttribute("support_jsp","../support/notice.jsp");
		model.addAttribute("main_jsp","../support/main.jsp");
		return "main/main";
	}
	
	@GetMapping("customer/notice_detail.do")
	public String customerNoticeDetail(int no,Model model)
	{
		NoticeVO vo = service.noticeDetailData(no);
		
		model.addAttribute("vo",vo);
		model.addAttribute("support_jsp","../support/notice_detail.jsp");
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
