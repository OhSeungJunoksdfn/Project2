package com.sist.web;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.service.*;
import com.sist.vo.board.*;

@Controller
public class BoardController {
	
	String[] boardtype= {"","*","공지사항","자유글","호텔","관광지","맛집","렌트"};
	@Autowired
	private BoardService service;
	@GetMapping("board/list.do")
	public String board_list(String page,String type,String fd, String ss,Model model )
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		if(type==null)
			type="1";
		if(fd==null)
			fd="subject";
		if(ss==null)
			ss="*";
		int rowSize= 15;
		Map map = new HashMap();
		map.put("start",(rowSize*curpage)-(rowSize-1));
		map.put("end",(rowSize*curpage));
		map.put("type", boardtype[Integer.parseInt(type)]);
		map.put("fd", fd);
		map.put("ss", ss);
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
		model.addAttribute("type",type);
		model.addAttribute("main_jsp","../board/list.jsp");
		return "main/main";
	}
	
	@GetMapping("board/insert.do")
	public String board_insert(Model model)
	{
		model.addAttribute("main_jsp","../board/insert.jsp");
		return "main/main";
	}

	@GetMapping("board/detail.do")
	public String board_detail(Model model,int no)
	{
		BoardVO vo = service.boardDetailData(no);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = formatter.format(vo.getRegdate());
		vo.setDbday(formattedDate);
		int maxNo = service.boardMax();
		int minNo=service.boardMin();
		
		model.addAttribute("maxNo",maxNo);
		model.addAttribute("minNo",minNo);
		model.addAttribute("vo",vo);
		model.addAttribute("main_jsp","../board/detail.jsp");
		return "main/main";
	}
}
