package com.ibs.training.project.dao;

import java.text.ParseException;
import java.util.List;

import com.ibs.training.project.entity.HotelBookingsEntity;
import com.ibs.training.project.entity.HotelUpdateEntity;
import com.ibs.training.project.model.HotelBookingsModel;
import com.ibs.training.project.model.HotelUpdateModel;

public interface HotelBookingsDaoInterface {


	public int saveHotelBookings(HotelBookingsModel hotelbookingsModel);
	public int getCustomer(String customermobile);
	public int deleteCustomer(String mobile);
	public List<HotelBookingsEntity> viewHotelBookings();
	public int cancelHotel(HotelBookingsEntity entity);
	public int saveHotelUpdate(HotelUpdateModel hotelUpdateModel) throws ParseException;
	public List<HotelUpdateEntity> updateAvailableRooms();
	
}
