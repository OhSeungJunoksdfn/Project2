package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.AirMapper;
import com.sist.vo.air.*;

@Repository
public class AirDAO {
    @Autowired
    private AirMapper mapper;

    /** 페이징된 리스트 조회 */
    public List<FlightInfoVO> flightListData(int start, int end) {
        return mapper.flightListData(start, end);
    }

    /** 전체 페이지 수 조회 */
    public int flightTotalPage() {
        return mapper.flightTotalPage();
    }

    /** 항공편 상세 조회 */
    public FlightInfoVO flightDetailData(int id) {
        return mapper.flightDetailData(id);
    }
}
