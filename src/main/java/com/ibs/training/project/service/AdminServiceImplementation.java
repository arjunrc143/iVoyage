package com.ibs.training.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibs.training.project.dao.AdminDaoInterface;
import com.ibs.training.project.entity.AdminEntity;
import com.ibs.training.project.model.AdminModel;

@Service("adminService")
public class AdminServiceImplementation implements AdminServiceInterface {

	@Autowired
	private AdminDaoInterface adminDao;

	@Override
	public List<AdminModel> adminDetails() {
		// TODO Auto-generated method stub

		List<AdminEntity> adminDetails=adminDao.adminDetails();
		List<AdminModel> adminDetailsTo=new ArrayList<AdminModel>();

		for(AdminEntity entity:adminDetails){
			AdminModel model=new AdminModel();
			model.setUsername(entity.getUsername());
			model.setPassword(entity.getPassword());
			adminDetailsTo.add(model);
		}
		return adminDetailsTo;
	}

}
