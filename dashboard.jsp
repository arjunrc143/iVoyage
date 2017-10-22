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
		        <li><a href="flights.html">Flights</a></li>
		        <li><a href="hotels.html">Hotels</a></li>
		      </ul>
		    </div>
	  	</nav>
	  	
	  	<div ng-view></div>
	  	
	  	<script type = "text/ng-template" id = "viewHotels.htm">
            {{message}}
	<center>
			<table class="highlight centered">
        <thead>
          <tr>
              <th>Hotel Name</th>
              <th>Location</th>
              <th>Item Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
        </tbody>
      </table>
	<center>
         </script>
         
         <script type = "text/ng-template" id = "viewFlights.htm">
            {{message}}
	  {{message}}
	<center>
			<table class="striped centered">
        <thead>
          <tr>
              <th>Hotel Name</th>
              <th>Location</th>
              <th>Item Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
        </tbody>
      </table>
	<center>
         </script>
         
         <script type = "text/ng-template" id = "viewbkHotels.htm">
            {{message}}
  {{message}}
	<center>
			<table class="bordered centered">
        <thead>
          <tr>
              <th>Hotel Name</th>
              <th>Location</th>
              <th>Item Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
        </tbody>
      </table>
	<center>
         </script>
         
         <script type = "text/ng-template" id = "viewbkFlights.htm">
            {{message}}
  {{message}}
	<center>
			<table class="highlight">
        <thead>
          <tr>
              <th>Hotel Name</th>
              <th>Location</th>
              <th>Item Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
        </tbody>
      </table>
	<center>
         </script>
         
         <script type = "text/ng-template" id = "addHotels.htm">
            {{message}}
  {{message}}
	<center>
			<table class="highlight">
        <thead>
          <tr>
              <th>Hotel Name</th>
              <th>Location</th>
              <th>Item Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
        </tbody>
      </table>
	<center>
         </script>
         
         <script type = "text/ng-template" id = "addFlights.htm">
            {{message}}
  {{message}}
	<center>
			<table class="highlight">
        <thead>
          <tr>
              <th>Hotel Name</th>
              <th>Location</th>
              <th>Item Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
        </tbody>
      </table>
	<center>
         </script>
         
         
    <div class="fixed-action-btn click-to-toggle" style="bottom: 45px; right: 24px;">
      <a class="btn-floating btn-large pink waves-effect waves-light">
        <i class="large material-icons">dehaze</i>
      </a>

      <ul>
        <li>
          <a class="btn-floating red"><i class="material-icons">airplanemode_active</i></a>
          <a ng-href="#viewFlights" ng-click="viewFlights()" class="btn-floating fab-tip">View Flights</a>
        </li>

        <li>
          <a class="btn-floating yellow darken-1"><i class="material-icons">hotel</i></a>
          <a ng-href="#viewHotels" ng-click="viewHotels()" class="btn-floating fab-tip">View Hotels</a>
        </li>

        <li>
          <a class="btn-floating green"><i class="material-icons">event_seat</i></a>
          <a ng-href="#viewbkHotels" ng-click="viewBkHotels()" class="btn-floating fab-tip">View Hotel Bookings</a>
        </li>

		<li>
          <a class="btn-floating blue"><i class="material-icons">airline_seat_recline_normal</i></a>
          <a ng-href="#viewbkFlights" ng-click="viewBkFlights()" class="btn-floating fab-tip">View Flight Bookings</a>
        </li>
		
        <li>
          <a class="btn-floating light-green lighten-1"><i class="material-icons">flight_takeoff</i></a>
          <a ng-href="#addFlights" ng-click="addFlights()" class="btn-floating fab-tip">Add Flights</a>
        </li>
		
		<li>
          <a class="btn-floating teal darken-4"><i class="material-icons">local_hotel</i></a>
          <a ng-href="#addHotels" ng-click="addHotels()" class="btn-floating fab-tip">Add Hotels</a>
        </li>
		
      </ul>
    </div>
  		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
		
		<!--END::  -->
	</body>
	
</html>