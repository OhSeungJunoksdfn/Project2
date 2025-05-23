package com.sist.web;
import java.io.*;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.regex.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.aop.LoginCheck;
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
		if(ss==""||ss==null)
			ss="*";
		int rowSize= 10;
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
		
		
		model.addAttribute("fd",fd);
		if(ss.equals("*"))
			ss="";
		model.addAttribute("ss",ss);
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
	@LoginCheck
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
	
	@PostMapping("board/insert_ok.do")
	public String insert(BoardVO vo, HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    String id   = (String) session.getAttribute("id");
	    String name = (String) session.getAttribute("name");
	    
	    String sess    = session.getId();
	    String tempDir = request.getSession()
	                      .getServletContext()
	                      .getRealPath("/resources/temp/" + sess + "/");
	    File tempFolder = new File(tempDir);
	    
	    String boardDir = request.getSession()
	                       .getServletContext()
	                       .getRealPath("/resources/board/");
	    File boardFolder = new File(boardDir);
	    if (!boardFolder.exists()) boardFolder.mkdirs();
	    
	    Pattern p = Pattern.compile("/resources/temp/" + sess + "/([^\"']+)");
	    Matcher m = p.matcher(vo.getContent());
	    Set<String> used = new HashSet<>();
	    while (m.find()) {
	        used.add(m.group(1));
	    }
	    for (String fname : used) {
	        File src = new File(tempFolder, fname);
	        File dst = new File(boardFolder, fname);
	        if (src.exists()) {
	            Files.move(src.toPath(), dst.toPath(), StandardCopyOption.REPLACE_EXISTING);
	        }
	    }
	    vo.setContent(vo.getContent()
	        .replace("/resources/temp/" + sess + "/", "/resources/board/"));
	    if (tempFolder.exists()) {
	        FileUtils.deleteDirectory(tempFolder);
	    }
	    
	    String uploadPath = boardDir;
	    MultipartFile[] files = vo.getUploadFiles();
	    StringBuilder fnames = new StringBuilder();
	    StringBuilder fsizes = new StringBuilder();
	    int count = 0;
	    if (files != null) {
	      for (MultipartFile mf : files) {
	        if (!mf.isEmpty()) {
	          String origName = mf.getOriginalFilename();
	          String ext = origName.substring(origName.lastIndexOf('.'));
	          String uuid = UUID.randomUUID().toString().replace("-", "");
	          String saveName = uuid + ext;
	          mf.transferTo(new File(uploadPath, saveName));
	          fnames.append(saveName).append(",");
	          fsizes.append(mf.getSize()).append(",");
	          count++;
	        }
	      }
	    }
	    if (count > 0) {
	      fnames.setLength(fnames.length() - 1);
	      fsizes.setLength(fsizes.length() - 1);
	    }
	    
	    vo.setId(id);
	    vo.setName(name);
	    vo.setFilename(fnames.toString());
	    vo.setFilesize(fsizes.toString());
	    vo.setFilecount(count);
	    service.boardInsert(vo);

	    return "redirect:/board/list.do";
	}
	 
	 @GetMapping("board/update.do")
	 @LoginCheck
	 public String board_update(Model model, int no)
	 {
		 BoardVO vo = service.boardDetailData(no);
		 model.addAttribute("vo",vo);
		 model.addAttribute("main_jsp","../board/update.jsp");
		return "main/main";
	 }
	 
	 @PostMapping("/board/update_ok.do")
	 public String update(BoardVO vo, HttpServletRequest req) throws Exception {
	     HttpSession session = req.getSession();
	     String sess = session.getId();
	     ServletContext ctx = session.getServletContext();
	     // Apache Commons IO 의 FileUtils 임포트 필요
	     FileUtils fileUtils = new FileUtils();

	     // 0) 기존 게시글 정보 조회
	     BoardVO old = service.boardDetailData(vo.getNo());
	     String contentOld   = old.getContent();
	     String contentNew   = vo.getContent();
	     String oldFilenames = old.getFilename();   // "a.jpg,b.png"
	     String oldFilesizes = old.getFilesize();   // "12345,67890"
	     int    oldCount     = old.getFilecount();  // 2

	     // 1) 에디터 이미지: board 디렉터리 경로
	     String boardDir = ctx.getRealPath("/resources/board/");
	     // 2) 에디터에서 제거된 이미지 삭제
	     Set<String> oldImgs = extractImages(contentOld, "/resources/board/");
	     Set<String> newImgs = extractImages(contentNew, "/resources/board/");
	     for (String fname : oldImgs) {
	         if (!newImgs.contains(fname)) {
	             File f = new File(boardDir, fname);
	             if (f.exists()) f.delete();
	         }
	     }

	     // 3) 신규 업로드된 임시 이미지 이동
	     String tempDir = ctx.getRealPath("/resources/temp/" + sess + "/");
	     Set<String> tempImgs = extractImages(contentNew, "/resources/temp/" + sess + "/");
	     for (String fname : tempImgs) {
	         File src = new File(tempDir, fname);
	         File dst = new File(boardDir, fname);
	         if (src.exists()) {
	             Files.move(src.toPath(), dst.toPath(), StandardCopyOption.REPLACE_EXISTING);
	         }
	     }

	     // 4) content 내 경로 치환 & 임시 폴더 삭제
	     vo.setContent(contentNew.replace("/resources/temp/" + sess + "/", "/resources/board/"));
	     fileUtils.deleteDirectory(new File(tempDir));

	     // 5) 일반 첨부파일( MultipartFile[] ) 처리
	     //    → uploadPath 가 빠져 있어서 추가합니다.
	     String uploadPath = boardDir;
	     MultipartFile[] files = vo.getUploadFiles();
	     StringBuilder fnames = new StringBuilder();
	     StringBuilder fsizes = new StringBuilder();
	     int count = 0;
	     if (files != null) {
	       for (MultipartFile mf : files) {
	         if (!mf.isEmpty()) {
	           String origName = mf.getOriginalFilename();
	           String ext      = origName.substring(origName.lastIndexOf('.'));
	           String uuid     = UUID.randomUUID().toString().replace("-", "");
	           String saveName = uuid + ext;

	           // 실제 저장
	           mf.transferTo(new File(uploadPath, saveName));

	           fnames.append(saveName).append(",");
	           fsizes.append(mf.getSize()).append(",");
	           count++;
	         }
	       }
	     }

	     // 6) 기존 파일 정보와 병합
	     if (oldFilenames != null && !oldFilenames.trim().isEmpty()) {
	       // 앞에 기존거 붙이고 콤마 추가
	       fnames.insert(0, oldFilenames + ",");
	       fsizes.insert(0, oldFilesizes + ",");
	       count += oldCount;
	     }

	     // 7) 마지막 콤마 제거
	     if (count > 0) {
	       fnames.setLength(fnames.length() - 1);
	       fsizes.setLength(fsizes.length() - 1);
	     }

	     // 8) VO에 설정하고 DB 업데이트
	     vo.setFilename(fnames.toString());
	     vo.setFilesize(fsizes.toString());
	     vo.setFilecount(count);

	     service.boardUpdate(vo);
	     return "redirect:/board/detail.do?no=" + vo.getNo();
	 }

	 // Utility: HTML에서 prefix 경로 이후의 파일명만 뽑아 Set으로 반환
	 private Set<String> extractImages(String html, String prefix) {
	     Set<String> imgs = new HashSet<>();
	     Pattern p = Pattern.compile(prefix + "([^\"']+)");
	     Matcher m = p.matcher(html);
	     while (m.find()) {
	         imgs.add(m.group(1));
	     }
	     return imgs;
	 }

	


}
