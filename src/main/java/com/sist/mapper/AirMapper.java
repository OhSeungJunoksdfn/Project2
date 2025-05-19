
package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.sist.vo.air.*;
/* Mybatis 스캐닝 어노테이션 => */
@MapperScan("com.sist.mapper")
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
	    );

	    /** 왕복(오는 편) 총 페이지 수 */
	    int countInbound(
	      @Param("from") String from,
	      @Param("to")   String to,
	      @Param("date") String date
	    );
	    
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
    
	    /** 11) 전체 좌석 조회 */
	    List<SeatVO> selectSeats();

	    /** 12) 단일 좌석 조회 (seat_id 기준) */
	    SeatVO selectSeatById(@Param("seatId") int seatId);

	    /** 13) 특정 항공편(flight_id)의 좌석 현황 조회 */
	    List<FlightSeatVO> selectFlightSeats(@Param("flightId") int flightId);

	    /** 14) flight_seat 레코드 삽입 */
	    int insertFlightSeat(FlightSeatVO vo);

	    /** 15) flight_seat 상태(status) 업데이트 */
	    int updateFlightSeatStatus(@Param("flightId") int flightId,
	                               @Param("seatId")   int seatId,
	                               @Param("status")   String status);

	    /** 16) flight_seat 삭제 (취소 등) */
	    int deleteFlightSeat(@Param("flightId") int flightId,
	                         @Param("seatId")   int seatId);
	}