package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class MemberRestController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("member/idCheck_vue.do")
	public String member_idCheck(String id)
	{
		String check="YES";
		int existence = service.memberCheckData(id);
		if(existence==1)
		{
			check="NO";
		}
		return check;
	}
	
	@GetMapping("member/idfind_vue.do")
	public String memberIdFindOk(String email)
	{
		String idData=service.findIdData(email);
		
		return idData;
	}
	
	@GetMapping("member/pwdfind_vue.do")
	public int memberPwdFindVue(MemberVO vo)
	{
		vo.setPhone(vo.getPhonePrefix()+"-"+vo.getPhone().substring(0,4)+"-"+vo.getPhone().substring(4,8));
		int result=service.checkMember(vo);
		
		return result;
	}
	@PostMapping("member/pwdUpdate_vue.do")
	public String memberPwdUpdateVue(MemberVO vo)
	{
		try {
			System.out.println(vo.getId());
			String enPwd = encoder.encode(vo.getPwd());
			vo.setPwd(enPwd);
			service.pwdUpdate(vo);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "n";
		}
		return"y";
	}
}
