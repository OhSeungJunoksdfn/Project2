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
	
}
