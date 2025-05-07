package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.sist.vo.air.*;

@Repository
public interface AirMapper {

    @Select(
      "SELECT airport_id,airport_code,airport_name_en,airport_name_ko,city,country, num " +
      "FROM (SELECT airport_id,airport_code,airport_name_en,airport_name_ko,city,country,rownum AS num " +
      "FROM (SELECT airport_id,airport_code,airport_name_en,airport_name_ko,city,country " +
      "FROM AIRPORTS ORDER BY airport_code)) " +
      "WHERE num BETWEEN #{start} AND #{end}"
    )
    List<AirportsVO> airportListData(
      @Param("start") int start,
      @Param("end")   int end
    );

    @Select("SELECT CEIL(COUNT(*)/10.0) FROM AIRPORTS")
    int airportTotalPage();

    @Select(
      "SELECT airport_id, airport_code, airport_name_en, airport_name_ko, city, country " +
      "FROM AIRPORTS WHERE airport_code = #{airport_code}"
    )
    AirportsVO airportDetailData(@Param("code") String airportCode);
    
    @Select(
    	      "SELECT flight_id, airline_code, flight_number, dep_airport_code, arr_airport_code, "+
    	      "dep_time, arr_time, economy_charge, prestige_charge, regdate, num " +
    	      "FROM (SELECT flight_id, airline_code, flight_number, dep_airport_code, arr_airport_code, " +
    	      "dep_time, arr_time, economy_charge, prestige_charge, regdate, rownum AS num " +
    	      "FROM (SELECT * FROM FLIGHT_INFO ORDER BY dep_time)) " +
    	      "WHERE num BETWEEN #{start} AND #{end}"
    	    )
    	    List<FlightInfoVO> flightListData(
    	      @Param("start") int start,
    	      @Param("end")   int end
    	    );

    	    @Select("SELECT CEIL(COUNT(*)/20.0) FROM FLIGHT_INFO")
    	    int flightTotalPage();

    	    @Select("SELECT * FROM FLIGHT_INFO WHERE flight_id = #{id}")
    	    FlightInfoVO flightDetailData(@Param("id") int flightId);

   
}
