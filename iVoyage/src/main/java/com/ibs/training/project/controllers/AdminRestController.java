package com.ibs.training.project.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ibs.training.project.model.AdminModel;
import com.ibs.training.project.service.AdminServiceInterface;

@RestController
public class AdminRestController {
	

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AdminServiceInterface adminService;
	
	@RequestMapping(value="/admin",method = RequestMethod.GET,headers="Accept=application/json") 
    public List show(){
		List<AdminModel> temp=adminService.adminDetails();
         return temp;  
    }  

}
