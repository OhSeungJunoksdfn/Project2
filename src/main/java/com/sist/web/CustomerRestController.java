package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.service.*;
import com.sist.vo.*;
import com.sist.vo.board.QnaVO;


@RestController
public class CustomerRestController {
	@Autowired
	private CustomerService service;
	
	@GetMapping("customer/list_vue.do")
	public Map customerListVue(int page, HttpSession session)
	{
		
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		int rowSize=10;
		map.put("start", (rowSize*page)-(rowSize-1));
		map.put("end",rowSize*page);
		map.put("id", id);
		List<QnaVO> list = service.qnaboardListData(map);
		int totalpage=service.qnaboardTotalPage(map);
		
		final int BLOCK = 10;
		int startPage= ((page-1)/BLOCK*BLOCK)+1;
		int endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		map = new HashMap();
		map.put("list", list);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}
	
	@GetMapping("customer/detail_vue.do")
	public QnaVO customerDetailVue(int no)
	{
		QnaVO vo = service.qnaboardDetailData(no);
		
		return vo;
	}
	
}
