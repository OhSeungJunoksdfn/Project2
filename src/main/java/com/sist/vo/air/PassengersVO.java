package com.sist.vo.air;

import java.util.Date;

import lombok.Data;

/*
 *  PASSENGER_ID    NOT NULL VARCHAR2(50) 
	FIRST_NAME      NOT NULL VARCHAR2(50) 
	LAST_NAME       NOT NULL VARCHAR2(50) 
	PASSPORT_NUMBER NOT NULL VARCHAR2(50) 
	BIRTHDAY        NOT NULL DATE         
	SEX             NOT NULL VARCHAR2(50) 
	CREATED_AT               DATE         
	UPDATED_AT               DATE         
	EMAIL           NOT NULL VARCHAR2(50) 
	
	@Data
	public class ReservationsVO {
    private String reservation_id;
    private String passenger_id;
    private int    flight_id;
    private String seat_number;
    private Date   reserve_at;
}
 */
@Data
public class PassengersVO {
	public String passenger_id,first_name,last_name,passport_number,sex,email;
	public Date birthday,created_at,update_at;
}
