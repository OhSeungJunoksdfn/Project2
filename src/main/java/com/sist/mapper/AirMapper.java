package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.sist.vo.air.*;

public interface AirMapper {

    // 항공편 등록
    @Insert("INSERT INTO flight_info (flight_id, airline_code, flight_number, dep_airport_code, " +
            "arr_airport_code, dep_time, arr_time, economy_charge, prestige_charge) " +
            "VALUES (#{flightId}, #{airlineCode}, #{flightNumber}, #{depAirportCode}, " +
            "#{arrAirportCode}, #{depTime}, #{arrTime}, #{economyCharge}, #{prestigeCharge})")
    public void insertFlightInfo(Flight_infoVO vo);

    // 항공편 전체 조회
    @Select("SELECT flight_id, airline_code, flight_number, dep_airport_code, arr_airport_code, " +
            "dep_time, arr_time, economy_charge, prestige_charge, regdate " +
            "FROM flight_info ORDER BY dep_time")
    public List<Flight_infoVO> flight_infoList();

    // 항공편 상세 조회 (예: flight_id로)
    @Select("SELECT flight_id, airline_code, flight_number, dep_airport_code, arr_airport_code, " +
            "dep_time, arr_time, economy_charge, prestige_charge, regdate " +
            "FROM flight_info WHERE flight_id = #{flightId}")
    public Flight_infoVO findById(Long flightId);
}
