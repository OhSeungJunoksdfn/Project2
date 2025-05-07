package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.sist.vo.air.*;

@Repository
public interface AirMapper {

	/**
     * 항공편 목록 조회 (페이징 및 날짜 포맷 적용)
     */
    @Select(
      "SELECT flight_id, airline_code, flight_number, dep_airport_code, arr_airport_code, " +
      "TO_CHAR(dep_time, 'YY/MM/DD HH24:MI') AS dep_time, " +
      "TO_CHAR(arr_time, 'YY/MM/DD HH24:MI') AS arr_time, " +
      "economy_charge, prestige_charge, TO_CHAR(regdate, 'YY/MM/DD') AS regdate " +
      "FROM (SELECT f.*, ROWNUM rn " +
      "FROM (SELECT flight_id, airline_code, flight_number, dep_airport_code, arr_airport_code, " +
      "dep_time, arr_time, economy_charge, prestige_charge, regdate " +
      " FROM FLIGHT_INFO " +
      "ORDER BY dep_time ) f " +
      ") " +
      "WHERE rn BETWEEN #{start} AND #{end}"
    )
    List<FlightInfoVO> flightListData(
        @Param("start") int start,
        @Param("end")   int end
    );
    /**
     * 항공편 전체 페이지 수 조회 (페이지당 20건)
     */
    @Select("SELECT CEIL(COUNT(*) / 20.0) FROM FLIGHT_INFO")
    int flightTotalPage();


    /**
     * 항공편 상세 조회 (날짜 포맷 적용)
     */
    @Select(
      "SELECT flight_id, airline_code, flight_number, dep_airport_code, arr_airport_code, " +
      "TO_CHAR(dep_time, 'YY/MM/DD HH24:MI') AS dep_time, " +
      "TO_CHAR(arr_time, 'YY/MM/DD HH24:MI') AS arr_time, " +
      "economy_charge, prestige_charge, TO_CHAR(regdate, 'YY/MM/DD') AS regdate " +
      "FROM FLIGHT_INFO " +
      "WHERE flight_id = #{id}"
    )
    FlightInfoVO flightDetailData(@Param("id") int id);

}
