package com.sist.vo.air;

import lombok.Data;
/*
이름         널?       유형           
---------- -------- ------------ 
FLIGHT_ID  NOT NULL NUMBER(38)   
SEAT_ID    NOT NULL NUMBER(38)   
STATUS              VARCHAR2(10) 
BOOKING_ID          NUMBER(38)   
*/

@Data
public class FlightSeatVO {
    private int flightId;      // flight_id 컬럼에 매핑
    private int seatId;        
    private String status;     // 좌석 상태 (예: AVAILABLE, BOOKED)
    private Integer bookingId; 
    private String passengerType; 
    // 필요하면 조인 결과를 담을 수 있는 객체 참조
    private SeatVO seat;       // SeatVO 객체를 중첩해서 조회할 경우
}
