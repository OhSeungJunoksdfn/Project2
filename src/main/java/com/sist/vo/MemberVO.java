package com.sist.vo;

import lombok.Data;
import java.util.*;
/*
USERNAME	VARCHAR2(20 BYTE)
NAME	VARCHAR2(51 BYTE)
PASSWORD	VARCHAR2(100 BYTE)
ENABLE	NUMBER(1,0)
SEX	CHAR(6 BYTE)
BIRTHDAY	VARCHAR2(20 BYTE)
EMAIL	VARCHAR2(100 BYTE)
POST	VARCHAR2(10 BYTE)
ADDR1	VARCHAR2(500 BYTE)
ADDR2	VARCHAR2(100 BYTE)
PHONE	VARCHAR2(20 BYTE)
CONTENT	CLOB
REGDATE	DATE
MODIFYDATE	DATE
LASTLOGIN	DATE
POINT	NUMBER
 */
@Data
public class MemberVO {
	private String id,fname,sname,pwd,sex,birthday,email,post,addr1,addr2,phone,content,name,check_vue,phonePrefix,check_id,emailPrefix;
	private int enable,point;
	private Date regdate,modifydate,lastlogin;
}
