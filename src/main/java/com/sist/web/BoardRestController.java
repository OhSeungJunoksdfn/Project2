package com.sist.web;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.sist.service.*;
import com.sist.vo.board.*;

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
		    String uploadDirPath = request.getSession()
		        .getServletContext()
		        .getRealPath("/resources/board/");
		    File uploadDir = new File(uploadDirPath);
		    if (!uploadDir.exists()) {
		      uploadDir.mkdirs();
		    }

		    // 2) UUID + 원본 확장자로 저장 파일명 생성
		    String orig = file.getOriginalFilename();
		    String ext  = orig.substring(orig.lastIndexOf('.'));
		    String uuid = UUID.randomUUID().toString().replace("-", "");
		    String saveName = uuid + ext;

		    // 3) 파일 디스크에 저장
		    File dest = new File(uploadDir, saveName);
		    file.transferTo(dest);

		    // 4) 클라이언트에서 img src로 쓸 path 리턴
		    String fileUrl = request.getContextPath() + "/resources/board/" + saveName;
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
	 
	 
	 

}
