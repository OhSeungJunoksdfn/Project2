package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import com.sist.vo.*;

@Controller
public class AdminController {
	@GetMapping("admin/main.do")
	public String adminMain(Model model)
	{
		model.addAttribute("admin_jsp","../admin/home.jsp");
		return "admin/main";
	}
	@GetMapping("admin/qna.do")
	public String adminQna(Model model)
	{
		model.addAttribute("admin_jsp","../admin/qna.jsp");
		return "admin/main";
	}
	@GetMapping("admin/board.do")
	public String adminBoard(Model model)
	{
		model.addAttribute("admin_jsp","../admin/board.jsp");
		return "admin/main";
	}
	@GetMapping("admin/reply.do")
	public String adminReply(Model model)
	{
		model.addAttribute("admin_jsp","../admin/reply.jsp");
		return "admin/main";
	}
	@GetMapping("admin/notice.do")
	public String adminNotice(Model model)
	{
		model.addAttribute("admin_jsp","../admin/notice.jsp");
		return "admin/main";
	}
	@GetMapping("admin/member.do")
	public String adminMember(Model model)
	{
		model.addAttribute("admin_jsp","../admin/member.jsp");
		return "admin/main";
	}
	@GetMapping("admin/statistics.do")
	public String adminStatistics(Model model)
	{
		model.addAttribute("admin_jsp","../admin/statistics.jsp");
		return "admin/main";
	}
	@GetMapping("admin/coupon.do")
	public String adminCoupon(Model model)
	{
		model.addAttribute("admin_jsp","../admin/coupon.jsp");
		return "admin/main";
	}
}
