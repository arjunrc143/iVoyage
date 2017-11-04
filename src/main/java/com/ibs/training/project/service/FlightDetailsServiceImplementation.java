package com.ibs.training.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

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
			model.setTotalSeatEconomy(entity.getTotalSeatEconomy());
			model.setTotalSeatBusiness(entity.getTotalSeatBusiness());
			model.setBaggageLimit(entity.getBaggageLimit());
			model.setDepartureTime(entity.getDepartureTime());
			model.setArrivalTime(entity.getArrivalTime());
			model.setPriceEconomy(entity.getPriceEconomy());
			model.setPriceBusiness(entity.getPriceBusiness());
			FlightDetailsTo.add(model);
		}

		return FlightDetailsTo;
	}

	@Override
	@Transactional
	public String addFlights(FlightDetailsModel model) {

		FlightDetailsEntity fentity=new FlightDetailsEntity();
		fentity.setFlightId(model.getFlightId());
		fentity.setAirlineId(model.getAirlineId());
		fentity.setAirlineName(model.getAirlineName());
		fentity.setFromLocation(model.getFromLocation());
		fentity.setToLocation(model.getToLocation());
		fentity.setTotalSeatEconomy(model.getTotalSeatEconomy());
		fentity.setTotalSeatBusiness(model.getTotalSeatBusiness());
		fentity.setBaggageLimit(model.getBaggageLimit());
		fentity.setDepartureTime(model.getDepartureTime());
		fentity.setArrivalTime(model.getArrivalTime());
		fentity.setPriceEconomy(model.getPriceEconomy());
		fentity.setPriceBusiness(model.getPriceBusiness());
		String stat=flightDetailsDao.addFlights(fentity);

		return stat;

	}

}
