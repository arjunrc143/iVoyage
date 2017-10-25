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

@Repository("adminEntity")
public class AdminDaoImplementation implements AdminDaoInterface {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
  private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<AdminEntity> adminDetails() {
		// TODO Auto-generated method stub
						
		List<AdminEntity> adminDetails = jdbcTemplate.query("SELECT * FROM ADMINTABLE", new RowMapper<AdminEntity> () {
			
			@Override
			public AdminEntity mapRow (ResultSet rs,int rowNumber){
				AdminEntity adminEntity = new AdminEntity();
				try{
					adminEntity.setId(rs.getInt(1));
					adminEntity.setUsername(rs.getString(2));
					adminEntity.setPassword(rs.getString(3));
					return adminEntity;
				}catch (SQLException e){
					e.printStackTrace();
				}
				return null;
			}
		});
		if(adminDetails.isEmpty()){System.out.println("Nothing fetched");}
		
		System.out.println(adminDetails);
		
		return adminDetails;
	}
}	
