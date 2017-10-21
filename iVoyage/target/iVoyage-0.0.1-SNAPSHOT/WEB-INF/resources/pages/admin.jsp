<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admin</title>
	
		<!-- Angular Script File -->
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
		<!--  -->
	
		<!--BEGIN:: From Initial Admin.html Used For SRS -->
	
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
	  	<style>
		    body {
		      display: flex;
		      min-height: 100vh;
		      flex-direction: column;
		    }
		
		    main {
		      flex: 1 0 auto;
		    }
		
		    body {
		      background: #fff;
		    }
		
		    .input-field input[type=date]:focus + label,
		    .input-field input[type=text]:focus + label,
		    .input-field input[type=email]:focus + label,
		    .input-field input[type=password]:focus + label {
		      color: #e91e63;
		    }
		
		    .input-field input[type=date]:focus,
		    .input-field input[type=text]:focus,
		    .input-field input[type=email]:focus,
		    .input-field input[type=password]:focus {
		      border-bottom: 2px solid #e91e63;
		      box-shadow: none;
		    }
	  	</style>
	
		<!--END::  -->
	
	
		<!-- BEGIN:: Angular Scripts -->
	
		<script type="text/javascript">
		
		var app=angular.module("Admin",[]);
		
		app.controller("AdminController",function($scope,$http){
		
			$scope.adminDetails=[];
			$scope.adminForm={
					adminid:-1,
					username:"",
					password:"",
			};
			
			_adminData();
			
			function _adminData(){
				$http({
					method:'GET',
					url:'http://localhost:8080/iVoyage/admin'
				}).then(function successCallback(response){
					$scope.adminDetails=response.data;
				}, function errorCallback(response) {
					console.log(response.statusText);
				}); 
			}
			
			
			$scope.submitQuery = function() {
		         
                var method = "";
                var url = "";
                if ($scope.adminForm.adminid == -1) {
                    //Id is absent in form data, it is create
                    method = "GET";
                    url = 'http://localhost:8080/iVoyage/admin/'+adminForm.adminid;
                } else {
                    //Id is present in form data, it is edit 
                    method = "GET";
                    url = 'http://localhost:8080/iVoyage/admin/'+adminForm.adminid;
                }
     
                $http({
                    method : method,
                    url : url,
                    data : angular.toJson($scope.adminForm),
                    headers : {
                        'Content-Type' : 'application/json'
                    }
                }).then( _success, _error );
            };
     
			
			
			function _success(response) {
				_adminData();
                _clearFormData()
            }
     
            function _error(response) {
                console.log(response.statusText);
            }
     
            //Clear the form
            function _clearFormData() {
                $scope.adminForm.adminid = -1;
                $scope.adminForm.username = "";
                $scope.adminForm.password = "";
            
            };
			
		});
		
		</script>

	
		<!-- END:: -->
		
	</head>
	
	<body ng-app="Admin" ng-controller="AdminController">
	
	<!--BEGIN:: From Initial Admin.html Used For SRS -->
	
		<nav>
		    <div class="nav-wrapper">
		      <a href="#!" class="brand-logo right">iVoyage</a>
		      <ul class="left hide-on-med-and-down">
		        <li><a href="flights.html">Flights</a></li>
		        <li><a href="hotels.html">Hotels</a></li>
		      </ul>
		    </div>
	  	</nav>

  		<div class="section"></div>
  
  		<main>
			<center>
		    	<div class="section"></div>
		
		    	<h5 class="red-text">Admin Login</h5>
		    	<div class="section"></div>
		
		    	<div class="container">
		        	<div class="z-depth-1 white lighten-5/css/materialize row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
			        	<form class="col s12" ng-submit="submitQuery">
		            		<div class='row'>
		              			<div class='col s12'></div>
		            		</div>
		
		            		<div class='row'>
		              			<div class='input-field col s12'>
		                			<input class='validate' ng-model="adminForm.username" type='text' name='username' id='username' />
		                			<label for='username'>Admin Id</label>
		              			</div>
		            		</div>
		
		            		<div class='row'>
		              			<div class='input-field col s12'>
		                			<input class='validate' type='password' ng-model="adminForm.password" name='password' id='password' />
		                			<label for='password'>Password</label>
		              			</div>
		              			<label style='float: right;'>
									<a class='pink-text' href='#!'><b>Forgot Password?</b></a>
								</label>
		            		</div>
							
							<br/>
							
		            		<center>
		              			<div class='row'>
		                			<button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect red'>Login</button>
		              			</div>
		            		</center>
		          		</form>
		        	</div>
		      	</div>
		      	
		      	<a href="#!">Create account</a>
		    
		    </center>
		
		    <div class="section"></div>
		    <div class="section"></div>
  		</main>

  		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
		
		<!--END::  -->
	</body>
	
</html>