package com.ibs.training.project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ibs.training.project.entity.FlightBookingsEntity;
import com.ibs.training.project.entity.FlightUpdateEntity;
import com.ibs.training.project.model.FlightUpdateModel;



@Repository("flightBookingsEntity")
public class FlightBookingsDaoImplementation implements FlightBookingsDaoInterface{

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<FlightBookingsEntity> viewFlightBookings() {
		List<FlightBookingsEntity> bookingDetails = jdbcTemplate.query("SELECT * FROM FLIGHTS_BOOKING", new RowMapper<FlightBookingsEntity> () {

			@Override
			public FlightBookingsEntity mapRow (ResultSet rs,int rowNumber){
				FlightBookingsEntity flightBookingsEntity = new FlightBookingsEntity();
				try{
					flightBookingsEntity.setSerialNo(rs.getInt(1));
					flightBookingsEntity.setBookingId(rs.getString(2));
					flightBookingsEntity.setCustomerId(rs.getInt(3));
					flightBookingsEntity.setFlightId(rs.getString(5));
					flightBookingsEntity.setPrice(rs.getInt(4));
					return flightBookingsEntity;
				}catch (SQLException e){
					e.printStackTrace();
				}
				return null;
			}
		});
		return bookingDetails;
	}

	@Override
	public int save(FlightBookingsEntity entity) {
		// TODO Auto-generated method stub
		Integer id=(Integer) sessionFactory.getCurrentSession().save(entity);
		return id;
	}

	@Override
	public int cancelFlight(FlightBookingsEntity entity) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(entity);
		return 1;
	}

	@Override
	public int saveFlightUpdate(FlightUpdateModel flightUpdateModel) {
		System.out.println("in DAO FLIGHT UPDATE");
		Integer Id=0;
		String dt = flightUpdateModel.getDates();
		String fid=flightUpdateModel.getFlightId();
		String query="SELECT * FROM FLIGHT_UPDATED WHERE FLIGHT_ID='"+fid+"' AND DATES='"+dt+"'";
		List<FlightUpdateEntity> flightBookedList = jdbcTemplate.query(query, new RowMapper<FlightUpdateEntity> () {
	
				@Override
				public FlightUpdateEntity mapRow (ResultSet rs,int rowNumber){
					FlightUpdateEntity flightUpdateEntity1=new FlightUpdateEntity();
					try{
							flightUpdateEntity1.setUpdateId(rs.getInt(1));
							flightUpdateEntity1.setAvailableBusi(rs.getInt(2));
							flightUpdateEntity1.setAvailableEco(rs.getInt(3));
							flightUpdateEntity1.setBookedBusi(rs.getInt(4));
							flightUpdateEntity1.setBookedEco(rs.getInt(5));
							flightUpdateEntity1.setDates(rs.getString(7));
							return flightUpdateEntity1;
						}catch (SQLException e){
							e.printStackTrace();
						}
							return null;
						}
				});
		if(!flightBookedList.isEmpty()){
			for(FlightUpdateEntity chkList:flightBookedList){
					System.out.println("if entity already in db");
									FlightUpdateEntity flightUpdateEntity=new FlightUpdateEntity();
									flightUpdateEntity.setFlightId(flightUpdateModel.getFlightId());
									flightUpdateEntity.setDates(flightUpdateModel.getDates());
									flightUpdateEntity.setAvailableEco(chkList.getAvailableEco()-flightUpdateModel.getBookedEco());
									flightUpdateEntity.setAvailableBusi(chkList.getAvailableBusi()-flightUpdateModel.getBookedBusi());
									flightUpdateEntity.setBookedEco(chkList.getBookedEco()+flightUpdateModel.getBookedEco());
									flightUpdateEntity.setBookedBusi(chkList.getBookedBusi()+flightUpdateModel.getBookedBusi());
									Id= (Integer)sessionFactory.getCurrentSession().save(flightUpdateEntity);
									sessionFactory.getCurrentSession().delete(chkList);
															}
										}
		else{			System.out.println("in else......new entry");
									FlightUpdateEntity flightUpdateEntity=new FlightUpdateEntity();
									flightUpdateEntity.setFlightId(flightUpdateModel.getFlightId());
									flightUpdateEntity.setDates(flightUpdateModel.getDates());
									flightUpdateEntity.setAvailableEco(flightUpdateModel.getAvailableEco());
									flightUpdateEntity.setAvailableBusi(flightUpdateModel.getAvailableBusi());
									flightUpdateEntity.setBookedEco(flightUpdateModel.getBookedEco());
									flightUpdateEntity.setBookedBusi(flightUpdateModel.getBookedBusi());
									Id= (Integer)sessionFactory.getCurrentSession().save(flightUpdateEntity);

			}
		return Id;

}

	@Override
	public List<FlightUpdateEntity> updateAvailableSeats() {
		String query="SELECT * FROM FLIGHT_UPDATED";
		List<FlightUpdateEntity> flightBookedList = jdbcTemplate.query(query, new RowMapper<FlightUpdateEntity> () {
	
				@Override
				public FlightUpdateEntity mapRow (ResultSet rs,int rowNumber){
					FlightUpdateEntity flightUpdatedEntity=new FlightUpdateEntity();
					try{
						flightUpdatedEntity.setUpdateId(rs.getInt(1));
						flightUpdatedEntity.setAvailableBusi(rs.getInt(2));
						flightUpdatedEntity.setAvailableEco(rs.getInt(3));
						flightUpdatedEntity.setBookedBusi(rs.getInt(4));
						flightUpdatedEntity.setBookedEco(rs.getInt(5));
						flightUpdatedEntity.setDates(rs.getString(6));
						flightUpdatedEntity.setFlightId(rs.getString(7));
							return flightUpdatedEntity;
						}catch (SQLException e){
							e.printStackTrace();
						}
							return null ;
						}
				});
		return flightBookedList;

	}
	


}


