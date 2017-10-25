/**
 * 
 */
		var app=angular.module("flightSearch",[]);
			
			app.controller("flightcontroller",function($scope,$http,$window){
				
				$scope.noflight="";
				$scope.flightDetails=[];
				$scope.flightform={
						
						flightorigin:"",
						flightdestination:"",
						departuredate:"",						
				};
			
			
				$scope.flightNav = function () {
				window.location.href="http://192.168.38.93:8080/iVoyage/flightsearch";
				}
				
				$scope.hotelNav = function () {
					window.location.href="http://192.168.38.93:8080/iVoyage/hotelsearch";
				}
				
				$scope.submitSearch =function(){
					
					var method="POST";
					var url="http://192.168.38.93:8080/iVoyage/flightsearch";
					
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
		                       	//$window.location.replace('http://localhost:8080/iVoyage/searchresults');
		                        	
		                    }).error(function(response) {
		                        console.log("error"+" "+response);
		                        $scope.noflights="No Flights Found";
		                    });
		                };
		    			
		    		});
		    		
				
			