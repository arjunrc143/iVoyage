package com.ibs.training.project.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibs.training.project.dao.HotelBookingsDaoInterface;
import com.ibs.training.project.entity.HotelBookingsEntity;
import com.ibs.training.project.entity.HotelUpdateEntity;
import com.ibs.training.project.model.HotelBookConfirmModel;
import com.ibs.training.project.model.HotelBookingsModel;
import com.ibs.training.project.model.HotelDetailsModel;
import com.ibs.training.project.model.HotelUpdateModel;

@Service("hotelbookingsservice")
public class HotelBookingsServiceImplementation implements HotelBookingsServiceInterface
{
	@Autowired
	private HotelBookingsDaoInterface hotelBookingsDao;


	HotelBookingsModel hotelBookingsModel=new HotelBookingsModel();
	HotelUpdateModel hotelUpdateModel=new HotelUpdateModel();
	@Override
	@javax.transaction.Transactional
	public int saveHotelBookings(HotelBookConfirmModel hotelBookConfirmModel,String customermobile){

		int customerId=hotelBookingsDao.getCustomer(customermobile);
		String bookingId=hotelBookConfirmModel.getHotelId()+customerId;
		hotelBookingsModel.setBookingId(bookingId);
		hotelBookingsModel.setCustomerId(customerId);
		hotelBookingsModel.setHotelId(hotelBookConfirmModel.getHotelId());
		hotelBookingsModel.setPrice(hotelBookConfirmModel.getPayment());
		hotelBookingsDao.saveHotelBookings(hotelBookingsModel);
		return customerId; 		
	}


	@Override
	@Transactional
	public int cancelHotelBooking(String mobile) {

		int result=hotelBookingsDao.deleteCustomer(mobile);

		return result;
	}


	@Override
	public List<HotelBookingsModel> viewHotelBookings() {
		// TODO Auto-generated method stub

		List<HotelBookingsEntity> hotelBookings=hotelBookingsDao.viewHotelBookings();
		List<HotelBookingsModel> hotelBookingsDetailsTo=new ArrayList<HotelBookingsModel>();

		for(HotelBookingsEntity entity:hotelBookings){
			HotelBookingsModel model=new HotelBookingsModel();
			model.setBookingId(entity.getBookingId());
			model.setCustomerId(entity.getCustomerId());
			model.setHotelId(entity.getHotel_Id());
			model.setPrice(entity.getPrice());

			hotelBookingsDetailsTo.add(model);
		}

		return hotelBookingsDetailsTo;
	}


	@Override
	@Transactional
	public int cancelHotel(String bookingId, int customerId) {
		// TODO Auto-generated method stub
		int stat=0;
		List<HotelBookingsEntity> hotelBookings=hotelBookingsDao.viewHotelBookings();
		for(HotelBookingsEntity entity:hotelBookings){
			//System.out.println(entity.getBookingId()+" "+entity.getCustomerId()+" "+entity.getSerialNo());
			if(entity.getBookingId().equals(bookingId) && entity.getCustomerId()==customerId){
				hotelBookingsDao.cancelHotel(entity);
				stat=1;
			}
		}
		return stat;
	}
	
	@Override
	@Transactional
	public int saveUpdateHotel(HotelUpdateModel model) throws ParseException{
			
			hotelUpdateModel.setHotelId(model.getHotelId());;
			hotelUpdateModel.setNoOfDays(model.getNoOfDays());
			hotelUpdateModel.setDate(model.getDate());
			hotelUpdateModel.setBookedAC(model.getBookedAC());
			hotelUpdateModel.setBookedNonAC(model.getBookedNonAC());
			hotelUpdateModel.setAvailableAC(model.getAvailableAC());
			hotelUpdateModel.setAvailableNonAC(model.getAvailableNonAC());
			return  hotelBookingsDao.saveHotelUpdate(hotelUpdateModel);
					
		}
		
	@Override
	public List<HotelDetailsModel> updateAvailableRooms(List<HotelDetailsModel> filteredList, String checkInDate) {
				List<HotelUpdateEntity> filteredBookedList=hotelBookingsDao.updateAvailableRooms();
		
				for(HotelDetailsModel model:filteredList){
					for(HotelUpdateEntity entity:filteredBookedList){
						if(model.getHotelId().equals(entity.getHotelId()) && entity.getDate().equals(checkInDate)){
							model.setTotalRoomsAc(entity.getAvailableAC());
							model.setTotalRoomsNonAc(entity.getAvailableNonAC());
						}
					}
				}
				
				return filteredList;
	}


}
