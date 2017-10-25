<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Angular Script File -->
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
		<!--  -->
	
		<!--BEGIN:: From Initial Admin.html Used For SRS -->
	
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">



<style>
	  
	.iris {
    		/*background-image: url("fly.jpg");*/
    		background-repeat: no-repeat;
    		height: 100vh;
   			background-size: cover;
		 	  }
	  
	.nav-wrapper{
			background-color:#00bfa5 ;
				} 
			/* label focus color */
					
					
   	.input-field input[type=text]:focus + label {
     		color: red;
												}
			/* label underline focus color */
					
					
   	.input-field input[type=text]:focus {
     		border-bottom: 1px solid #000;
    		box-shadow: 0 1px 0 0 #000;
   								}
		
</style>
 
 <!-- BEGIN:: Angular Scripts -->
	
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pages/angular/app/flightsearch.js"></script>
 		
</head>

<body class= "iris" ng-app="flightSearch" ng-controller="flightcontroller">

<!-- Navigation Bar Start--> 
	
  			<nav>
  				  	<div class="nav-wrapper">
     				<a href="" class="brand-logo right">iVoyage</a>
      				<ul class="left hide-on-med-and-down">
        			<li class="active"><a href="" ng-click="flightNav()">Flights</a></li>
        			<li ><a href="" ng-click="hotelNav()">Hotels</a></li>
      				</ul>
    				</div>
 	 		</nav>
<!-- Navigation Bar End-->  
	

	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	<div class="row"></div>
	
	
	<form class="col s6" ng-submit="submitSearch()">
	
	   	<div class="row">
		
				<div class="input-field col s4">
					<input placeholder="From"  id="flightorigin" type="text" ng-model="flightform.flightorigin" name="flightorigin">
					<label for="flightorigin">FlightOrigin</label>
				</div>
				
				
				<div class="input-field col s4">
					<input placeholder="To" id="flightdestination" name="flightdestination" type="text" ng-model="flightform.flightdestination" class="validate" >
					<label for="flightdestination">FlightDestination</label>
				</div>
				
				
				<div class="input-field col s4">
					<input placeholder="DD/MM/YYYY"  type="text" id="departuredate" name="departuredate" ng-model="flightform.departuredate" class="datepicker" >
					<label for="departuredate">Departure</label>
				</div>
				
	 			<div class="row">
					<button style="margin-left:50px" class="btn teal accent-4" type="submit">SEARCH</button>
				</div>
				
		</div>
	
		<ul><li ng-bind="noflights"></li></ul>

	</form>
	<!-- Form Ends -->

		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>



</body>
</html>