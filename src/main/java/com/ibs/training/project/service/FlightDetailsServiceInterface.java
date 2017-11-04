package com.ibs.training.project.service;

import java.util.List;

import com.ibs.training.project.model.BookingDetailsIncomingModel;
import com.ibs.training.project.model.FlightBookingsModel;
import com.ibs.training.project.model.FlightDetailsModel;

public interface FlightDetailsServiceInterface {
	public List<FlightDetailsModel> viewFlight();
	public String addFlights(FlightDetailsModel model);


}
