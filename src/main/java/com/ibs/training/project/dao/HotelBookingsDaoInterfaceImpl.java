package com.ibs.training.project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

import com.ibs.training.project.entity.CustomerEntity;
import com.ibs.training.project.entity.HotelBookingsEntity;
import com.ibs.training.project.entity.HotelUpdateEntity;
import com.ibs.training.project.model.HotelBookingsModel;
import com.ibs.training.project.model.HotelUpdateModel;


@Repository("hotelbookingsEntity")
public class HotelBookingsDaoInterfaceImpl implements HotelBookingsDaoInterface {

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	HotelBookingsEntity hotelBookingsEntity=new HotelBookingsEntity();

	CustomerEntity customerdeleteEntity=new CustomerEntity();
	int customerId;

	@Override
	public int saveHotelBookings(HotelBookingsModel hotelBookingsModel) {
		// TODO Auto-generated method stub
		hotelBookingsEntity.setBookingId(hotelBookingsModel.getBookingId());
		hotelBookingsEntity.setHotel_Id(hotelBookingsModel.getHotelId());
		hotelBookingsEntity.setCustomerId(hotelBookingsModel.getCustomerId());
		hotelBookingsEntity.setPrice(hotelBookingsModel.getPrice());
		Integer Id= (Integer)sessionFactory.getCurrentSession().save(hotelBookingsEntity);		
		return Id ;


	}

	//Fetching customer details to get customer id back to service
	@Override
	public int getCustomer(String customermobile){

		List<CustomerEntity> customerDetails = jdbcTemplate.query("SELECT * FROM CUSTOMER_TABLE", new RowMapper<CustomerEntity> () {

			@Override
			public CustomerEntity mapRow (ResultSet rs,int rowNumber){
				CustomerEntity customerEntity=new CustomerEntity();
				try{
					customerEntity.setCustomerId(rs.getInt(1));
					customerEntity.setFirstName(rs.getString(2));
					customerEntity.setLastName(rs.getString(3));
					customerEntity.setGender(rs.getString(4));
					customerEntity.setMobile(rs.getString(5));
					return customerEntity;
				}catch (SQLException e){
					e.printStackTrace();
				}
				return null;
			}
		});
		System.out.println("CustomerDetails Available here");

		if(customerDetails.isEmpty())
		{
			}
		else
			for(CustomerEntity obj:customerDetails)
			{
				if(customermobile.equals(obj.getMobile()))
				{
					customerId=obj.getCustomerId();
					customerdeleteEntity=obj;
					break;
				}
			}
		return customerId; 
	}

	@Override
	public int deleteCustomer(String mobile) {
		// TODO Auto-generated method stub
		getCustomer(mobile);
		sessionFactory.getCurrentSession().delete(customerdeleteEntity);
		return 1;
	}

	@Override
	public List<HotelBookingsEntity> viewHotelBookings() {
		List<HotelBookingsEntity> bookingDetails = jdbcTemplate.query("SELECT * FROM HOTELS_BOOKING", new RowMapper<HotelBookingsEntity> () {

			@Override
			public HotelBookingsEntity mapRow (ResultSet rs,int rowNumber){
				HotelBookingsEntity hotelBookingsEntity = new HotelBookingsEntity();
				try{
					hotelBookingsEntity.setSerialNo(rs.getInt(1));
					hotelBookingsEntity.setBookingId(rs.getString(2));
					hotelBookingsEntity.setCustomerId(rs.getInt(3));
					hotelBookingsEntity.setHotel_Id(rs.getString(5));
					hotelBookingsEntity.setPrice(rs.getDouble(4));
					return hotelBookingsEntity;
				}catch (SQLException e){
					e.printStackTrace();
				}
				return null;
			}
		});

		return bookingDetails;
	}

	@Override
	public int cancelHotel(HotelBookingsEntity entity) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(entity);
		return 1;
	}

	@Override
	public int saveHotelUpdate(HotelUpdateModel hotelUpdateModel) throws ParseException{
		Integer Id=0;
		String dt = hotelUpdateModel.getDate();
		String hid=hotelUpdateModel.getHotelId();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuu-MM-dd");

		LocalDate date = LocalDate.parse(dt, formatter);
		
		System.out.println(date);
		for(int i=0;(i<hotelUpdateModel.getNoOfDays());i++)
		{
				String query="SELECT * FROM HOTEL_UPDATED WHERE HOTEL_ID='"+hid+"' AND DATES='"+dt+"'";
				List<HotelUpdateEntity> hotelBookedList = jdbcTemplate.query(query, new RowMapper<HotelUpdateEntity> () {
			
						@Override
						public HotelUpdateEntity mapRow (ResultSet rs,int rowNumber){
						HotelUpdateEntity hotelUpdatedEntity=new HotelUpdateEntity();
							try{
									hotelUpdatedEntity.setUpdateId(rs.getInt(1));
									hotelUpdatedEntity.setAvailableAC(rs.getInt(2));
									hotelUpdatedEntity.setAvailableNonAC(rs.getInt(3));
									hotelUpdatedEntity.setBookedAC(rs.getInt(4));
									hotelUpdatedEntity.setBookedNonAC(rs.getInt(5));
									hotelUpdatedEntity.setHotelId(rs.getString(7));
									hotelUpdatedEntity.setNoOfDays(rs.getInt(8));
									hotelUpdatedEntity.setDate(rs.getString(6));
									return hotelUpdatedEntity;
								}catch (SQLException e){
									e.printStackTrace();
								}
									return null;
								}
						});
				if(!hotelBookedList.isEmpty()){
					for(HotelUpdateEntity chkList:hotelBookedList){
						HotelUpdateEntity hotelUpdateEntity1=new HotelUpdateEntity();
						hotelUpdateEntity1.setHotelId(hotelUpdateModel.getHotelId());
						hotelUpdateEntity1.setNoOfDays(hotelUpdateModel.getNoOfDays());
						hotelUpdateEntity1.setDate(hotelUpdateModel.getDate());
						hotelUpdateEntity1.setBookedAC(chkList.getBookedAC()+hotelUpdateModel.getBookedAC());
						hotelUpdateEntity1.setBookedNonAC(chkList.getBookedNonAC()+hotelUpdateModel.getBookedNonAC());
						hotelUpdateEntity1.setAvailableAC(chkList.getAvailableAC()-hotelUpdateModel.getBookedAC());                                                                                                                                                    
						hotelUpdateEntity1.setAvailableNonAC(chkList.getAvailableNonAC()-hotelUpdateModel.getBookedNonAC());
						Id= (Integer)sessionFactory.getCurrentSession().save(hotelUpdateEntity1);	
						date = date.plusDays(1);
						dt=date.toString();
						hotelUpdateModel.setDate(dt);
						sessionFactory.getCurrentSession().delete(chkList);
						}
				}
				else{
					
							HotelUpdateEntity hotelUpdateEntity1=new HotelUpdateEntity();
							hotelUpdateEntity1.setHotelId(hotelUpdateModel.getHotelId());
							hotelUpdateEntity1.setNoOfDays(hotelUpdateModel.getNoOfDays());
							hotelUpdateEntity1.setDate(hotelUpdateModel.getDate());
							hotelUpdateEntity1.setBookedAC(hotelUpdateModel.getBookedAC());
							hotelUpdateEntity1.setBookedNonAC(hotelUpdateModel.getBookedNonAC());
							hotelUpdateEntity1.setAvailableAC(hotelUpdateModel.getAvailableAC());
							hotelUpdateEntity1.setAvailableNonAC(hotelUpdateModel.getAvailableNonAC());
							Id= (Integer)sessionFactory.getCurrentSession().save(hotelUpdateEntity1);	
							date = date.plusDays(1);
							dt=date.toString();
							hotelUpdateModel.setDate(dt);
				}
		}
		return Id ;
	
	}

	@Override
	public List<HotelUpdateEntity> updateAvailableRooms() {
		String query="SELECT * FROM HOTEL_UPDATED";
		List<HotelUpdateEntity> hotelBookedList = jdbcTemplate.query(query, new RowMapper<HotelUpdateEntity> () {
	
				@Override
				public HotelUpdateEntity mapRow (ResultSet rs,int rowNumber){
				HotelUpdateEntity hotelUpdatedEntity=new HotelUpdateEntity();
					try{
							hotelUpdatedEntity.setUpdateId(rs.getInt(1));
							hotelUpdatedEntity.setAvailableAC(rs.getInt(2));
							hotelUpdatedEntity.setAvailableNonAC(rs.getInt(3));
							hotelUpdatedEntity.setBookedAC(rs.getInt(4));
							hotelUpdatedEntity.setBookedNonAC(rs.getInt(5));
							hotelUpdatedEntity.setHotelId(rs.getString(7));
							hotelUpdatedEntity.setNoOfDays(rs.getInt(8));
							hotelUpdatedEntity.setDate(rs.getString(6));
							return hotelUpdatedEntity;
						}catch (SQLException e){
							e.printStackTrace();
						}
							return null ;
						}
				});
		return hotelBookedList;
	}

}



