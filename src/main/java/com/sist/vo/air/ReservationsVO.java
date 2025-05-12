package com.sist.vo.air;

import java.sql.Timestamp;
import java.util.*;

/*
 * RESERVATION_ID NOT NULL VARCHAR2(20)  
FLIGHT_ID      NOT NULL NUMBER(38)    
BOOKING_NUMBER NOT NULL VARCHAR2(20)  
CUSTOMER_NAME  NOT NULL VARCHAR2(100) 
CUSTOMER_EMAIL NOT NULL VARCHAR2(100) 
BOOKING_DATE   NOT NULL DATE          
PAYMENT_STATUS NOT NULL VARCHAR2(100) 
CREATED_AT              TIMESTAMP(6)  
UPDATED_AT              TIMESTAMP(6)  
 */
public class ReservationsVO {
	private String       reservationId,bookingNumber,customerName,customerEmail,paymentStatus;   // RESERVATION_ID
    private int          flightId;        // FLIGHT_ID
    private Date         bookingDate;
    private Timestamp    createdAt,updatedAt;
}
