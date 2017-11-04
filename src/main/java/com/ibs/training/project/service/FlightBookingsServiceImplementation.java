package com.ibs.training.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibs.training.project.dao.FlightBookingsDaoInterface;
import com.ibs.training.project.dao.HotelBookingsDaoInterface;
import com.ibs.training.project.entity.CustomerEntity;
import com.ibs.training.project.entity.FlightBookingsEntity;
import com.ibs.training.project.entity.FlightUpdateEntity;
import com.ibs.training.project.entity.HotelBookingsEntity;
import com.ibs.training.project.model.BookingDetailsIncomingModel;
import com.ibs.training.project.model.FlightBookingsModel;
import com.ibs.training.project.model.FlightDetailsModel;
import com.ibs.training.project.model.FlightUpdateListModel;
import com.ibs.training.project.model.FlightUpdateModel;


@Service("flightBookingsService")
public class FlightBookingsServiceImplementation implements FlightBookingsServiceInterface{

	@Autowired
	private FlightBookingsDaoInterface flightBookingsDao;

	@Override
	public List<FlightBookingsModel> viewFlightBookings() {
		// TODO Auto-generated method stub

		List<FlightBookingsEntity> flightBookings=flightBookingsDao.viewFlightBookings();
		List<FlightBookingsModel> flightBookingsDetailsTo=new ArrayList<FlightBookingsModel>();

		for(FlightBookingsEntity entity:flightBookings){
			FlightBookingsModel model=new FlightBookingsModel();

			model.setBookingId(entity.getBookingId());

			model.setCustomerId(entity.getCustomerId());

			model.setFlightId(entity.getFlightId());

			model.setPrice(entity.getPrice());

			flightBookingsDetailsTo.add(model);
		}

		return flightBookingsDetailsTo;
	}

	@Autowired
	CustomerServiceInterface customerService;

	/*@Autowired
	FlightBookingsModel bookModel;*/

	@Override
	@Transactional
	public List<FlightBookingsModel> bookedFlights(
			BookingDetailsIncomingModel bdmodel) {
		// TODO Auto-generated method stub

		List<FlightBookingsModel> bookedList=new ArrayList<FlightBookingsModel>();
		List<CustomerEntity> customerDetails=customerService.viewCustomer();

		int custId=0;

		for(CustomerEntity customer:customerDetails){
			if(customer.getMobile().equals(bdmodel.getMobile())){
				custId=customer.getCustomerId();
				//bookModel.setCustomerId(customer.getCustomerId());
				break;
			}
		}


		for(FlightDetailsModel flight:bdmodel.getRouteList()){
			String bookingId="bkn";
			FlightBookingsModel bookModel=new FlightBookingsModel();
			FlightBookingsEntity fentity=new FlightBookingsEntity();
			bookModel.setCustomerId(custId);
			fentity.setCustomerId(custId);
			int total=0;
			bookingId=bookingId+custId+flight.getFlightId();
			bookModel.setBookingId(bookingId);
			fentity.setBookingId(bookingId);
			bookModel.setFlightId(flight.getFlightId());
			fentity.setFlightId(flight.getFlightId());
			total=(bdmodel.getNes()*flight.getPriceEconomy())+(bdmodel.getNbs()*flight.getPriceBusiness());
			bookModel.setPrice(total);
			fentity.setPrice(total);
			bookedList.add(bookModel);
			int id=flightBookingsDao.save(fentity);
		}

		return bookedList;
	}

	@Override
	@Transactional
	public int cancelFlight(String bookingId, int customerId) {
		// TODO Auto-generated method stub
		List<FlightBookingsEntity> flightBookings=flightBookingsDao.viewFlightBookings();
		int stat=0;
		for(FlightBookingsEntity entity:flightBookings){
			if(entity.getBookingId().equals(bookingId) && entity.getCustomerId()==customerId){
				stat=1;
				flightBookingsDao.cancelFlight(entity);
			}
		}
		return stat;
	}

	@Override
	@Transactional
	public int saveUpdateFlight(FlightUpdateListModel model) {
				FlightUpdateModel flightUpdateModel;
				int stat=0;
				for(int i=0;i<model.getRoutes().size();i++)
				{
					flightUpdateModel=new FlightUpdateModel();
					flightUpdateModel.setDates(model.getDepartureDate());
					flightUpdateModel.setBookedEco(model.getBookedEco());
					flightUpdateModel.setBookedBusi(model.getBookedBusi());
					flightUpdateModel.setFlightId(model.getRoutes().get(i).getFlightId());
					flightUpdateModel.setAvailableEco(model.getRoutes().get(i).getTotalSeatEconomy()-model.getBookedEco());
					flightUpdateModel.setAvailableBusi(model.getRoutes().get(i).getTotalSeatBusiness()-model.getBookedBusi());
					stat=flightBookingsDao.saveFlightUpdate(flightUpdateModel);
				}
		return stat;
	}

	@Override
	public List<FlightDetailsModel> updateAvailableSeats(List<FlightDetailsModel> routesClear, String departuredate) {
		List<FlightUpdateEntity> filteredRouteList=flightBookingsDao.updateAvailableSeats();
		
		for(FlightDetailsModel model:routesClear){
						for(FlightUpdateEntity entity:filteredRouteList){
								if(model.getFlightId().equals(entity.getFlightId()) && entity.getDates().equals(departuredate)){
									model.setTotalSeatEconomy(entity.getAvailableEco());
									model.setTotalSeatBusiness(entity.getAvailableBusi());
																		}
												}
										}
		
								return routesClear;
			}
		
}

