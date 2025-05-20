package com.sist.vo.board;
/*
NO	NUMBER
ID	VARCHAR2(100 BYTE)
NAME	VARCHAR2(51 BYTE)
SUBJECT	VARCHAR2(2000 BYTE)
CONTENT	CLOB
REGDATE	DATE
HIT	NUMBER
FILENAME	VARCHAR2(2000 BYTE)
FILESIZE	VARCHAR2(1000 BYTE)
FILECOUNT	NUMBER
ANSWER	CLOB
ANSWER_DATE	DATE
ISOK	CHAR(1 BYTE)
 */
import java.util.*;

import lombok.Data;

@Data
public class QnaVO {
	int no;
	String id,name,subject,content,dbday,answer,andbday,type,packaged,isok;
	Date regdate,anser_date;
}
