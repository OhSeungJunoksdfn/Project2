package com.sist.service;
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
}
