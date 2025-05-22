package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.air.*;
import java.util.*;

@Repository
public class AirDAO {
	   @Autowired
	    private AirMapper mapper;

	    /** 1) AIRLINES 전체 조회 */
	    public List<AirLinesVO> getAllAirlines() {
	        return mapper.selectAirlines();
	    }

	    /** 2) AIRPORTS 전체 조회 */
	    public List<AirportsVO> getAllAirports() {
	        return mapper.selectAirports();
	    }

	    /** 3) FLIGHT_INFO 페이징 조회 */
	    public List<FlightInfoVO> getFlights(int page, int pageSize) {
	        int start = (page - 1) * pageSize + 1;
	        int end   = page * pageSize;
	        Map<String,Object> params = new HashMap<>();
	        params.put("start", start);
	        params.put("end",   end);
	        return mapper.selectFlights(params);
	    }
	    public int getFlightsCount() {
	        return mapper.selectFlightsCount();
	    }

	    /** 4) FLIGHT_INFO 상세 조회 (ID로) */
	    public FlightInfoVO getFlightById(int id) {
	        return mapper.selectFlightById(id);
	    }

	    /** 5) FLIGHT_INFO 필터 + 페이징 조회 */
	    public List<FlightInfoVO> getFlightsFiltered(
	            int page, int pageSize,
	            String from, String to,
	            String arrtime, String deptime) {

	        int start = (page - 1) * pageSize + 1;
	        int end   = page * pageSize;
	        Map<String,Object> params = new HashMap<>();
	        params.put("start",   start);
	        params.put("end",     end);
	        params.put("from",    from);
	        params.put("to",      to);
	        params.put("arrtime", arrtime);
	        params.put("deptime", deptime);
	        return mapper.selectFlightsFiltered(params);
	    }
	    public int getFlightsCountFiltered(
	            String from, String to,
	            String arrtime, String deptime) {

	        Map<String,Object> params = new HashMap<>();
	        params.put("from",    from);
	        params.put("to",      to);
	        params.put("arrtime", arrtime);
	        params.put("deptime", deptime);
	        return mapper.selectFlightsCountFiltered(params);
	    }

	    /** 6) 승객 삽입 */
	    public void addPassenger(PassengersVO passenger) {
	        mapper.insertpassengers(passenger);
	    }

	    /** 7) 단일 승객 조회 (ID 기준) */
	    public PassengersVO getPassengerById(String passengerId) {
	        return mapper.selectPassengerById(passengerId);
	    }

	    /** 8) 전체 승객 조회 */
	    public List<PassengersVO> getAllPassengers() {
	        return mapper.selectAllPassengers();
	    }

	    /** 9) 승객 정보 수정 */
	    public int updatePassenger(PassengersVO passenger) {
	        return mapper.updatePassenger(passenger);
	    }

	    /** 10) 승객 삭제 */
	    public int deletePassenger(String passengerId) {
	        return mapper.deletePassenger(passengerId);
	    }

	    /** 편도(가는 편) 조회 */
	    public List<FlightInfoVO> getOutbound(
	            int page, int pageSize,
	            String from, String to, String date) {

	        int start = (page - 1) * pageSize + 1;
	        int end   = page * pageSize;
	        return mapper.selectOutbound(start, end, from, to, date);
	    }
	    public int getOutboundCount(String from, String to, String date) {
	        return mapper.countOutbound(from, to, date);
	    }

	    /** 왕복(오는 편) 조회 */
	    public List<FlightInfoVO> getInbound(
	            int page, int pageSize,
	            String from, String to, String returnDate) {

	        int start = (page - 1) * pageSize + 1;
	        int end   = page * pageSize;
	        return mapper.selectInbound(start, end, from, to, returnDate);
	    }
	    /** 왕복편(오는 편) 총 페이지 수 조회 */
	    public int getInboundCount(String from, String to, String returnDate) {
	        return mapper.countInbound(from, to, returnDate);
	    }
	    
	    /** 11) 전체 좌석 조회 */
	    public List<SeatVO> getAllSeats() {
	        return mapper.selectSeats();
	    }

	    /** 12) 단일 좌석 조회 */
	    public SeatVO getSeatById(int seatId) {
	        return mapper.selectSeatById(seatId);
	    }

	    /** 13) 특정 항공편의 좌석 현황 조회 */
	    public List<FlightSeatVO> getFlightSeats(int flightId) {
	        return mapper.selectFlightSeats(flightId);
	    }

	    /** 14) 좌석 예약 삽입 (flight_seat) */
	    public int addFlightSeat(FlightSeatVO fs) {
	        return mapper.insertFlightSeat(fs);
	    }

	    /** 15) 예약 상태 변경 */
	    public int updateFlightSeatStatus(int flightId, int seatId, String status) {
	        return mapper.updateFlightSeatStatus(flightId, seatId, status);
	    }

	    /** 16) 좌석 예약 취소 (flight_seat 삭제) */
	    public int deleteFlightSeat(int flightId, int seatId) {
	        return mapper.deleteFlightSeat(flightId, seatId);
	    }
	    
	    /** 17) 예약 정보 삽입 → 생성된 bookingId 를 VO에 채워서 반환 */
	    public int createBooking(BookingVO booking) {
	        // booking.bookingId 는 insert 후 채워집니다 (useGeneratedKeys)
	        mapper.insertBooking(booking);
	        return booking.getBookingId();
	    }

	    /** 18) 단일 예약 조회 */
	    public BookingVO getBookingById(int bookingId) {
	        return mapper.selectBookingById(bookingId);
	    }

	    /** ───────── 예약된 좌석(batch) ───────── */

	    /** 19) bookingId 로 묶인 좌석 목록 조회 */
	    public List<FlightSeatVO> getSeatsByBookingId(int bookingId) {
	        return mapper.selectSeatsByBookingId(bookingId);
	    }

	    /** 20) 예약된 좌석 일괄 저장 */
	    public void addFlightSeatsBatch(int flightId, List<FlightSeatVO> seats) {
	        for (FlightSeatVO fs : seats) {
	            // fs 에는 seatId, status, bookingId, passengerType 등이 세팅되어 있어야 합니다
	            mapper.insertFlightSeat(fs);
	        }
	    }
	    
	}
