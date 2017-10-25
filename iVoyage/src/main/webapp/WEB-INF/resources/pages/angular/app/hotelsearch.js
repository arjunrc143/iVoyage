/**
 * 
 */
var app=angular.module("hotelSearch",[]);
app.controller("hotelSearchController",function($scope,$http,$window){
$scope.nohotels="";
$scope.show=0;
$scope.hotelDetails=[];
$scope.Hotelform={
location:"",
checkInDate:"",
checkOutDate:"", 
};

$scope.flightNav=function (){
	window.location.href="http://192.168.38.93:8080/iVoyage/flightsearch";
}

$scope.hotelNav=function (){
	window.location.href="http://192.168.38.93:8080/iVoyage/hotelsearch";
}

$scope.bookHotel= function(index){
	
	console.log("In bookHotel")
	console.log($scope.hotelDetails[index].hotelId);
	$scope.currentBookId=$scope.hotelDetails[index].hotelId;
	$scope.show=2;
	
}

$scope.hotelSearch =function(){

var method="POST";
var url="http://192.168.38.93:8080/iVoyage/hotelsearch";
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
                      //$window.location.replace('http://localhost:8080/iVoyage/searchresults');
                        
                   }).error(function(response) {
                       console.log("error"+" "+response);
                       $scope.noHotels="No Hotels Available";
                   });
               };
               
               
           /*CUSTOMER*/
               
               $scope.currentBookId="";
               $scope.customerDetails=[];
				$scope.customerform={
						
						firstname:"",
						lastname:"",
						gender:"",
						mobile:"",
				};
			
			
				$scope.flightNav = function () {
				window.location.href="http://192.168.38.93:8080/iVoyage/flightsearch";
				}
				
				$scope.hotelNav = function () {
					window.location.href="http://192.168.38.93:8080/iVoyage/hotelsearch";
				}
				
				$scope.submitCustomer=function(){
					
					var method="POST";
					var url="http://192.168.38.93:8080/iVoyage/hotelsearch/addCustomer";
					
					console.log($scope.customerform);
					
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
		                        	
		                    }).error(function(response) {
		                        console.log("error"+" "+response);
		                        $scope.noflights="Something went wrong!!";
		                    });
		                };
               
            /**/   
    
    });