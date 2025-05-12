package com.sist.web;
import java.io.*; 
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

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
		int next = service.boardNext(no);
		int prev = service.boardPrev(no);
		
		model.addAttribute("maxNo",maxNo);
		model.addAttribute("minNo",minNo);
		model.addAttribute("next", next);
		model.addAttribute("prev",prev);
		model.addAttribute("vo",vo);
		model.addAttribute("main_jsp","../board/detail.jsp");
		return "main/main";
	}
	
	 @PostMapping("board/insert.do")
	  public String insert(BoardVO vo, HttpServletRequest request) throws Exception {
		 HttpSession session = request.getSession();
		 String id = (String) session.getAttribute("id");
		 String name= (String) session.getAttribute("name");
	    // 1) 업로드 폴더(real path) 준비
	    String uploadPath = request.getSession().getServletContext().getRealPath("/resources/board/");
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) uploadDir.mkdirs();

	    // 2) 파일 처리
	    MultipartFile[] files = vo.getUploadFiles();
	    StringBuilder fnames = new StringBuilder();
	    StringBuilder fsizes = new StringBuilder();
	    int count = 0;

	    if (files != null) {
	      for (MultipartFile mf : files) {
	        if (!mf.isEmpty()) {
	          String origName = mf.getOriginalFilename();
	          // 확장자 포함 UUID 파일명
	          String ext = origName.substring(origName.lastIndexOf('.'));
	          String uuid = UUID.randomUUID().toString().replace("-", "");
	          String saveName = uuid + ext;

	          // 실제 저장
	          mf.transferTo(new File(uploadPath, saveName));

	          fnames.append(saveName).append(",");
	          fsizes.append(mf.getSize()).append(",");
	          count++;
	        }
	      }
	    }

	    // 콤마 끝부분 제거
	    if (count > 0) {
	      fnames.setLength(fnames.length() - 1);
	      fsizes.setLength(fsizes.length() - 1);
	    }
	    
	    // VO에 설정
	    vo.setId(id);
	    vo.setName(name);
	    vo.setFilename(fnames.toString());
	    vo.setFilesize(fsizes.toString());
	    vo.setFilecount(count);
	    System.out.println(name);

	    // 3) DB 저장 실행
	    service.boardInsert(vo);

	    return "redirect:/board/list.do";
	  }
	 
	 @GetMapping("board/update.do")
	 public String board_update(Model model, int no)
	 {
		 BoardVO vo = service.boardDetailData(no);
		 model.addAttribute("vo",vo);
		 model.addAttribute("main_jsp","../board/update.jsp");
		return "main/main";
	 }
	 
	
	
}
