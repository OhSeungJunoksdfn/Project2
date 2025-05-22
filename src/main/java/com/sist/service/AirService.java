package com.sist.service;

import java.util.*;
import com.sist.vo.air.*;
 
public interface AirService {
	public List<AirLinesVO> getAllAirlines();
	public List<AirportsVO> getAllAirports();
	public List<FlightInfoVO> getFlights(int page, int pageSize);
	public int getFlightsCount();
	public FlightInfoVO getFlightById(int id);
	public List<FlightInfoVO> getFlightsFiltered(
			    int page, int pageSize,
	            String from, String to,
	            String arrtime, String deptime);
	public int getFlightsCountFiltered(
            String from, String to,
            String arrtime, String deptime);
	public void addPassenger(PassengersVO passenger);
	public PassengersVO getPassengerById(String passengerId);
	public List<PassengersVO> getAllPassengers();
	public int updatePassenger(PassengersVO passenger);
	public int deletePassenger(String passengerId);
	public List<FlightInfoVO> getOutbound(
            int page, int pageSize,
            String from, String to, String date);
	public int getOutboundCount(String from, String to, String date);
	public List<FlightInfoVO> getInbound(
            int page, int pageSize,
            String from, String to, String returnDate);
	public int getInboundCount(String from, String to, String returnDate);
	
    /** 17) 전체 좌석 조회 */
    List<SeatVO> getAllSeats();

    /** 18) 단일 좌석 조회 */
    SeatVO getSeatById(int seatId);

    /** 19) 특정 항공편 좌석 현황 조회 */
    List<FlightSeatVO> getFlightSeats(int flightId);

    /** 20) 좌석 예약 삽입 */
    int addFlightSeat(FlightSeatVO flightSeat);

    /** 21) 예약 상태(status) 업데이트 */
    int updateFlightSeatStatus(int flightId, int seatId, String status);

    /** 22) 좌석 예약 취소 */
    int deleteFlightSeat(int flightId, int seatId);
    
    /** 23) 예약 헤더 생성 후 bookingId 반환 */
    int createBooking(BookingVO booking);

   /** 24) bookingId로 예약 조회 */
    BookingVO getBookingById(int bookingId);

    /** 25) bookingId에 속한 좌석 목록 조회 */
    List<FlightSeatVO> getSeatsByBookingId(int bookingId);

   /** 26) 좌석 일괄 예약 (flight_seat) */
   void addFlightSeatsBatch(int flightId, List<FlightSeatVO> seats);
public int createBooking(int flightId, int adults, int children);
public void insertPassengers(List<PassengersVO> passengers);
public List<PassengersVO> mypageAirReserveListData(String member_id);
}
