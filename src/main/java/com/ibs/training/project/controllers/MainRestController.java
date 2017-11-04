package com.ibs.training.project.controllers;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ibs.training.project.entity.CustomerEntity;
import com.ibs.training.project.model.AdminModel;
import com.ibs.training.project.model.BookingDetailsIncomingModel;
import com.ibs.training.project.model.CustomerModel;
import com.ibs.training.project.model.FlightBookingsModel;
import com.ibs.training.project.model.FlightDetailsModel;
import com.ibs.training.project.model.FlightModel;
import com.ibs.training.project.model.FlightUpdateListModel;
import com.ibs.training.project.model.HotelBookConfirmModel;
import com.ibs.training.project.model.HotelBookingsModel;
import com.ibs.training.project.model.HotelDetailsModel;
import com.ibs.training.project.model.HotelSearchModel;
import com.ibs.training.project.model.HotelUpdateModel;
import com.ibs.training.project.service.AdminServiceInterface;
import com.ibs.training.project.service.CustomerServiceInterface;
import com.ibs.training.project.service.FlightBookingsServiceInterface;
import com.ibs.training.project.service.FlightDetailsServiceInterface;
import com.ibs.training.project.service.HotelBookingsServiceInterface;
import com.ibs.training.project.service.HotelDetailsServiceInterface;
import com.ibs.training.project.service.Search;

@RestController
public class MainRestController {


	@Autowired
	private HttpServletRequest request;

	@Autowired
	private FlightDetailsServiceInterface flightDetailsServiceInterface;

	@RequestMapping(value="/success/fd",method = RequestMethod.GET,headers="Accept=application/json") 
	public List show(){
		List<FlightDetailsModel> temp=flightDetailsServiceInterface.viewFlight();
		return temp;
	} 

	@Autowired
	private HotelDetailsServiceInterface hotelDetailsService;

	@RequestMapping(value="/success/hd",method = RequestMethod.GET,headers="Accept=application/json") 
	public List showhd(){
		List<HotelDetailsModel> temp=hotelDetailsService.viewHotel();
		return temp;
	} 
	@RequestMapping(value = "/flightsearch/addBooking", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> addBooking(@RequestBody List<FlightDetailsModel> list) {
		String status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
	}
	@Autowired
	private AdminServiceInterface adminService;

	@RequestMapping(value = "/admin", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> validateUser(@RequestBody AdminModel model) {
		String status="false";
		List<AdminModel> adminDetails=adminService.adminDetails();
		for(AdminModel adminModel:adminDetails){
			if(model.getUsername().equals(adminModel.getUsername()) && model.getPassword().equals(adminModel.getPassword()))
			{	status="true";
			}
		}

		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
	}	


	@Autowired
	private HotelBookingsServiceInterface hotelBookingsService;
	@RequestMapping(value="/success/hb",method = RequestMethod.GET,headers="Accept=application/json")
	public List showhb(){
		List<HotelBookingsModel> temp=hotelBookingsService.viewHotelBookings();
		return temp;
	}

	@Autowired
	private FlightBookingsServiceInterface flightBookingsService;

	@RequestMapping(value="/success/fb",method = RequestMethod.GET,headers="Accept=application/json")
	public List showfb(){
		List<FlightBookingsModel> temp=flightBookingsService.viewFlightBookings();
		return temp;
	}


	@RequestMapping(value="/success/af",method = RequestMethod.POST,headers="Accept=application/json") 
	public ResponseEntity<String> addFlights(@RequestBody FlightDetailsModel model) {
		String status="true";
		String stat=flightDetailsServiceInterface.addFlights(model);
		if(stat!="")
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
	}

	@RequestMapping(value="/success/ah",method = RequestMethod.POST,headers="Accept=application/json") 
	public ResponseEntity<String> addHotels(@RequestBody HotelDetailsModel model) {
		String status="true";
		String stat=hotelDetailsService.addHotels(model);
		if(stat!="")
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
	}



	/*----FLIGHT---*/

	@RequestMapping(value = "/flightsearch", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<List<List<FlightDetailsModel>>> flightSearch(@RequestBody FlightModel model) {

		String status="false";

		System.out.println(model.getDeparturedate()+" "+model.getFlightdestination()+" "+model.getFlightorigin());



		List<FlightDetailsModel> temp=flightDetailsServiceInterface.viewFlight();

		Search search=new Search();
		LinkedList<LinkedList<String>> routeList=search.flightsearch(model.getFlightorigin(),model.getFlightdestination(),temp);

		/* */

		List<FlightDetailsModel> routes=new ArrayList<FlightDetailsModel>();
		List<FlightDetailsModel> routesClear=new ArrayList<FlightDetailsModel>();
		List<List<FlightDetailsModel>> diffRoutes=new ArrayList<List<FlightDetailsModel>>();

		String src,dest;

		for(int i=0;i<routeList.size();i++){

			LinkedList<String> route=routeList.get(i);

			for(int j=0;j<route.size()-1;j++){

				src=route.get(j);
				dest=route.get(j+1);

				for(FlightDetailsModel flight:temp){

					if(flight.getFromLocation().equals(src) && flight.getToLocation().equals(dest)){
						routes.add(flight);
						routesClear.add(flight);
						break;
					}
				}

			}
			List<FlightDetailsModel>	finalRoutesList=flightBookingsService.updateAvailableSeats(routesClear,model.getDeparturedate());
			if(!finalRoutesList.isEmpty())
			{

				for(FlightDetailsModel chkList:finalRoutesList){
				}
				diffRoutes.add(finalRoutesList);
			}
			else
			{
				diffRoutes.add(routesClear);
			}
			routesClear=new ArrayList<FlightDetailsModel>();

		}


		for(FlightDetailsModel route:routes){
			status="true";
		}

		if(status.equals("true"))
			return new ResponseEntity<>(diffRoutes,HttpStatus.OK);
			else
				return new ResponseEntity<>(diffRoutes,HttpStatus.NOT_FOUND);

	}
	/*update flight*/
	@RequestMapping(value="/flightsearch/updateFlight",method=RequestMethod.POST,headers="Accept=application/json")
	public ResponseEntity<String>  flightUpdation(@RequestBody FlightUpdateListModel model) throws ParseException{

		//cusMobile and price moves to next layer to get entered in hotel bookings table
		String status="false";
		int stat=flightBookingsService.saveUpdateFlight(model);
		if(stat>=0)
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else	
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);		

	}

	@RequestMapping(value = "/flightsearch/confirmBooking", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<List<FlightBookingsModel>> confirmBooking(@RequestBody BookingDetailsIncomingModel model) {
		String status="true";
		List<FlightBookingsModel> bookedFlights=flightBookingsService.bookedFlights(model);
		if(status.equals("true"))
			return new ResponseEntity<>(bookedFlights,HttpStatus.OK);
			else
				return new ResponseEntity<>(bookedFlights,HttpStatus.NOT_FOUND);
	}

	@RequestMapping(value = "/flightsearch/deleteCustomer/{mobile}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public void deleteCountry(@PathVariable("mobile") String mobile) {
		List<CustomerEntity> listCustomer=customerService.viewCustomer();
		for(CustomerEntity entity:listCustomer){
			if(entity.getMobile().equals(mobile)){
				customerService.deleteCustomer(entity);
				break;
			}
		}
	} 


	@RequestMapping(value="/cancelBooking/flight/{bookingId}/{customerId}",method=RequestMethod.DELETE,headers="Accept=application/json")
	public ResponseEntity<String> cancelFlight(@PathVariable("bookingId") String bookingId,@PathVariable("customerId") int customerId){
		String status="false";
		int stat=flightBookingsService.cancelFlight(bookingId, customerId);
		if(stat==1)
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else	
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);		
	}




	/*--------HOTEL--------*/
	@RequestMapping(value = "/hotelsearch", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<List<HotelDetailsModel>> hotelSearch(@RequestBody HotelSearchModel model) {
		String status="false";
		List<HotelDetailsModel> temp=hotelDetailsService.viewHotel();
		List<HotelDetailsModel> filteredList = new ArrayList<>();
		for(HotelDetailsModel chkModel:temp){
			if(chkModel.getLocation().equals(model.getLocation())){
				filteredList.add(chkModel);
				status="true";
			}
		}
		List<HotelDetailsModel>	filteredListnew=hotelBookingsService.updateAvailableRooms(filteredList,model.getCheckInDate());
		if(status.equals("true"))
			return new ResponseEntity<>(filteredListnew,HttpStatus.OK);
			else
				return new ResponseEntity<>(filteredListnew,HttpStatus.NOT_FOUND);
	}

	@Autowired
	CustomerServiceInterface customerService;

	@RequestMapping(value = "/hotelsearch/addCustomer", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> addCustomer(@RequestBody CustomerModel model) {
		String status="false";
		int stat=customerService.saveCustomer(model);
		if(stat>=0)
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);
	}





	@RequestMapping(value="/hotelsearch/submitHotel",method=RequestMethod.POST,headers="Accept=application/json")
	public ResponseEntity<Integer>  bookingConfirmation(@RequestBody HotelBookConfirmModel model){
		String status="false";
		String customermobile=model.getMobile();
		int customerId=hotelBookingsService.saveHotelBookings(model,customermobile);
		if(customerId>=0)
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(customerId,HttpStatus.OK);
			else	
				return new ResponseEntity<>(customerId,HttpStatus.NOT_FOUND);		
	}

	@RequestMapping(value="/hotelsearch/updateHotel",method=RequestMethod.POST,headers="Accept=application/json")
	public ResponseEntity<String>  bookingConfirmation(@RequestBody HotelUpdateModel model) throws ParseException{
		String status="false";
		int stat=hotelBookingsService.saveUpdateHotel(model);
		if(stat>=0)
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else	
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);		
	}

	@RequestMapping(value="/hotelsearch/cancelHotel/{mobile}",method=RequestMethod.DELETE,headers="Accept=application/json")
	public ResponseEntity<String> cancelHotelBooking(@PathVariable("mobile") String mobile){
		String status="false";
		int stat=hotelBookingsService.cancelHotelBooking(mobile);
		if(stat==1)
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else	
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);		
	}

	@RequestMapping(value="/cancelBooking/hotel/{bookingId}/{customerId}",method=RequestMethod.DELETE,headers="Accept=application/json")
	public ResponseEntity<String> cancelHotel(@PathVariable("bookingId") String bookingId,@PathVariable("customerId") int customerId){
		String status="false";
		int stat=hotelBookingsService.cancelHotel(bookingId, customerId);
		if(stat==1)
			status="true";
		if(status.equals("true"))
			return new ResponseEntity<>(status,HttpStatus.OK);
			else	
				return new ResponseEntity<>(status,HttpStatus.NOT_FOUND);		
	}


}