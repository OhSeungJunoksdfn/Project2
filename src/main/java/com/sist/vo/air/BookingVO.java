package com.sist.vo.air;

import com.google.protobuf.Timestamp;

import lombok.Data;

@Data
public class BookingVO {
	    private int bookingId ,flightId,adults,children;   /* 예약 고유번호 ,예약된 항공편 ID, 성인 인원, 소아인원*/
	    private Timestamp createdAt; // 예약 생성 시각
	}

