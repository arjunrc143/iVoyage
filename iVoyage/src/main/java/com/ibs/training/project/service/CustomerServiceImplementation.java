package com.ibs.training.project.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibs.training.project.dao.CustomerDaoInterface;
import com.ibs.training.project.entity.CustomerEntity;
import com.ibs.training.project.model.CustomerModel;

@Service("customerService")
public class CustomerServiceImplementation implements CustomerServiceInterface {

	@Autowired
	CustomerDaoInterface custDao;
	
	@Autowired
	CustomerModel customerModel;
	
	@Override
	@Transactional
	public int saveCustomer(CustomerModel customerModel) {
		// TODO Auto-generated method stub
		
		CustomerEntity customerEntity=new CustomerEntity();
		customerEntity.setFirstName(customerModel.getFirstName());
		customerEntity.setLastName(customerModel.getLastName());
		customerEntity.setGender(customerModel.getGender());
		customerEntity.setMobile(customerModel.getMobile());
		return custDao.save(customerEntity);
	}

}
