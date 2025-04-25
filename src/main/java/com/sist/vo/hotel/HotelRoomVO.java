package com.sist.vo.hotel;
/*
NO           NOT NULL NUMBER         
HOTEL_NO     NOT NULL NUMBER         
ROOM_CODE             VARCHAR2(300)  
TITLE        NOT NULL VARCHAR2(400)  
ROOM_SIZE             NUMBER         
ROOM_COUNT            NUMBER         
PERSON                NUMBER         
PERSON_MAX            NUMBER         
PRICE                 NUMBER         
ROOM_IMG              VARCHAR2(400)  
ROOM_NAME             VARCHAR2(2000) 
BATH1                 CHAR(1)        
BATH2                 CHAR(1)        
AIRCONDITION          CHAR(1)        
TV                    CHAR(1)        
PC                    CHAR(1)        
CABLE                 CHAR(1)        
INTERNET              CHAR(1)        
FRIDGE                CHAR(1)        
TOILETRIES            CHAR(1)        
SOFA                  CHAR(1)        
COOK                  CHAR(1)        
TABLES                CHAR(1)        
HAIRDRYER             CHAR(1)    
 */
import lombok.Data;

@Data
public class HotelRoomVO {
	private int no, hotel_no, roome_size, room_count, person, person_max, price, bath1, bath2, aircondition,
			tv, pc, cable, internet, fridge, toiletries, sofa, cook, tables, hairdryer;
	private String room_code, title, room_img, room_name;
}
