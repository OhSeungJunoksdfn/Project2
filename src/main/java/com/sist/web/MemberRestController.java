package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	
}
