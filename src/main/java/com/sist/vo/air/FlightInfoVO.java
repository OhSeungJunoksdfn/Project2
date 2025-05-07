package com.sist.vo.air;
import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;
/*
 *  FLIGHT_ID        NOT NULL NUMBER       
	AIRLINE_CODE     NOT NULL VARCHAR2(10) 
	FLIGHT_NUMBER    NOT NULL VARCHAR2(20) 
	DEP_AIRPORT_CODE NOT NULL VARCHAR2(10) 
	ARR_AIRPORT_CODE NOT NULL VARCHAR2(10) 
	DEP_TIME         NOT NULL TIMESTAMP(6) 
	ARR_TIME         NOT NULL TIMESTAMP(6) 
	ECONOMY_CHARGE            NUMBER       
	PRESTIGE_CHARGE           NUMBER       
	REGDATE                   DATE      
 */
@Data
public class FlightInfoVO {
	private int flight_id,economy_charge,prestige_charge;
	private String airline_code,flight_number,dep_airport_code,arr_airport_code,dep_time,arr_time,regdate;;
}
