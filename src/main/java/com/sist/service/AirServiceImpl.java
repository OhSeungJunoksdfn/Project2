package com.sist.service;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.air.*;
import com.sist.dao.AirDAO;
@Service
public class AirServiceImpl implements AirService{
	
	@Autowired
	private AirDAO aDAO;

	@Override
	public List<AirLinesVO> getAllAirlines() {
		// TODO Auto-generated method stub
		return aDAO.getAllAirlines();
	}

	@Override
	public List<AirportsVO> getAllAirports() {
		// TODO Auto-generated method stub
		return aDAO.getAllAirports();
	}

	@Override
	public List<FlightInfoVO> getFlights(int page, int pageSize) {
		// TODO Auto-generated method stub
		return aDAO.getFlights(page, pageSize);
	}

	@Override
	public int getFlightsCount() {
		// TODO Auto-generated method stub
		return aDAO.getFlightsCount();
	}

	@Override
	public FlightInfoVO getFlightById(int id) {
		// TODO Auto-generated method stub
		return aDAO.getFlightById(id);
	}

	@Override
	public List<FlightInfoVO> getFlightsFiltered(int page, int pageSize, String from, String to, String arrtime,
			String deptime) {
		// TODO Auto-generated method stub
		return aDAO.getFlightsFiltered(page, pageSize, from, to, arrtime, deptime);
	}

	@Override
	public int getFlightsCountFiltered(String from, String to, String arrtime, String deptime) {
		// TODO Auto-generated method stub
		return aDAO.getFlightsCountFiltered(from, to, arrtime, deptime);
	}

	@Override
	public List<FlightInfoVO> getOutbound(int page, int pageSize, String from, String to, String date) {
		// TODO Auto-generated method stub
		return aDAO.getOutbound(page, pageSize, from, to, date);
	}

	@Override
	public int getOutboundCount(String from, String to, String date) {
		// TODO Auto-generated method stub
		return aDAO.getOutboundCount(from, to, date);
	}

	@Override
	public List<FlightInfoVO> getInbound(int page, int pageSize, String from, String to, String returnDate) {
		// TODO Auto-generated method stub
		return aDAO.getInbound(page, pageSize, from, to, returnDate);
	}

	@Override
	public int getInboundCount(String from, String to, String returnDate) {
		// TODO Auto-generated method stub
		return aDAO.getInboundCount(from, to, returnDate);
	}

	@Override
	public void addPassenger(PassengersVO passenger) {
		// TODO Auto-generated method stub
		aDAO.addPassenger(passenger);
	}

	@Override
	public PassengersVO getPassengerById(String passengerId) {
		// TODO Auto-generated method stub
		return aDAO.getPassengerById(passengerId);
	}

	@Override
	public List<PassengersVO> getAllPassengers() {
		// TODO Auto-generated method stub
		return aDAO.getAllPassengers();
	}

	@Override
	public int updatePassenger(PassengersVO passenger) {
		// TODO Auto-generated method stub
		return aDAO.updatePassenger(passenger);
	}

	@Override
	public int deletePassenger(String passengerId) {
		// TODO Auto-generated method stub
		return aDAO.deletePassenger(passengerId);
	}
	 @Override
	    public List<SeatVO> getAllSeats() {
	        return aDAO.getAllSeats();
	    }

	    @Override
	    public SeatVO getSeatById(int seatId) {
	        return aDAO.getSeatById(seatId);
	    }

	    @Override
	    public List<FlightSeatVO> getFlightSeats(int flightId) {
	        return aDAO.getFlightSeats(flightId);
	    }

	    @Override
	    public int addFlightSeat(FlightSeatVO flightSeat) {
	        return aDAO.addFlightSeat(flightSeat);
	    }

	    @Override
	    public int updateFlightSeatStatus(int flightId, int seatId, String status) {
	        return aDAO.updateFlightSeatStatus(flightId, seatId, status);
	    }

	    @Override
	    public int deleteFlightSeat(int flightId, int seatId) {
	        return aDAO.deleteFlightSeat(flightId, seatId);
	    }
	    
    @Override
    public int createBooking(BookingVO booking) {
        return aDAO.createBooking(booking);
    }

    @Override
    public BookingVO getBookingById(int bookingId) {
        return aDAO.getBookingById(bookingId);
    }

    @Override
    public List<FlightSeatVO> getSeatsByBookingId(int bookingId) {
        return aDAO.getSeatsByBookingId(bookingId);
    }

    @Override
    public void addFlightSeatsBatch(int flightId, List<FlightSeatVO> seats) {
        aDAO.addFlightSeatsBatch(flightId, seats);
    }

	@Override
	public int createBooking(int flightId, int adults, int children) {
	    BookingVO booking = new BookingVO();
	    booking.setFlightId(flightId);
	    booking.setAdults(adults);
	    booking.setChildren(children);
	    booking.setCreatedAt(Timestamp.from(Instant.now())); // 또는 new Timestamp(System.currentTimeMillis())

	    return aDAO.createBooking(booking);
	}

	@Override
	public void insertPassengers(List<PassengersVO> passengers) {
		// TODO Auto-generated method stub
		for (PassengersVO p : passengers) {
	        aDAO.addPassenger(p);
		
	}
	}

	@Override
	public List<PassengersVO> mypageAirReserveListData(String member_id) {
		// TODO Auto-generated method stub
		return null;
	}


}
