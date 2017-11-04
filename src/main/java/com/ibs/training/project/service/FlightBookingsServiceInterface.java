package com.ibs.training.project.service;

import java.util.List;

import com.ibs.training.project.model.BookingDetailsIncomingModel;
import com.ibs.training.project.model.FlightBookingsModel;
import com.ibs.training.project.model.FlightDetailsModel;
import com.ibs.training.project.model.FlightUpdateListModel;
import com.ibs.training.project.model.HotelBookingsModel;

public interface FlightBookingsServiceInterface {

	public List<FlightBookingsModel> viewFlightBookings();

	public List<FlightBookingsModel> bookedFlights(BookingDetailsIncomingModel bdmodel);

	public int cancelFlight(String bookingId,int customerId);

	public List<FlightDetailsModel> updateAvailableSeats(
			List<FlightDetailsModel> routesClear, String departuredate);

	public int saveUpdateFlight(FlightUpdateListModel model);

}
