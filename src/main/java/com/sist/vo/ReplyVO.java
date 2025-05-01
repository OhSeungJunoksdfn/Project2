package com.sist.vo;

import lombok.Data;
import java.util.*;
/*
NO	NUMBER
BNO	NUMBER
ID	VARCHAR2(30 BYTE)
NAME	VARCHAR2(51 BYTE)
MSG	CLOB
REGDATE	DATE
GROUP_ID	NUMBER
GROUP_STEP	NUMBER
GROUP_TAB	NUMBER
ROOT	NUMBER
DEPTH	NUMBER
TYPE	VARCHAR2(20 BYTE)
 */
@Data
public class ReplyVO {
	private int no,bno,group_id,group_step,group_tab,root,depth;
	private String id,name,msg,type;
	private Date regdate;
}
