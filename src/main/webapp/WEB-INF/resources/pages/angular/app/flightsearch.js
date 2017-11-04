/**
 * 
 */
//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css
var app=angular.module("flightSearch",['ngRoute','ngMaterial', 'ngMessages', 'material.svgAssetsCache']);


app.config(['$routeProvider', function($routeProvider) {
	$routeProvider.

	when('/', {
		templateUrl: 'flightSearch.htm'
	}).

	when('/searchPage', {
		templateUrl: 'searchPage.htm'
	}).

	when('/custPage', {
		templateUrl: 'custPage.htm'
	}).
	when('/confirmation', {
		templateUrl: 'confirmation.htm'
	}).
	when('/final', {
		templateUrl: 'final.htm'
	}).   
	otherwise({
		redirectTo: '/'
	});

}]);


app.controller("flightcontroller",function($scope,$http,$window){


	
	$scope.view=0;
	$scope.noflight="";
	$scope.flightDetails=[];
	$scope.list=[[]];
	$scope.flightform={

			flightorigin:"",
			flightdestination:"",
			departuredate:"", 
	};
	$scope.date={
		depdate:"",	
	};
	$scope.customerform={

			firstName:"",
			lastName:"",
			gender:"",
			mobile:"",
	};
	$scope.routeDetails={

			flightId:"",
			airlineId:"",
			airlineName:"",
			fromLocation:"",
			toLocation:"",
			departureTime:"",
			arrivalTime:"",
			totalSeatEconomy:"",
			totalSeatBusiness:"",
			baggageLimit:"",
			priceEconomy:"",
			priceBusiness:"",
	};

	$scope.bookingDetails={
			routeList:[],
			mobile:"",
			nes:"",
			nbs:"",

	};

	$scope.flightNav = function () {
		window.location.href="http://localhost:8080/iVoyage/";
	};

	$scope.hotelNav = function () {
		window.location.href="http://localhost:8080/iVoyage/hotelsearch";
	};

	$scope.cancelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/cancel";
	};

	/*FLIGHT SEARCH*/
	
	
	function convert(str) {
	    var date = new Date(str),
	        mnth = ("0" + (date.getMonth()+1)).slice(-2),
	        day  = ("0" + date.getDate()).slice(-2);
	    return [ date.getFullYear(), mnth, day ].join("-");
	}
	
	
	$scope.submitSearch =function(){


/*		if(!$scope.flightform.departuredate.match(/^[0-9]{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])/))
		{
			console.log("in fn");
			alert('WRONG DATE FORMAT');
			return false;
		}*/

		$scope.flightform.departuredate=convert($scope.date.depdate);
		
		
		var method="POST";
		var url="http://localhost:8080/iVoyage/flightsearch";

		console.log($scope.flightform);

		$http({
			method : method,
			url : url,
			data : angular.toJson($scope.flightform),
			headers : {
				'Content-Type' : 'application/json'
			}  
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.list=data;
			console.log($scope.list);
			$scope.view=1;
			window.location.href="http://localhost:8080/iVoyage/#/searchPage";
//			$window.location.replace('http://localhost:8080/iVoyage/searchresults');

		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.noflights="No Flights Found";
			$scope.view=0;
		});
	};


	/*BOOK FLIGHT*/
	$scope.bookFlight= function(index){

		console.log("In bookFlight");
		console.log($scope.list[index]);
		$scope.bookingDetails.routeList=$scope.list[index];
		$scope.bookedId="";
		$scope.bookedPrice="";
		$scope.bookedCustomerId="";
		$scope.bookedFlightId="";

		$http({
			method : "POST",
			url : "http://localhost:8080/iVoyage/flightsearch/addBooking",
			data : angular.toJson($scope.list[index]),
			headers : {
				'Content-Type' : 'application/json'
			}  
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.view=2;
			window.location.href="http://localhost:8080/iVoyage/#/custPage";

		}).error(function(response) {
			console.log("error"+" "+response);

		});
	};

	/*CUSTOMER DETAILS*/

	$scope.submitCustomer=function(){

		var no=/^[0-9]+$/;
		if($scope.customerform.mobile.length!=10 || !no.test($scope.customerform.mobile))
		{
			console.log('in -fn');
			alert('invalid number');
			return false;
		}


		var method="POST";
		var url="http://localhost:8080/iVoyage/hotelsearch/addCustomer";
		$scope.bookingDetails.mobile=$scope.customerform.mobile;
		console.log($scope.customerform);
		console.log($scope.bookingDetails);

		$http({
			method : method,
			url : url,
			data : angular.toJson($scope.customerform),
			headers : {
				'Content-Type' : 'application/json'
			}  
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.view=3;
			console.log($scope.show);
			window.location.href="http://localhost:8080/iVoyage/#/confirmation";
		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.noflights="Something went wrong!!";
		});
	};
	$scope.inview=0;
	$scope.Hotelform={
			location:"",
			checkInDate:"",
			checkOutDate:"", 
	};
	$scope.Hotelform.checkInDate=$scope.flightform.departuredate;
	$scope.Hotelform.checkOutDate=$scope.flightform.departuredate;
	$scope.findHotel=function(index){
		console.log("in findHotel");
		$scope.Hotelform.location=$scope.bookingDetails.routeList[index].toLocation;
		var method="POST";
		var url="http://localhost:8080/iVoyage/hotelsearch";
		console.log($scope.Hotelform);
		$http({
			method : method,
			url : url,
			data : angular.toJson($scope.Hotelform),
			headers : {
				'Content-Type' : 'application/json'
			}  
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.hotelDetails=data;
			console.log($scope.hotelDetails);
			$scope.inview=1;
//			$window.location.replace('http://localhost:8080/iVoyage/searchresults');

		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.inview=1;
			$scope.noHotels="No Hotels Available";
		});
	};




	/* CONFIRM BOOKING  */
	$scope.bookedFlights={
			bookingId:"",
			customerId:"",
			flightId:"",
			price:"",
	};
	
	
	$scope.confirmBooking = function (){
		$scope.firstFlight=""; 

		if($scope.bookingDetails.nes==0 && $scope.bookingDetails.nbs==0)
		{

			alert("Not possible!");
			return false;

		}
		
			
		console.log($scope.bookingDetails);

		$http({
			method : "POST",
			url : "http://localhost:8080/iVoyage/flightsearch/confirmBooking",
			data : angular.toJson($scope.bookingDetails),
			headers : {
				'Content-Type' : 'application/json'
			}  
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.bookedFlights=data;
			console.log($scope.bookedFlights);
			$scope.firstFlight=$scope.bookedFlights[0];
			console.log($scope.firstFlight);
			$scope.bookedId=$scope.firstFlight.bookingId;
			$scope.bookedPrice=$scope.firstFlight.price;
			$scope.bookedFlightId=$scope.firstFlight.flightId;
			$scope.bookedCustomerId=$scope.firstFlight.customerId;
			console.log($scope.bookedFlightId);
			console.log($scope.bookedPrice);
			$scope.flightUpdate();
			//$scope.view=4; 
			window.location.href="http://localhost:8080/iVoyage/#/final";
		}).error(function(response) {
			console.log("error"+" "+response);

		});

	};

	/* update flight Seats*/
	$scope.flightSeatUpdate={
			departureDate:"",
			bookedEco:"",
			bookedBusi:"",
			routes:""

	};
	$scope.flightUpdate=function()
	{
		console.log("---In flightUpdate(----)");
		$scope.flightSeatUpdate.departureDate=$scope.flightform.departuredate;
		$scope.flightSeatUpdate.bookedEco=$scope.bookingDetails.nes;
		$scope.flightSeatUpdate.bookedBusi=$scope.bookingDetails.nbs;
		$scope.flightSeatUpdate.routes=$scope.bookingDetails.routeList;

		var method="POST";

		var url="http://localhost:8080/iVoyage/flightsearch/updateFlight";

		console.log($scope.flightSeatUpdate.departureDate);

		console.log($scope.flightSeatUpdate.bookedEco);
		console.log($scope.flightSeatUpdate.routes[0].flightId);

		$http({
			method : method,
			url : url,
			data : angular.toJson($scope.flightSeatUpdate),
			headers : {
				'Content-Type' : 'application/json'
			}  
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.view=4;


		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.noHotels="Something went wrong!!";
		});


	};


	/* cancel booking */


	$scope.cancelBooking=function(){


		$http({
			method : 'DELETE',
			url : 'http://localhost:8080/iVoyage/flightsearch/deleteCustomer/'+$scope.customerform.mobile
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$window.location.href="http://localhost:8080/iVoyage/"; 
		}).error(function(response) {
			console.log("error"+" "+response);

		});


	};

	
	$scope.setOrder = function (order) {
		console.log(order);
		$scope.order = order;
	};

});
