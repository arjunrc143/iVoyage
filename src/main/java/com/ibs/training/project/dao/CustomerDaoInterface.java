package com.ibs.training.project.dao;

import java.util.List;

import com.ibs.training.project.entity.CustomerEntity;

public interface CustomerDaoInterface {

	public int save(CustomerEntity customerEntity);

	public List<CustomerEntity> viewCustomer();

	public void deleteCustomer(CustomerEntity entity);

}
