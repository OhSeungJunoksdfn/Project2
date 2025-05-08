package com.sist.web;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;
import com.sist.service.*;
import com.sist.vo.board.*;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class BoardRestController {
	
	
	 @PostMapping("board/uploadImage.do")
	    @ResponseBody
	    public Map<String, Object> uploadImage(@RequestParam("file") MultipartFile file) throws IOException {
	        // 실제 파일 저장 경로 (외부 폴더)
	        String uploadDir = "C:/project/images/";
	        File dir = new File(uploadDir);
	        if (!dir.exists()) dir.mkdirs();

	        // 파일명 생성
	        String uuid = UUID.randomUUID().toString();
	        String filename = uuid + "_" + file.getOriginalFilename();
	        File dest = new File(dir, filename);
	        
	        try {
	            // 파일 저장
	            file.transferTo(dest);

	            // URL 인코딩
	            String encodedFilename = URLEncoder.encode(filename, "UTF-8");
	            String fileUrl = "/images/" + encodedFilename;

	            // JSON 응답
	            Map<String, Object> map = new HashMap<>();
	            map.put("url", fileUrl);
	            map.put("filename", filename);
	            map.put("filesize", file.getSize());
	            return map;
	        } catch (IOException e) {
	            // 파일 저장 실패 시 삭제
	            if (dest.exists()) dest.delete();
	            e.printStackTrace();
	            throw e;
	        }
	 }
	 

}
