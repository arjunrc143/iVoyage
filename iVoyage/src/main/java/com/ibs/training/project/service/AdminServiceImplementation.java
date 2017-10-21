package com.ibs.training.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibs.training.project.dao.AdminDaoInterface;
import com.ibs.training.project.model.AdminModel;

@Service("adminService")
public class AdminServiceImplementation implements AdminServiceInterface {

	@Autowired
	private AdminDaoInterface adminDao; 
	
	@Override
	public List<AdminModel> adminDetails() {
		// TODO Auto-generated method stub
		
	
		return null;
	}

}
