/**
 * 
 */
var app=angular.module("Dashboard",['ngRoute']);
//Controllers
app.controller("dashboardController",function($scope,$http,$window,$location){
	$scope.show="";
	$scope.flightNav=function (){
		window.location.href="http://localhost:8080/iVoyage/";
	};

	$scope.hotelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/hotelsearch";
	};

	$scope.cancelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/cancel";
	};
	$scope.viewFlights = function() {
		console.log("view flights");
		$scope.show=1;
		$scope.flightDetails=[];
		$scope.flightsDetail={

				flightId:"",
				airlineId:"",
				airlineName:"",
				fromLocation:"",
				toLocation:"",
				totalSeatEconomy:"",
				totalSeatBusiness:"",
				baggageLimit:"",
				departureTime:"",
				arrivalTime:"",
				priceEconomy:"",
				priceBusiness:""
		};

		_flightsData();

		function _flightsData(){

			console.log("in _flightsData")

			$http({
				method:'GET',
				url:'http://localhost:8080/iVoyage/success/fd'
			}).then(function successCallback(response){
				$scope.flightDetails=response.data;
//				console.log(respose.data);
			}, function errorCallback(response) {
				console.log(response.statusText);
			}); 
		}

	}
	$scope.viewHotels = function() {
		console.log("view Hotels");
		$scope.show=2;
		$scope.hotelDetails=[];
		$scope.hotelsDetail={

				hotelId:"",
				hotelName:"",
				location:"",
				totalRoomsAc:"",
				totalRoomsNonAc:"",
				priceAc:"",
				priceNonAc:""
		};

		_hotelsData();

		function _hotelsData(){

			console.log("in _hotelsData")

			$http({
				method:'GET',
				url:'http://localhost:8080/iVoyage/success/hd'
			}).then(function successCallback(response){
				$scope.hotelDetails=response.data;
				//console.log(respose.data);
			}, function errorCallback(response) {
				console.log(response.statusText);
			}); 
		}
	}

	$scope.viewBkFlights = function() {
		console.log("view Booked flights");
		$scope.show=3;
		$scope.flightBookings={
				bookingId:"",
				customerId:"",
				flightId:"",
				price:""	
		}
		_flightBookingsData();


		function _flightBookingsData() {
			console.log("in _flightBookingsData")

			$http({
				method:'GET',
				url:'http://localhost:8080/iVoyage/success/fb'
			}).then(function successCallback(response){
				$scope.flightBookings=response.data;
				//console.log(respose.data);
			}, function errorCallback(response) {
				console.log(response.statusText);
			}); 
		}

	}


	$scope.viewBkHotels = function() {
		console.log("view Booked Hotels");
		$scope.show=4;
		$scope.bookingDetails=[];
		$scope.hotelBookings={
				bookingId:"",
				customerId:"",
				hotelId:"",
				price:""
		};

		_hotelBookingsData();


		function _hotelBookingsData() {
			console.log("in _hotelBookingsData")

			$http({
				method:'GET',
				url:'http://localhost:8080/iVoyage/success/hb'
			}).then(function successCallback(response){
				$scope.hotelBookings=response.data;
				//console.log(respose.data);
			}, function errorCallback(response) {
				console.log(response.statusText);
			}); 
		}
	};



	$scope.addFlights = function() {
		console.log("add flights");
		$scope.show=5;
		$scope.addflight=[];
		$scope.addflight={

				flightId:"",
				airlineId:"",
				airlineName:"",
				fromLocation:"",
				toLocation:"",
				totalSeatEconomy:"",
				totalSeatBusiness:"",
				baggageLimit:"",
				departureTime:"",
				arrivalTime:"",
				priceEconomy:"",
				priceBusiness:""
		};

		$scope.submitFlight=function(){
			var method="POST";
			var url="http://localhost:8080/iVoyage/success/af";
			console.log("in js");

			$http({
				method : method,
				url : url,
				data : angular.toJson($scope.addflight),
				headers : {
					'Content-Type' : 'application/json'
				}  
			}).success(function(data,status,headers,config) {
				console.log("success"+" "+data);
				console.log("var"+" "+status);
				$scope.show=0;
				//window.location.href="http://localhost:8080/iVoyage/success";
			}).error(function(response) {
				console.log("error"+" "+response);
				$scope.noflights="Something went wrong!!";
			});
		};

	};

	$scope.addHotels = function() {
		console.log("add hotels");
		$scope.show=6;
		$scope.addhotel=[];
		$scope.addhotel={

				hotelId:"",
				hotelName:"",
				location:"",
				totalRoomsAc:"",
				totalRoomsNonAc:"",
				priceAc:"",
				priceNonAc:""
		};

		$scope.submitHotel=function(){

			var method="POST";
			var url="http://localhost:8080/iVoyage/success/ah";

			console.log("in js");


			$http({
				method : method,
				url : url,
				data : angular.toJson($scope.addhotel),
				headers : {
					'Content-Type' : 'application/json'
				}  
			}).success(function(data,status,headers,config) {
				console.log("success"+" "+data);
				console.log("var"+" "+status);
				$scope.show=0;
				//window.location.href="http://localhost:8080/iVoyage/success";
			}).error(function(response) {
				console.log("error"+" "+response);
				$scope.nohotels="Something went wrong!!";
			});
		};



	};







});