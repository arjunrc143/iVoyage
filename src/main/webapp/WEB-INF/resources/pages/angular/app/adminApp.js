/**
 * 
 */
var app=angular.module("Admin",[]);

app.controller("AdminController",function($scope,$http,$window){

	$scope.incorrect="";
	$scope.adminDetails=[];
	$scope.adminForm={
			username:"",
			password:"",
	};
	$scope.cancelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/cancel";
	};

	$scope.flightNav=function (){
		window.location.href="http://localhost:8080/iVoyage/";
	}

	$scope.hotelNav=function (){
		window.location.href="http://localhost:8080/iVoyage/hotelsearch";
	}

	$scope.submitQuery = function() {

		var method = "POST";
		var url = "http://localhost:8080/iVoyage/admin";

		$http({
			method : method,
			url : url,
			data : angular.toJson($scope.adminForm),
			headers : {
				'Content-Type' : 'application/json'
			}
		}).success(function(data,status,headers,config) {
			console.log("success"+" "+data);
			console.log("var"+" "+status);
			$window.location.replace('http://localhost:8080/iVoyage/success');

		}).error(function(response) {
			console.log("error"+" "+response);
			$scope.incorrect="Username And Password Does Not Match";
		});
	};

});
