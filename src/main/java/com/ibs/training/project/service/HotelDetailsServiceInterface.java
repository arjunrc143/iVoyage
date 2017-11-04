package com.ibs.training.project.service;

import java.util.List;

import com.ibs.training.project.entity.HotelDetailsEntity;
import com.ibs.training.project.model.HotelDetailsModel;

public interface HotelDetailsServiceInterface {

	public List<HotelDetailsModel> viewHotel();
	public String addHotels(HotelDetailsModel model);
}
