package com.sist.vo.hotel;

import lombok.Data;
import java.util.*;

import org.springframework.format.annotation.DateTimeFormat;
/*
NO   NOT NULL NUMBER        
ROOM_NO               NUMBER        
USERNAME              VARCHAR2(100) 
GUESTNAME             VARCHAR2(100) 
GUESTPHONE            VARCHAR2(20)  
CHECKIN      NOT NULL DATE          
CHECKOUT     NOT NULL DATE          
STAY_DAYS    NOT NULL NUMBER        
TOTAL_PRICE  NOT NULL NUMBER        
BOOKING_DATE NOT NULL DATE          
STATUS       NOT NULL VARCHAR2(50)  
 */
@Data
public class HotelReserveVO {
	private int no, room_no, stay_days, total_price, hotel_no, person;
	private String username, useremail, userphone, status, member_id;
	// Date 포멧 어노테이션
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date checkin, checkout, booking_date;
}
