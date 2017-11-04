package com.ibs.training.project.service;

import java.text.ParseException;
import java.util.List;

import com.ibs.training.project.model.HotelBookConfirmModel;
import com.ibs.training.project.model.HotelBookingsModel;
import com.ibs.training.project.model.HotelDetailsModel;
import com.ibs.training.project.model.HotelUpdateModel;

public interface HotelBookingsServiceInterface {


	public int saveHotelBookings(HotelBookConfirmModel hotelbookingsmodel,String customermobile);

	public int cancelHotelBooking(String mobile);

	public List<HotelBookingsModel> viewHotelBookings();

	public int cancelHotel(String bookingId,int customerId);
	public int saveUpdateHotel(HotelUpdateModel model) throws ParseException;

	

	public List<HotelDetailsModel> updateAvailableRooms(
			List<HotelDetailsModel> filteredList, String checkInDate);

}
