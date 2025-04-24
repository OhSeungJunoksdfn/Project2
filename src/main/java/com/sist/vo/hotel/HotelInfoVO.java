package com.sist.vo.hotel;

import lombok.Data;
/*
HOTEL_NO        NOT NULL NUMBER         
CONTENT_ID      NOT NULL NUMBER         
CONTENT_TYPE    NOT NULL NUMBER         
ROOMCOUNT                VARCHAR2(200)  
ROOMTYPE                 VARCHAR2(500)  
CHECKINTIME              VARCHAR2(300)  
CHECKOUTTIME             VARCHAR2(300)  
CHKCOOKING               VARCHAR2(300)  
FOOD_PLACE               VARCHAR2(1000) 
PICKUP                   VARCHAR2(200)  
INFO_TEL                 VARCHAR2(200)  
PARKING                  VARCHAR2(300)  
SCALE                    CLOB           
ROOM_TOTALCOUNT          VARCHAR2(200)  
SEMINAR                  NUMBER(1)      
SPORTS                   NUMBER(1)      
SAUNA                    NUMBER(1)      
BEAUTY                   NUMBER(1)      
BEVERAGE                 NUMBER(1)      
KARAOKE                  NUMBER(1)      
BARBECUE                 NUMBER(1)      
CAMPFIRE                 NUMBER(1)      
BICYCLE                  NUMBER(1)      
FITNESS                  NUMBER(1)      
PUBLICPC                 NUMBER(1)      
PUBLICBATH               NUMBER(1)      
SUBFACILITY              VARCHAR2(1000) 
 */
@Data
public class HotelInfoVO {
	private int hotel_no, content_id, content_type, seminar, sports, sauna, beauty, beverage, karaoke, 
				barbecue, campfire, bicycle, fitness, publicpc, publicbath;
	private String roomcount, roomtype, checkintime, checkouttime, pickup, info_tel, parking, scale;
}
