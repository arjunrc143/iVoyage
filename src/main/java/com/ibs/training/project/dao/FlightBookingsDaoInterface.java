package com.ibs.training.project.dao;

import java.util.List;

import com.ibs.training.project.entity.FlightBookingsEntity;
import com.ibs.training.project.entity.HotelBookingsEntity;
import com.ibs.training.project.model.FlightUpdateModel;
import com.ibs.training.project.entity.FlightUpdateEntity;

public interface FlightBookingsDaoInterface {

	public List<FlightBookingsEntity> viewFlightBookings();
	
	public int save(FlightBookingsEntity entity);
	
	public int cancelFlight(FlightBookingsEntity entity);

	public int saveFlightUpdate(FlightUpdateModel flightUpdateModel);

	public List<FlightUpdateEntity> updateAvailableSeats();
}
