package com.ibs.training.project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mainController")
public class MainController {

	@RequestMapping(value="/admin",method = RequestMethod.GET) 
	public String adminView(){
		return "admin";  
	} 

	@RequestMapping(value="/",method = RequestMethod.GET) 
	public String initialView(){
		return "flightsearch";  
	}

	@RequestMapping(value="/flightsearch",method = RequestMethod.GET) 
	public String navView2(){
		return "flightsearch";  
	}

	@RequestMapping(value="/hotelsearch",method = RequestMethod.GET) 
	public String navView(){
		return "hotelsearch";  
	} 

	@RequestMapping(value="/success",method = RequestMethod.GET) 
	public String successView(){
		return "dashboard";  
	} 

	@RequestMapping(value="/cancel",method = RequestMethod.GET) 
	public String cancelView(){
		return "cancel";  
	} 

}