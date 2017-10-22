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
			
			/*_adminData();
			
			function _adminData(){
				$http({
					method:'GET',
					url:'http://localhost:8080/iVoyage/admin'
				}).then(function successCallback(response){
					$scope.adminDetails=response.data;
				}, function errorCallback(response) {
					console.log(response.statusText);
				}); 
			}*/
			
			
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
		