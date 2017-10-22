/**
 * 
 */
var app=angular.module("Dashboard",['ngRoute']);
		
		app.config(['$routeProvider', function($routeProvider) {
            $routeProvider.
            
            when('/viewHotels', {
               templateUrl: 'viewHotels.htm',
               controller: 'viewHotelsController'
            }).
            
            when('/viewFlights', {
               templateUrl: 'viewFlights.htm',
               controller: 'viewFlightsController'
            }).
            
            when('/viewbkHotels', {
                templateUrl: 'viewbkHotels.htm',
                controller: 'viewbkHotelsController'
             }).
             
             when('/viewbkFlights', {
                 templateUrl: 'viewbkFlights.htm',
                 controller: 'viewbkFlightsController'
              }).
              
              when('/addFlights', {
                  templateUrl: 'addFlights.htm',
                  controller: 'addFlightsController'
               }).
               
               when('/addHotels', {
                   templateUrl: 'addHotels.htm',
                   controller: 'addHotelsController'
                }).
            
            otherwise({
               redirectTo: ''
            });
            
         }]);
		
		
		//Controllers
         
         app.controller('viewHotelsController', function($scope) {
            $scope.message = "viewHotels";
         });
         
         app.controller('viewFlightsController', function($scope) {
            $scope.message = "viewFlights";
         });
         
         app.controller('viewbkHotelsController', function($scope) {
             $scope.message = "viewbkHotels";
          });
          
          app.controller('viewbkFlightsController', function($scope) {
             $scope.message = "viewbkFlights";
          });
          
          app.controller('addHotelsController', function($scope) {
              $scope.message = "addHotels";
           });
           
           app.controller('addFlightsController', function($scope) {
              $scope.message = "addFlights";
           });
			
		
		app.controller("dashboardController",function($scope,$http,$window,$location){
		
			$scope.viewFlights = function() {
				console.log("view flights");
			  }
			
			$scope.viewHotels = function() {
				console.log("view Hotels");
			  }
			
			$scope.viewBkFlights = function() {
				console.log("view Booked flights");
			  }
			
			$scope.viewBkHotels = function() {
				console.log("view Booked Hotels");
			  }
			
			$scope.addHotels = function() {
				console.log("Add Hotels");
			  }
			
			$scope.addFlights = function() {
				console.log("Add flights");
			  }
			
		});