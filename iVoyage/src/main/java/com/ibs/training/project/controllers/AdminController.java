package com.ibs.training.project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adminController")
public class AdminController {

	@RequestMapping(value="/admin",method = RequestMethod.GET) 
    public String show(){
         return "admin";  
    }  
	
}
