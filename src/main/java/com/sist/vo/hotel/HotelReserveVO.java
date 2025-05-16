package com.sist.vo.hotel;

import lombok.Data;
import java.util.*;
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
	private int no, room_no, stay_days, total_price;
	private String username, guestname, guestphone, status, member_id;
	private Date checkin, checkout, booking_date;
}
