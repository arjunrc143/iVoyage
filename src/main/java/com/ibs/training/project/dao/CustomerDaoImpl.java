package com.ibs.training.project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ibs.training.project.entity.CustomerEntity;
import com.ibs.training.project.entity.FlightBookingsEntity;

@Repository("customerEntity")
public class CustomerDaoImpl implements CustomerDaoInterface {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public int save(CustomerEntity customerEntity) {
		// TODO Auto-generated method stub
		Integer Id= (Integer) sessionFactory.getCurrentSession().save(customerEntity);
		return Id;
	}

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<CustomerEntity> viewCustomer() {
		// TODO Auto-generated method stub

		List<CustomerEntity> customerDetails = jdbcTemplate.query("SELECT * FROM CUSTOMER_TABLE", new RowMapper<CustomerEntity> () {

			@Override
			public CustomerEntity mapRow (ResultSet rs,int rowNumber){
				CustomerEntity customerEntity = new CustomerEntity();
				try{
					customerEntity.setCustomerId(rs.getInt(1));
					customerEntity.setFirstName(rs.getString(2));
					customerEntity.setGender(rs.getString(3));
					customerEntity.setLastName(rs.getString(4));
					customerEntity.setMobile(rs.getString(5));
					return customerEntity;
				}catch (SQLException e){
					e.printStackTrace();
				}
				return null;
			}
		});

		return customerDetails;
	}

	@Override
	public void deleteCustomer(CustomerEntity entity) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(entity);	
	}
}
