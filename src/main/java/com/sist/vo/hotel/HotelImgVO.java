package com.sist.vo.hotel;

import lombok.Data;

/*
NO         NOT NULL NUMBER        
HOTEL_NO            NUMBER        
SERIAL_NUM NOT NULL VARCHAR2(300) 
IMG_OG              VARCHAR2(500) 
IMG_NAME            VARCHAR2(500) 
 */
@Data
public class HotelImgVO {
	private int no, hotel_no;
	private String img_og, img_name;
}
