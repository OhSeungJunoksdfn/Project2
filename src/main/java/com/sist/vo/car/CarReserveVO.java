package com.sist.vo.car;

import java.util.Date;

import lombok.Data;


/*
 * NO          NOT NULL NUMBER         
CAR_NO               NUMBER         
PICKUP_DATE          DATE           
RETURN_DATE          DATE           
STATUS               VARCHAR2(20)   
INS_PRICE            NUMBER         
INS_DESC             VARCHAR2(1000) 
MEMBER_ID            VARCHAR2(30)   

 */

@Data
public class CarReserveVO {
	int no,car_no,ins,price;
	Date pickup_date,return_date;
	String status,member_id;
}
