package com.sist.web;
import java.util.*; 
import com.sist.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.vo.admin.*;
@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
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
	public String adminNotice(Model model,String page)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=5;
		Map map = new HashMap();
		map.put("start", (curpage*rowSize)-(rowSize-1));
		map.put("end", rowSize*curpage);
		List<NoticeVO> list= service.noticeListData(map);
		int totalpage= service.noticeTotalPage();
		
		model.addAttribute("curpage",curpage);
		model.addAttribute("list",list);
		model.addAttribute("totalpage",totalpage);
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
	
	@GetMapping("admin/notice_insert.do")
	public String adminNoticeInsert(Model model)
	{
		model.addAttribute("admin_jsp","../admin/notice_insert.jsp");
		return "admin/main";
	}
	@PostMapping("admin/notice_insert_ok.do")
	public String noticeInsertOk(NoticeVO vo)
	{
		try {
			
			service.noticeInsert(vo);
		} catch(Exception e)
		{
			System.out.println(e);
			return "redirect:../admin/notice_insert.do";
		}
		return"redirect:../admin/notice.do";
	}
	@GetMapping("admin/notice_update.do")
	public String adminNoticeUpdate(int no, Model model)
	{
		NoticeVO vo = service.noticeDetailData(no);
		model.addAttribute("vo",vo);
		model.addAttribute("admin_jsp","../admin/notice_update.jsp");
		return "admin/main";
	}
	
	
}
