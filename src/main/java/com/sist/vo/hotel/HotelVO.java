package com.sist.vo.hotel;
/*
NO           NOT NULL NUMBER        
CONTENT_ID   NOT NULL NUMBER        
CONTENT_TYPE          NUMBER        
TITLE        NOT NULL VARCHAR2(300) 
ADDR         NOT NULL VARCHAR2(300) 
AREACODE              NUMBER        
SIGUNGUCODE           NUMBER        
IMG                   VARCHAR2(500) 
CAT1                  VARCHAR2(200) 
CAT2                  VARCHAR2(200) 
CAT3                  VARCHAR2(200) 
OVERVIEW              CLOB     
 */
import lombok.Data;
import java.util.*;
@Data
public class HotelVO {
	private int no, content_id, content_type, areacode, sigungucode, price, minPrice, maxPrice, person, person_max;
	private String title, addr, img, cat1, cat2, cat3, overview;
	private Date checkin, checkout;
	
	private HotelInfoVO  Info;
	
}
