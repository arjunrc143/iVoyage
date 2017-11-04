package com.ibs.training.project.service;

import java.util.List;

import com.ibs.training.project.entity.CustomerEntity;
import com.ibs.training.project.model.CustomerModel;

public interface CustomerServiceInterface {

	public int saveCustomer(CustomerModel customerModel);

	public List<CustomerEntity> viewCustomer();

	public void deleteCustomer(CustomerEntity entity);

}
