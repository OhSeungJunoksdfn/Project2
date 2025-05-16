package com.sist.web;
import java.util.*; 
import com.sist.service.*;
import com.sist.vo.admin.*;
import com.sist.vo.board.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminRestController {
	@Autowired
	private AdminService service;
	@Autowired
	private BoardService bservice;
	
	String[] boardtype= {"","*","공지사항","자유글","호텔","관광지","맛집","렌트"};
	@GetMapping("notice/list.do")
	public Map NoticeList(int page)
	{
		int rowSize=5;
		Map map = new HashMap();
		map.put("start", (page*rowSize)-(rowSize-1));
		map.put("end", rowSize*page);
		List<NoticeVO> list= service.noticeListData(map);
		int totalpage= service.noticeTotalPage();
		
		map = new HashMap();
		map.put("list", list);
		map.put("totalpage", totalpage);
		
		return map;
	}
	
	@GetMapping("admin/notice_detail_vue.do")
	public NoticeVO noticeDetailVue(int no)
	{
		NoticeVO vo = service.noticeDetailData(no);
		return vo;
	}
	
	@PostMapping("admin/notice_delete.do")
	public void noticeDelete(int no)
	{
		service.noticeDelete(no);
	}
	
	@PostMapping("admin/notice_update_ok.do")
	public void noticeUpdate(NoticeVO vo)
	{
		service.noticeUpdate(vo);
	}
	
	@GetMapping("admin/board_list_vue.do")
	public Map adminBoardList(String type, int page,String fd, String ss )
	{
		System.out.println(type);
		System.out.println(fd);
		System.out.println(ss);
		System.out.println(page);
		
		if(fd==null)
			fd="subject";
		if(ss.equals(""))
			ss="*";
		System.out.println(ss);
		int rowSize= 10;
		Map map = new HashMap();
		map.put("start",(rowSize*page)-(rowSize-1));
		map.put("end",(rowSize*page));
		map.put("type", boardtype[Integer.parseInt(type)]);
		map.put("fd", fd);
		map.put("ss", ss);
		List<BoardVO> list = bservice.boardListData(map);
		int totalpage = bservice.boardTotalPage(map);
		
		final int BLOCK = 10;
		int startPage= ((page-1)/BLOCK*BLOCK)+1;
		int endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		System.out.println("list:"+list);
		map = new HashMap();
		map.put("list", list);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}
	
}
