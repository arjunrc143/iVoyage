package com.ibs.training.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibs.training.project.dao.HotelDetailsDaoInterface;
import com.ibs.training.project.entity.HotelDetailsEntity;
import com.ibs.training.project.model.HotelDetailsModel;

@Service("hotelDetailsService")
public class HotelDetailsServiceImplementation implements HotelDetailsServiceInterface{

	@Autowired
	private HotelDetailsDaoInterface hotelDetailsDao;
	
	
	@Override
	public List<HotelDetailsModel> viewHotel() {
		// TODO Auto-generated method stub
		 List<HotelDetailsEntity> hotelDetails=hotelDetailsDao.viewHotel();
		 List<HotelDetailsModel> hotelDetailsTo=new ArrayList<HotelDetailsModel>();
		 
		 for(HotelDetailsEntity entity:hotelDetails){
			 HotelDetailsModel model=new HotelDetailsModel();
			 model.setHotelId(entity.getHotelId());
			 model.setHotelName(entity.getHotelName());
			 model.setLocation(entity.getLocation());
			 model.setTotalRoomsAc(entity.getTotalRoomsAc());
			 model.setTotalRoomsNonAc(entity.getTotalRoomsNonAc());
			 hotelDetailsTo.add(model);
			 
		 }
		 return hotelDetailsTo;
	}

	
}
