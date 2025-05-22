package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.vo.admin.*;
import com.sist.vo.board.QnaVO;
import com.sist.aop.LoginCheck;
import com.sist.service.*;


@Controller
public class CustomerController {
	@Autowired
	private AdminService service;
	
	@Autowired
	private CustomerService cService;
	
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
	@LoginCheck
	public String customer_list(Model model)
	{
		model.addAttribute("support_jsp","../support/list.jsp");
		model.addAttribute("main_jsp","../support/main.jsp");
		return "main/main";
	}
	
	@GetMapping("customer/insert.do")
	@LoginCheck
	public String customer_insert(Model model)
	{
		model.addAttribute("support_jsp","../support/insert.jsp");
		model.addAttribute("main_jsp","../support/main.jsp");
		return "main/main";
	}
	@GetMapping("customer/detail.do")
	@LoginCheck
	public String customer_detail(int no,Model model)
	{
		model.addAttribute("no",no);
		model.addAttribute("support_jsp","../support/detail.jsp");
		model.addAttribute("main_jsp","../support/main.jsp");
		return "main/main";
	}
	
	@PostMapping("customer/insert_ok.do")
	public String customerInsertOk(QnaVO vo, HttpSession session)
	{
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		vo.setId(id);
		vo.setName(name);
		cService.qnaboardInsert(vo);
		return "redirect:../customer/list.do";
	}
	
	@PostMapping("customer/Delete_ok.do")
	public String customerDeleteOk(int no)
	{
		cService.qnaboardDelete(no);
		return "redirect:../customer/list.do";
	}
}
