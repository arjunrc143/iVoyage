/**
 * 
 */
var app=angular.module("hotelSearch",['ngRoute']);


app.config(['$routeProvider', function($routeProvider) {
	$routeProvider.

	when('/hotelsearch', {
		templateUrl: 'hotelSearch.htm'
	}).

	when('/searchPages', {
		templateUrl: 'searchPages.htm'
	}).

	when('/custPages', {
		templateUrl: 'custPages.htm'
	}).
	when('/confirmations', {
		templateUrl: 'confirmations.htm'
	}).
	when('/bookView', {
		templateUrl: 'bookView.htm'
	}).   
	otherwise({
		redirectTo: '/hotelsearch'
	});

}]);


app.controller("hotelSearchController",function($scope,$http,$window){
	$scope.ind=0;
	$scope.nohotels="";
	$scope.show=0;
	$scope.hotelDetails=[];

	$scope.name="";
	$scope.Hotelform={
			location:"",
			checkInDate:""

	};

	$scope.flightNav=function (){
		window.location.href="http://localhost:8080/iVoyage/";
	};

	$scope.hotelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/hotelsearch";
	};

	$scope.cancelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/cancel";
	};

	/* SEARCH HOTEL */	
	
	$scope.date={
			depdate:"",	
		};
	
	function convert(str) {
	    var date = new Date(str),
	        mnth = ("0" + (date.getMonth()+1)).slice(-2),
	        day  = ("0" + date.getDate()).slice(-2);
	    return [ date.getFullYear(), mnth, day ].join("-");
	}

	$scope.hotelSearch =function(){

		$scope.Hotelform.checkInDate=convert($scope.date.depdate);

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
			$scope.show=1;
			window.location.href="http://localhost:8080/iVoyage/hotelsearch#/searchPages";
			//$window.location.replace('http://localhost:8080/iVoyage/searchresults');

		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.noHotels="No Hotels Available";
		});
	};
	/*BOOK HOTEL*/
	$scope.bookHotel= function(index){
		console.log("In bookHotel");
		console.log($scope.hotelDetails[index].hotelId);
		$scope.currentBookId=$scope.hotelDetails[index].hotelId;
		$scope.ind=index;
		$scope.show=2;
		window.location.href="http://localhost:8080/iVoyage/hotelsearch#/custPages";
	};

	/*CUSTOMER*/

	$scope.currentBookId="";
	$scope.customerDetails=[];
	$scope.customerform={
			firstName:"",
			lastName:"",
			gender:"",
			mobile:"",
	};
	$scope.submitCustomer=function(){


		var no=/^[0-9]+$/;
		if($scope.customerform.mobile.length!=10 || !no.test($scope.customerform.mobile))
		{
			alert('invalid number');
			return false;
		}


		var method="POST";
		var url="http://localhost:8080/iVoyage/hotelsearch/addCustomer";
		console.log($scope.customerform);
		console.log($scope.customerform.firstName);
		$scope.name=$scope.customerform.firstName;
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
			$scope.show=3;
			window.location.href="http://localhost:8080/iVoyage/hotelsearch#/bookView";

		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.noHotels="Something went wrong!!";
		});
	};

	/* HOTEL booking confirmation */
	$scope.totalPayment="";
	$scope.paymentform={
			days:"",
			ac:"",
			nonac:"",
	};   

	$scope.bookingToController={



			hotelId:"",

			mobile:"",

			payment:"",


	};


	$scope.payment=function(){

		console.log("In Payment()");

		$scope.bookingToController.hotelId=$scope.hotelDetails[$scope.ind].hotelId;

		$scope.bookingToController.mobile=$scope.customerform.mobile;

		$scope.days=0;

		$scope.acrooms=0;

		$scope.nonacrooms=0;

		$scope.priceAC=$scope.hotelDetails[$scope.ind].priceAc;



		$scope.priceNonAC=$scope.hotelDetails[$scope.ind].priceNonAc;

		$scope.days=$scope.paymentform.days;

		$scope.acrooms=$scope.paymentform.ac;

		$scope.nonacrooms=$scope.paymentform.nonac;



		$scope.totalPayment=(($scope.days * $scope.priceAC*$scope.acrooms)+($scope.days * $scope.priceNonAC*$scope.nonacrooms));



		$scope.bookingToController.payment=$scope.totalPayment;

		console.log( $scope.totalPayment);
	};

	$scope.confirmHotelBookings="";          
	$scope.submitHotelBooking=function(){


		if($scope.paymentform.ac==0 && $scope.paymentform.nonac==0){
			
			alert("Not Possible");
			return false;
		}

		$scope.payment();
		
		console.log("submitHotelBooking");

		var method="POST";

		var url="http://localhost:8080/iVoyage/hotelsearch/submitHotel";

		console.log($scope.bookingToController.hotelId);

		console.log($scope.bookingToController.payment);
		$http({
			method : method,
			url : url,
			data : angular.toJson($scope.bookingToController),
			headers : {
				'Content-Type' : 'application/json'
			}  
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.confirmHotelBookings=data;
			console.log($scope.confirmHotelBookings);

			$scope.cusId=$scope.confirmHotelBookings;
			$scope.bookingId=($scope.hotelDetails[$scope.ind].hotelId)+($scope.confirmHotelBookings);
			$scope.hId=$scope.bookingToController.hotelId;
			$scope.pri=$scope.bookingToController.payment;
			console.log($scope.cusId);
			console.log($scope.bookingId);
			console.log($scope.hId);
			console.log($scope.pri);
			$scope.hotelUpdate();




		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.noHotels="Something went wrong!!";
		});

	};          


	/*UPDATE HOTEL ROOMS*/
	$scope.hotelRoomUpdate={
			hotelId:"",
			date:"",
			noOfDays:"",
			bookedAC:"",
			bookedNonAC:"",
			availableAC:"",
			availableNonAC:""

	};
	$scope.hotelUpdate=function()
	{
		console.log("---In hotelUpdate(----)");
		$scope.hotelRoomUpdate.hotelId=$scope.hotelDetails[$scope.ind].hotelId;
		$scope.hotelRoomUpdate.date=$scope.Hotelform.checkInDate;
		$scope.hotelRoomUpdate.noOfDays=$scope.paymentform.days;
		$scope.hotelRoomUpdate.bookedAC=$scope.paymentform.ac;
		$scope.hotelRoomUpdate.bookedNonAC=$scope.paymentform.nonac;
		$scope.hotelRoomUpdate.availableAC=($scope.hotelDetails[$scope.ind].totalRoomsAc-$scope.paymentform.ac);
		$scope.hotelRoomUpdate.availableNonAC=($scope.hotelDetails[$scope.ind].totalRoomsNonAc-$scope.paymentform.nonac);
		var method="POST";

		var url="http://localhost:8080/iVoyage/hotelsearch/updateHotel";

		console.log($scope.hotelRoomUpdate.hotelId);

		console.log($scope.hotelRoomUpdate.date);
		console.log($scope.hotelRoomUpdate.availableNonAC);

		$http({
			method : method,
			url : url,
			data : angular.toJson($scope.hotelRoomUpdate),
			headers : {
				'Content-Type' : 'application/json'
			}  
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.show=4;
			window.location.href="http://localhost:8080/iVoyage/hotelsearch#/confirmations";

		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.noHotels="Something went wrong!!";
		});


	};
	/*  CANCEL BOOKING*/

	$scope.cancelHotelBooking=function(){

		console.log("cancelHotelBooking");

		var method="DELETE";

		var url="http://localhost:8080/iVoyage/hotelsearch/cancelHotel/"+$scope.customerform.mobile;
		console.log($scope.customerform.mobile);
		$http({
			method : method,
			url : url,
			}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$scope.show=4;
			$window.location.href="http://localhost:8080/iVoyage/hotelsearch";

		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.noHotels="Something went wrong in cancellation!!";
		});

	};           


	$scope.filterFunction = function(element) {
		return element.name.match(/^Ma/) ? true : false;
	};

	$scope.setOrder = function (order) {
		console.log(order);
		$scope.order = order;
	}; 

	/**/

});
