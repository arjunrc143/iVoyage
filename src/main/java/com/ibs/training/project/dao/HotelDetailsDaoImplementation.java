package com.ibs.training.project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ibs.training.project.entity.FlightDetailsEntity;
import com.ibs.training.project.entity.HotelDetailsEntity;
import com.ibs.training.project.model.HotelDetailsModel;

@Repository("hotelDetailsEntity")
public class HotelDetailsDaoImplementation implements HotelDetailsDaoInterface {

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<HotelDetailsEntity> viewHotel() {
		// TODO Auto-generated method stub
		List<HotelDetailsEntity> hotelDetails = jdbcTemplate.query("SELECT * FROM HOTEL_DETAILS", new RowMapper<HotelDetailsEntity> () {

			@Override
			public HotelDetailsEntity mapRow (ResultSet rs,int rowNumber){
				HotelDetailsEntity hotelDetailsEntity = new HotelDetailsEntity();
				try{
					hotelDetailsEntity.setHotelId(rs.getString(1));
					hotelDetailsEntity.setHotelName(rs.getString(2));
					hotelDetailsEntity.setLocation(rs.getString(3));
					hotelDetailsEntity.setTotalRoomsAc(rs.getInt(4));
					hotelDetailsEntity.setTotalRoomsNonAc(rs.getInt(5));
					hotelDetailsEntity.setPriceAc(rs.getInt(6));
					hotelDetailsEntity.setPriceNonAc(rs.getInt(7));
					return hotelDetailsEntity;
				}catch (SQLException e){
					e.printStackTrace();
				}
				return null;
			}
		});

		return hotelDetails;
	}

	@Override

	public String addHotels(HotelDetailsEntity hentity){
		String Id= (String) sessionFactory.getCurrentSession().save(hentity);
		return Id;
	}
}
