package com.ibs.training.project.dao;

import com.ibs.training.project.entity.AdminEntity;

public interface AdminDaoInterface {
	
	public boolean authenticateUser(AdminEntity adminEntity);

}
