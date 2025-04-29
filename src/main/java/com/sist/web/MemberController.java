package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.MemberVO;
import com.sist.service.*;
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@RequestMapping("member/login.do")
	public String member_login(Model model)
	{
		model.addAttribute("member_jsp","../member/login.jsp");
		return "member/main";
	}
	@GetMapping("member/register.do")
	public String member_register(Model model)
	{
		model.addAttribute("member_jsp","../member/register.jsp");
		return "member/main";
	}
	@GetMapping("member/registerErr.do")
	public String member_registerErr()
	{
		return("member/registerErr");
	}
	@PostMapping("member/register_ok.do")
	public String member_register_ok(MemberVO vo)
	{
		System.out.println(vo);
		vo.setPhone(vo.getPhonePrefix()+"-"+vo.getPhone().substring(0,4)+"-"+vo.getPhone().substring(4,8));
		vo.setEmail(vo.getEmail()+vo.getEmailPrefix());
		   // 비밀번호 암호화 
		   String enPwd=encoder.encode(vo.getPwd());
		   vo.setPwd(enPwd);
		   vo.setName(vo.getFname()+vo.getSname());
		   try {
			   service.memberInsert(vo);			   			
		} catch (Exception e) {
				return "redirect:../member/registerErr.do";
		}
		   
		return "redirect:../main/main.do";
	}
}
