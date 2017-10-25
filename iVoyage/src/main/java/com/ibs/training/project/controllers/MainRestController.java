package com.ibs.training.project.controllers;

import java.util.ArrayList;
import java.util.Collection;
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
import com.ibs.training.project.model.CustomerModel;
import com.ibs.training.project.model.FlightDetailsModel;
import com.ibs.training.project.model.FlightModel;
import com.ibs.training.project.model.HotelDetailsModel;
import com.ibs.training.project.model.HotelSearchModel;
import com.ibs.training.project.service.AdminServiceInterface;
import com.ibs.training.project.service.CustomerServiceInterface;
import com.ibs.training.project.service.FlightDetailsServiceInterface;
import com.ibs.training.project.service.HotelDetailsServiceInterface;

@RestController
public class MainRestController {
	

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

	@Autowired
	private FlightDetailsServiceInterface flightDetailsServiceInterface;
	
	@RequestMapping(value="/success",method = RequestMethod.GET,headers="Accept=application/json") 
    public List show(){
	//	List<AdminModel> temp=adminService.adminDetails();
      //   return temp; 
		
		System.out.println("Hit At Success From ViewFlights");
		
		List<FlightDetailsModel> temp=flightDetailsServiceInterface.viewFlight();
		
		System.out.println(temp);
		
		return temp;
    } 
	
	@Autowired
	private HotelDetailsServiceInterface hotelDetailsService;
	
	@RequestMapping(value="/success/hd",method = RequestMethod.GET,headers="Accept=application/json") 
    public List showhd(){
	//	List<AdminModel> temp=adminService.adminDetails();
      //   return temp; 
		
		System.out.println("Hit At Success From viewHotels");
		
		List<HotelDetailsModel> temp=hotelDetailsService.viewHotel();
		
		System.out.println(temp);
		
		return temp;
    } 
	
	
	@Autowired
	private AdminServiceInterface adminService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.POST, headers = "Accept=application/json")
	 public ResponseEntity<String> validateUser(@RequestBody AdminModel model) {
	  
		System.out.println(model.getPassword()+" "+model.getUsername());
		
		String status="false";
		
		List<AdminModel> adminDetails=adminService.adminDetails();
		System.out.println(adminDetails);
		
		for(AdminModel adminModel:adminDetails){
			if(model.getUsername().equals(adminModel.getUsername()) && model.getPassword().equals(adminModel.getPassword()))
			{	status="true";
			
			}
			//System.out.println(status);
			
		}
		
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
		else
			return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
	 }	
	
	
	@RequestMapping(value = "/flightsearch", method = RequestMethod.POST, headers = "Accept=application/json")
	 public ResponseEntity<String> flightSearch(@RequestBody FlightModel model) {
	  
		String status="true";
		
		System.out.println(model.getDeparturedate()+" "+model.getFlightdestination()+" "+model.getFlightorigin());
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
		else
			return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
		
	 }
	
	@RequestMapping(value = "/hotelsearch", method = RequestMethod.POST, headers = "Accept=application/json")
	 public ResponseEntity<List<HotelDetailsModel>> hotelSearch(@RequestBody HotelSearchModel model) {
	  
		String status="false";
		
		System.out.println(model.getLocation()+" "+model.getCheckInDate()+" "+model.getCheckOutDate());
		
		List<HotelDetailsModel> temp=hotelDetailsService.viewHotel();
		
		List<HotelDetailsModel> filteredList = new ArrayList<>();
		
		for(HotelDetailsModel chkModel:temp){
			if(chkModel.getLocation().equals(model.getLocation())){
				filteredList.add(chkModel);
				status="true";
			}
		}
		
		if(!filteredList.isEmpty())
		for(HotelDetailsModel chkList:filteredList){
			System.out.println(chkList.getHotelId()+" "+chkList.getLocation()+" "+chkList.getHotelName());
		}
		
		if(status.equals("true"))
			return new ResponseEntity<>(filteredList,HttpStatus.OK);
		else
			return new ResponseEntity<>(filteredList,HttpStatus.NOT_FOUND);
		
	 }
	
	@Autowired
	CustomerServiceInterface customerService;
	
	@RequestMapping(value = "/hotelsearch/addCustomer", method = RequestMethod.POST, headers = "Accept=application/json")
	 public ResponseEntity<String> addCustomer(@RequestBody CustomerModel model) {
	  
		
		String status="false";
		
		System.out.println(model.getFirstName()+" "+model.getLastName()+" "+model.getGender()+" "+model.getMobile());
		
		int stat=customerService.saveCustomer(model);
		
		if(stat>=0)
			status="true";
		
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
		else
			return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
		
	 }
	
}