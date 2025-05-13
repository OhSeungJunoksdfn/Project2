package com.sist.web;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.service.*;
import com.sist.vo.ReplyVO;
import com.sist.vo.board.*;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class BoardRestController {
	
	@Autowired
	private BoardService service;
	
	  @PostMapping("board/uploadImage.do")
	  public Map<String,String> uploadImage(
		      @RequestParam("image") MultipartFile file,
		      HttpServletRequest request) throws IOException {

		    // 1) 웹앱 하위 resources/board 경로의 실제 디스크 위치 가져오기
		  String sess = request.getSession().getId();
		    String tempDir  = request.getSession()
		        .getServletContext()
		        .getRealPath("/resources/temp/" + sess + "/");
		    File dir  = new File(tempDir);
		    if (!dir .exists()) {
		    	dir .mkdirs();
		    }

		    // 2) UUID + 원본 확장자로 저장 파일명 생성
		    String orig = file.getOriginalFilename();
		    String ext  = orig.substring(orig.lastIndexOf('.'));
		    String uuid = UUID.randomUUID().toString().replace("-", "");
		    String saveName = uuid + ext;

		    // 3) 파일 디스크에 저장
		    File dest = new File(dir , saveName);
		    file.transferTo(dest);

		    // 4) 클라이언트에서 img src로 쓸 path 리턴
		    String fileUrl = request.getContextPath() + "/resources/temp/" + sess + "/" + saveName;
		    return Collections.singletonMap("url", fileUrl);
		  }
	  
	  @PostMapping("board/delete.do")
		 public String board_delete(int no,HttpServletRequest request)
		 {
			 
		  try {
			  
			 BoardVO vo = service.boardDetailData(no);
			 String filenames=vo.getFilename();
			 
			 if (filenames != null && !filenames.trim().isEmpty()) {
		            String boardDir = request.getSession()
		                                     .getServletContext()
		                                     .getRealPath("/resources/board/");
		            File dir = new File(boardDir);
		            for (String fname : filenames.split(",")) {
		                File img = new File(dir, fname.trim());
		                if (img.exists()) {
		                    img.delete();
		                }
		            }
		        }
			 service.boardDelete(no);
		  } catch(Exception ex) {
			  System.out.println(ex);
			  return"no";
			  
		  }
			 
			 
			 return "yes";
		 }
	 
	  @PostMapping("board/cancelTempImages.do")
	  public void cancelTempImages(HttpServletRequest request) throws Exception {
		  String sess = request.getSession().getId();
		    String tempDir  = request.getSession()
		        .getServletContext()
		        .getRealPath("/resources/temp/" + sess + "/");
	      FileUtils.deleteDirectory(new File(tempDir));
	  }
	  
	  
	  @GetMapping("boardreply/list.do")
	  public List<ReplyVO> replyList(ReplyVO vo)
	  {
		  List<ReplyVO> list = service.replyListData(vo);
		  
		  return list;
	  }

	  @PostMapping("boardreply/insert.do")
	  public Map replyInsert(ReplyVO vo, HttpSession session)
	  {
		String id = (String) session.getAttribute("id");  
		String name = (String) session.getAttribute("name");  
		vo.setId(id);
		vo.setName(name);
		
		service.replyInsert(vo);
		int replycount=service.boardReplycount(vo);
		List<ReplyVO> list = service.replyListData(vo);
		
		Map map = new HashMap();
		map.put("replycount", replycount);
		map.put("list",list);
		
		return map;
	  }
	  @PostMapping("boardreply/delete.do")
	  public Map replyDelete(int no, ReplyVO vo)
	  {
		  ReplyVO rvo = service.replyInfoData(no);
		  service.replyDelete(rvo);
		  int replycount=service.boardReplycount(vo);
		  List<ReplyVO> list = service.replyListData(vo);
		  Map map = new HashMap();
			map.put("replycount", replycount);
			map.put("list",list);
			
			return map;
		  
	  }
	 

}
