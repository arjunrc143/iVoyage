/**
 * 
 */
var app=angular.module("Dashboard",['ngRoute']);
		
		//Controllers
		
		app.controller("dashboardController",function($scope,$http,$window,$location){
		
			
			$scope.show="";
			
			$scope.flightNav=function (){
				window.location.href="http://192.168.38.93:8080/iVoyage/flightsearch";
			}

			$scope.hotelNav=function (){
				window.location.href="http://192.168.38.93:8080/iVoyage/hotelsearch";
			}
			
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
		            		departureTime:"",
		            		arrivalTime:"",
							totalSeatEconomy:"",
							totalSeatBusiness:"",
							baggageLimit:"",
		            		
		            };
				 
	             _flightsData();
	             
	             function _flightsData(){
	            	 
	            	 console.log("in _flightsData")
	            	 
	 				$http({
	 					method:'GET',
	 					url:'http://192.168.38.93:8080/iVoyage/success'
	 				}).then(function successCallback(response){
	 					$scope.flightDetails=response.data;
	 					//console.log(respose.data);
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
		            };
				 
	             _hotelsData();
	             
	             function _hotelsData(){
	            	 
	            	 console.log("in _hotelsData")
	            	 
	 				$http({
	 					method:'GET',
	 					url:'http://192.168.38.93:8080/iVoyage/success/hd'
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
			  }
			
			$scope.viewBkHotels = function() {
				console.log("view Booked Hotels");
				
				$scope.show=4;
			  }
			
		});