package com.sist.vo.admin;
import java.util.*;
/*
 * 
NO	NUMBER
SUBJECT	VARCHAR2(2000 BYTE)
CONTENT	CLOB
REGDATE	DATE
 */
import lombok.Data;
@Data
public class NoticeVO {
	private int no;
	private String subject,content,dbday;
	private Date regdate;
}
