package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.*;
import com.sist.vo.board.*;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@GetMapping("board/list.do")
	public String board_list(String page,String type,Model model )
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		if(type==null)
			type="";
		int rowSize= 20;
		Map map = new HashMap();
		map.put("start",(rowSize*curpage)-(rowSize-1));
		map.put("end",(rowSize*curpage));
		map.put("type", type);
		List<BoardVO> list = service.boardListData(map);
		int totalpage = service.boardTotalPage(map);
		
		final int BLOCK = 10;
		int startPage= ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("list",list);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("curpage",curpage);
		model.addAttribute("main_jsp","../board/list.jsp");
		return "main/main";
	}
}
