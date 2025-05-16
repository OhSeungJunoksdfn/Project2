
package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.sist.vo.air.*;

@MapperScan
public interface AirMapper {
 
	    /** 1) AIRLINES 전체 조회 */
	    List<AirLinesVO> selectAirlines();

	    /** 2) AIRPORTS 전체 조회 */
	    List<AirportsVO> selectAirports();

	    /** 3) FLIGHT_INFO 페이징 조회  */
	    List<FlightInfoVO> selectFlights(Map<String, Object> params);
	    int selectFlightsCount();

	    /** 4) FLIGHT_INFO 상세 조회 (ID로) */
	    FlightInfoVO selectFlightById(@Param("id") int id);

	    /** 5) FLIGHT_INFO 필터 + 페이징 조회 */
	    List<FlightInfoVO> selectFlightsFiltered(Map<String, Object> params);
	    int selectFlightsCountFiltered(Map<String, Object> params);

	    /** 6) 승객 삽입 */
	    void insertpassengers(PassengersVO vo);

	    /** 7) 단일 승객 조회 (ID 기준) */
	    PassengersVO selectPassengerById(@Param("passengerId") String passengerId);

	    /** 8) 전체 승객 조회 */
	    List<PassengersVO> selectAllPassengers();

	    /** 9) 승객 정보 수정 */
	    int updatePassenger(PassengersVO vo);

	    /** 10) 승객 삭제 */
	    int deletePassenger(@Param("passengerId") String passengerId);
    
	    /** 편도(가는 편) 조회 */
	    List<FlightInfoVO> selectOutbound(
	      @Param("start")   int start,
	      @Param("end")     int end,
	      @Param("from")    String from,
	      @Param("to")      String to,
	      @Param("date")    String date  // 출발일
	    );

	    /** 편도(가는 편) 총 페이지 수 */
	    int countOutbound(
	      @Param("from") String from,
	      @Param("to")   String to,
	      @Param("date") String date
	    );

	    /** 왕복(오는 편) 조회 */
	    List<FlightInfoVO> selectInbound(
	      @Param("start")   int start,
	      @Param("end")     int end,
	      @Param("from")    String from,
	      @Param("to")      String to,
	      @Param("date")    String date  // 돌아오는 날짜
//	      @Param("flightid") int flightid
	    );

	    /** 왕복(오는 편) 총 페이지 수 */
	    int countInbound(
	      @Param("from") String from,
	      @Param("to")   String to,
	      @Param("date") String date
	    );

		
	}
