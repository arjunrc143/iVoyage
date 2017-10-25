package com.ibs.training.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;




import org.springframework.stereotype.Service;

import com.ibs.training.project.dao.FlightDetailsDaoInterface;
import com.ibs.training.project.entity.AdminEntity;
import com.ibs.training.project.entity.FlightDetailsEntity;
import com.ibs.training.project.model.AdminModel;
import com.ibs.training.project.model.FlightDetailsModel;

@Service("flightDetailsService")
public class FlightDetailsServiceImplementation implements FlightDetailsServiceInterface{

	
	@Autowired
	private FlightDetailsDaoInterface flightDetailsDao;
	
	
	@Override
	public List<FlightDetailsModel> viewFlight() {
		// TODO Auto-generated method stub
		
		List<FlightDetailsEntity> flightDetails=flightDetailsDao.viewFlight();
		List<FlightDetailsModel> FlightDetailsTo=new ArrayList<FlightDetailsModel>();
		
		for(FlightDetailsEntity entity:flightDetails){
			FlightDetailsModel model=new FlightDetailsModel();
			model.setFlightId(entity.getFlightId());
			model.setAirlineId(entity.getAirlineId());
			model.setAirlineName(entity.getAirlineName());
			model.setFromLocation(entity.getFromLocation());
			model.setToLocation(entity.getToLocation());
			model.setDepartureTime(entity.getDepartureTime());
			model.setArrivalTime(entity.getArrivalTime());
			model.setTotalSeatEconomy(entity.getTotalSeatEconomy());
			model.setTotalSeatBusiness(entity.getTotalSeatBusiness());
			model.setBaggageLimit(entity.getBaggageLimit());
			FlightDetailsTo.add(model);
		}
		
		System.out.println(FlightDetailsTo);
		return FlightDetailsTo;
	}

	
	
}
