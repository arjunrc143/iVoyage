package com.ibs.training.project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ibs.training.project.entity.AdminEntity;
import com.ibs.training.project.entity.FlightDetailsEntity;


@Repository("flightDetailsEntity")
public class FlightDetailsDaoImplementation implements FlightDetailsDaoInterface{

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<FlightDetailsEntity> viewFlight() {
		// TODO Auto-generated method stub

		List<FlightDetailsEntity> flightDetails = jdbcTemplate.query("SELECT * FROM FLIGHT_DETAILS", new RowMapper<FlightDetailsEntity> () {

			@Override
			public FlightDetailsEntity mapRow (ResultSet rs,int rowNumber){
				FlightDetailsEntity flightDetailsEntity = new FlightDetailsEntity();
				try{
					flightDetailsEntity.setFlightId(rs.getString(1));
					flightDetailsEntity.setAirlineId(rs.getString(2));
					flightDetailsEntity.setAirlineName(rs.getString(3));
					flightDetailsEntity.setFromLocation(rs.getString(4));
					flightDetailsEntity.setToLocation(rs.getString(5));
					flightDetailsEntity.setTotalSeatEconomy(rs.getInt(6));
					flightDetailsEntity.setTotalSeatBusiness(rs.getInt(7));
					flightDetailsEntity.setBaggageLimit(rs.getInt(8));
					flightDetailsEntity.setDepartureTime(rs.getString(9));
					flightDetailsEntity.setArrivalTime(rs.getString(10));
					flightDetailsEntity.setPriceEconomy(rs.getInt(11));
					flightDetailsEntity.setPriceBusiness(rs.getInt(12));


					return flightDetailsEntity;
				}catch (SQLException e){
					e.printStackTrace();
				}
				return null;
			}
		});

		return flightDetails;

	}

	@Override
	public String addFlights(FlightDetailsEntity fentity){
		String Id= (String) sessionFactory.getCurrentSession().save(fentity);
		return Id;
	}

}
