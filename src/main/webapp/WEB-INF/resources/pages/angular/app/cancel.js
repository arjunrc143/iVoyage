/**
 * 
 */
var app=angular.module("cancelApp",[]);

app.controller("cancelCtrl",function($scope,$http,$window){


	$scope.flightNav=function (){
		window.location.href="http://localhost:8080/iVoyage/";
	};

	$scope.hotelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/hotelsearch";
	};

	$scope.cancelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/cancel";
	};

	$scope.noFbkn=0;
	$scope.noHbkn=0;

	$scope.fcancel = function() {

		var method = "DELETE";
		var url = "http://localhost:8080/iVoyage/cancelBooking/flight/"+$scope.fbkngId+"/"+$scope.fcustId;

		$http({
			method : method,
			url : url,
		}).success(function(data,status,headers,config) {
			console.log("Success");

		}).error(function(response) {
			$scope.noFbkn=1;
		});
	};
	$scope.hcancel = function() {

		var method = "DELETE";
		var url = "http://localhost:8080/iVoyage/cancelBooking/hotel/"+$scope.hbkngId+"/"+$scope.hcustId;

		$http({
			method : method,
			url : url,
		}).success(function(data,status,headers,config) {
			console.log("Success");
			alert("Successfully Cancelled");

		}).error(function(response) {
			$scope.noHbkn=1;
			alert("No Bookings Found");
		});
	};

});
