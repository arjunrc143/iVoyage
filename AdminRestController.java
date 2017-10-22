package com.ibs.training.project.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ibs.training.project.model.AdminModel;
import com.ibs.training.project.service.AdminServiceInterface;

@RestController
public class AdminRestController {
	

	@Autowired
	private HttpServletRequest request;
/*	@Autowired
	private AdminServiceInterface adminService;*/
	
	/*@RequestMapping(value="/admin",method = RequestMethod.GET,headers="Accept=application/json") 
    public List show(){
	//	List<AdminModel> temp=adminService.adminDetails();
      //   return temp; 
		AdminModel model=new AdminModel();
		model.setUsername("admin");
		model.setPassword("admin");
		List<AdminModel> temp=new ArrayList<AdminModel>();
		temp.add(model);
		return temp;
    } */ 

	@RequestMapping(value = "/admin", method = RequestMethod.POST, headers = "Accept=application/json")
	 public ResponseEntity<String> validateUser(@RequestBody AdminModel model) {
	  
		System.out.println(model.getPassword()+" "+model.getUsername());
		String status="false";
		
		if(model.getUsername().equals("admin") && model.getPassword().equals("admin"))
		{	status="true";
		return new ResponseEntity<>(status,HttpStatus.OK);
		}
		System.out.println(status);
		return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
	 }
	
}
