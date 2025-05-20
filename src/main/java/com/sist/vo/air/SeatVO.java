package com.sist.vo.air;

import lombok.Data;

@Data
public class SeatVO {
    private int seatId;       
    private String rowLabel;
    private int colNum;
    private String seatClass;
}

