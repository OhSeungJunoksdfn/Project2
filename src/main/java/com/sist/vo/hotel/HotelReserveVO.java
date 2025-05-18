package com.sist.vo.hotel;

import lombok.Data;

import java.text.SimpleDateFormat;
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
	private String username, useremail, userphone, status, member_id, hotel_title, room_title, checkintime, checkouttime;
	// Date 포멧 어노테이션
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date checkin, checkout, booking_date;
	
	private String checkinStr, checkoutStr, booking_dateStr;
	
	public String getCheckinStr() {
        if (checkin == null) return "";
        return new SimpleDateFormat("yyyy-MM-dd").format(checkin);
    }
	
	public String getCheckoutStr() {
        if (checkout == null) return "";
        return new SimpleDateFormat("yyyy-MM-dd").format(checkout);
    }

    public String getBookingDateStr() {
        if (booking_date == null) return "";
        return new SimpleDateFormat("yyyy-MM-dd").format(booking_date);
    }
}
