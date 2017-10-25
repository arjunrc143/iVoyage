package com.ibs.training.project.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibs.training.project.entity.CustomerEntity;

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

}
