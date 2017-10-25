<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admin</title>
	
		<!-- Angular Script File -->
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
			<script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js"></script>
		<!--  -->
	
		<!--BEGIN:: From Initial Admin.html Used For SRS -->
	
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
	  	<style>
		   header,
main,
footer {
  padding-left: 240px;
}
body {
  backgroud: white;
}
.fab-tip {
  position: fixed;
  right: 85px;
  padding: 0px 0.5rem;
  text-align: left;
  background-color: #323232;
  border-radius: 2px;
  color: #FFF;
  width: auto;
}
	  	</style>
	
		<!--END::  -->
	
	
		<!-- BEGIN:: Angular Scripts -->
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pages/angular/app/dashBoardApp.js"></script>
	
		<!-- END:: -->
		
	</head>
	
	<body ng-app="Dashboard" ng-controller="dashboardController">
	
	<!--BEGIN:: From Initial Admin.html Used For SRS -->
	
		<nav>
		    <div class="nav-wrapper">
		      <a href="#!" class="brand-logo right">iVoyage</a>
		      <ul class="left hide-on-med-and-down">
		        <li><a href="" ng-click="flightNav()">Flights</a></li>
		        <li><a href="" ng-click="hotelNav()">Hotels</a></li>
		      </ul>
		    </div>
	  	</nav>
	  	
	  <div ng-show="show==1" class="hideByDefault" >
	  
	  <center>
			<table class="striped centered">
        <thead>
          <tr>
              <th>Flight Id</th>
              <th>Airline Id</th>
              <th>Airline Name</th>
              <th>Origin</th>
 			  <th>Destination</th>
              <th>Departure Time</th>
              <th>Arrival Time</th>
 			  <th>Economy Seats</th>
              <th>Buisness Seats</th>
              <th>Baggage Limit</th>
          </tr>
        </thead>

        <tbody>
          <tr ng-repeat="flightsDetail in flightDetails">
            <td>{{flightsDetail.flightId}}</td>
            <td>{{flightsDetail.airlineId}}</td>
            <td>{{flightsDetail.airlineName}}</td>
			<td>{{flightsDetail.fromLocation}}</td>
            <td>{{flightsDetail.toLocation}}</td>
            <td>{{flightsDetail.departureTime}}</td>
			<td>{{flightsDetail.arrivalTime}}</td>
            <td>{{flightsDetail.totalSeatEconomy}}</td>
            <td>{{flightsDetail.totalSeatBuisness}}</td>
			<td>{{flightsDetail.baggageLimit}}</td>
          </tr>
        </tbody>
      </table>
	<center>
	  
	  </div>	
	  
	  
	  <div ng-show="show==2" class="hideByDefault" >
	  
	  <center>
			<table class="striped centered">
        <thead>
          <tr>
              <th>Hotel Id</th>
              <th>Hotel Name</th>
 			  <th>Location</th>
              <th>AC Deluxe Rooms</th>
              <th>Non AC Rooms</th>
          </tr>
        </thead>

        <tbody>
          <tr ng-repeat="hotelsDetail in hotelDetails">
            <td>{{hotelsDetail.hotelId}}</td>
            <td>{{hotelsDetail.hotelName}}</td>
            <td>{{hotelsDetail.location}}</td>
			<td>{{hotelsDetail.totalRoomsAc}}</td>
            <td>{{hotelsDetail.totalRoomsNonAc}}</td>
          </tr>
        </tbody>
      </table>
	<center>
	  
	  </div>	
	  
	  <div ng-show="show==3" class="hideByDefault" >
	  
		<p>Booking Of Flights ... Update Later</p>

	  </div>	
       
		<div ng-show="show==4" class="hideByDefault" >
		
			<p>Booking Of Hotels ... Update Later</p>  

	  </div>	
		
         
         
    <div class="fixed-action-btn click-to-toggle" style="bottom: 45px; right: 24px;">
      <a class="btn-floating btn-large pink waves-effect waves-light">
        <i class="large material-icons">dehaze</i>
      </a>

      <ul>
        <li>
          <a class="btn-floating red"><i class="material-icons">airplanemode_active</i></a>
          <a ng-href="" ng-click="viewFlights()" class="btn-floating fab-tip">View Flights</a>
        </li>

        <li>
          <a class="btn-floating yellow darken-1"><i class="material-icons">hotel</i></a>
          <a ng-href="" ng-click="viewHotels()" class="btn-floating fab-tip">View Hotels</a>
        </li>

        <li>
          <a class="btn-floating green"><i class="material-icons">event_seat</i></a>
          <a ng-href="" ng-click="viewBkHotels()" class="btn-floating fab-tip">View Hotel Bookings</a>
        </li>

		<li>
          <a class="btn-floating blue"><i class="material-icons">airline_seat_recline_normal</i></a>
          <a ng-href="" ng-click="viewBkFlights()" class="btn-floating fab-tip">View Flight Bookings</a>
        </li>
		
      </ul>
    </div>
  		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
		
		<!--END::  -->
	</body>
	
</html>