package com.sist.vo.car;

import lombok.Data;

/*
 * NO           NOT NULL NUMBER        
BRANCH_NAME  NOT NULL VARCHAR2(100) 
LOCATION              VARCHAR2(200) 
BRANCH_PHONE          VARCHAR2(20)  
OPEN_TIME             VARCHAR2(10)  
CLOSE_TIME            VARCHAR2(10)  
 */
@Data
public class CarBranchVO {
	int no;
	String branch_name,location,branch_phone,open_time,close_time;
}
