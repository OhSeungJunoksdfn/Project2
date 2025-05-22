package com.sist.vo.car;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date pickup_date,return_date;
	String status,member_id,car_name,member_name,email,phone;
}
