package com.sist.web;
import java.text.SimpleDateFormat; 
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.service.*;
import com.sist.vo.MemberVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.admin.*;
import com.sist.vo.board.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		
		if(fd==null)
			fd="subject";
		if(ss.equals(""))
			ss="*";
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
		map = new HashMap();
		map.put("list", list);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}
	
	@GetMapping("admin/board_detail_vue.do")
	public BoardVO adminBoardDetailVue(int no)
	{
		BoardVO vo = bservice.boardDetailData(no);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = formatter.format(vo.getRegdate());
		vo.setDbday(formattedDate);
		
		return vo;
	}
	
	@GetMapping("admin/reply_list_vue.do")
	public Map adminReplyListVue(String type,int page)
	{
		int rowSize= 10;
		Map map = new HashMap();
		map.put("start",(rowSize*page)-(rowSize-1));
		map.put("end",(rowSize*page));
		map.put("type", type);
		List<ReplyVO> list = service.AdminreplyListData(map);
		int totalpage = service.AdminReplyTotalPage(map);
		
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
	
	@PostMapping("admin/reply_delete.do")
	public void adminReplyDelete(ReplyVO vo,HttpSession session)
	{
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		service.adminReplyDelete(vo);
	}
	 @PostMapping("admin/reply_deleteMultiple.do")
	  public void adminReplyDeleteMultiple(@RequestBody List<Integer> nos,HttpSession session) {
		ReplyVO vo = new ReplyVO();
		String id=(String) session.getAttribute("id");
		vo.setId(id);
		for(Integer no : nos) {
			vo.setNo(no);
			service.adminReplyDelete(vo);
		}
	  }
	
	@GetMapping("admin/user_list_vue.do")
	public Map adminUserListVue(int page)
	{
		int rowSize= 10;
		Map map = new HashMap();
		map.put("start",(rowSize*page)-(rowSize-1));
		map.put("end",(rowSize*page));
		List<MemberVO> list = service.userListData(map);
		int count = service.userCount();
		int totalpage= (int) Math.ceil(count/10.0);
		
		final int BLOCK = 10;
		int startPage= ((page-1)/BLOCK*BLOCK)+1;
		int endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		map.put("list", list);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("count", count);
		return map;
	}
	
	@PostMapping("admin/member_Suspended.do")
	public void adminMemberSuspended(String id)
	{
		System.out.println(id);
		service.adminMemberSuspended(id);
	}
	
	
	@PostMapping("admin/member_Activate.do")
	public void adminMemberActivate(String id)
	{
		System.out.println(id);
		service.adminMemberActivate(id);
	}
}
