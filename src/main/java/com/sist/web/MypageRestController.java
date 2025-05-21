package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.*;
import com.sist.vo.*;
import com.sist.vo.board.BoardVO;
import com.sist.vo.board.QnaVO;
@RestController
public class MypageRestController {
	@Autowired
	private MemberService service;
	
	@GetMapping("mypage/my_vue.do")
	public MemberVO mypageMyVue(HttpSession session)
	{
		String id=(String) session.getAttribute("id");
		
		MemberVO vo = service.memberDetailData(id);
		
		return vo;
	}
	@GetMapping("mypage/list_vue.do")
	public Map mypageListVue(int page,HttpSession session)
	{
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		int rowSize=10;
		map.put("start", (rowSize*page)-(rowSize-1));
		map.put("end",rowSize*page);
		map.put("id", id);
		List<BoardVO> list = service.myBoardListData(map);
		int totalpage=service.myBoardTotalPage(map);
		
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
}
