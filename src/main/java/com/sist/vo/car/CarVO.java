package com.sist.vo.car;

import java.util.Date;

import lombok.Data;

@Data
public class CarVO {
	/*
	 * NO                NOT NULL NUMBER         
NAME                       VARCHAR2(100)  
POSTER                     VARCHAR2(300)  
CAR_CLASS                  VARCHAR2(100)  
SEAT                       NUMBER         
MANUFACTURER               VARCHAR2(50)   
FUEL                       VARCHAR2(50)   
NON_INS_QUAL               VARCHAR2(800)  
NON_INS_PRICE              NUMBER         
NORMAL_INS_QUAL            VARCHAR2(800)  
NORMAL_INS_DESC            VARCHAR2(1000) 
NORMAL_INS_PRICE           NUMBER         
PREMIUM_INS_QUAL           VARCHAR2(800)  
PREMIUM_INS_DESC           VARCHAR2(1000) 
PREMIUM_INS_PRICE          NUMBER         
CAR_YEAR                   NUMBER         
DETAIL_OPTION              VARCHAR2(500)  
	 */
	int no,seat,non_ins_price,normal_ins_price,premium_ins_price,car_year,replycount;
	String name,poster,car_class,manufacturer,fuel,non_ins_qual,normal_ins_qual,normal_ins_desc,
	premium_ins_qual,premium_ins_desc,detail_option,location;

	CarBranchVO branch;
}
