package com.sist.vo.board;

import lombok.Data;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;
/*
NO	NUMBER
ID	VARCHAR2(30 BYTE)
NAME	VARCHAR2(51 BYTE)
SUBJECT	VARCHAR2(2000 BYTE)
CONTENT	CLOB
REGDATE	DATE
HIT	NUMBER
FILENAME	VARCHAR2(2000 BYTE)
FILESIZE	VARCHAR2(1000 BYTE)
FILECOUNT	NUMBER
REPLYCOUNT	NUMBER
TYPE	VARCHAR2(20 BYTE)
 */
@Data
public class BoardVO {
	private int no,filecount,replycount,hit;
	private String id,name,subject,content,filename,filesize,type,dbday;
	private Date regdate;
	
	private MultipartFile[] uploadFiles;
}
