<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>

<!-- Angular Script File -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js"></script>
<!--  -->

<!--BEGIN:: From Initial Admin.html Used For SRS -->

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
<style>
header,main,footer {
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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/pages/angular/app/dashBoardApp.js"></script>

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
			<li><a href="" ng-click="cancelNav()">Cancel</a></li>
		</ul>
	</div>
	</nav>

	<div ng-show="show==0" class="hideByDefault"><center><h1 class="red-text">Welcome Admin !</h1></center></div>

	<div ng-show="show==1" class="hideByDefault">

		<center>
			<table class="striped centered">
				<thead>
					<tr>
						<th>Flight Id</th>
						<th>Airline Id</th>
						<th>Airline Name</th>
						<th>Origin</th>
						<th>Destination</th>
						<th>Economy Seats</th>
						<th>Business Seats</th>
						<th>Baggage Limit</th>
						<th>Departure Time</th>
						<th>Arrival Time</th>
						<th>Price Economy</th>
						<th>Price Business</th>

					</tr>
				</thead>

				<tbody>
					<tr ng-repeat="flightsDetailer in flightDetails track by $index ">
						<td>{{flightsDetailer.flightId}}</td>
						<td>{{flightsDetailer.airlineId}}</td>
						<td>{{flightsDetailer.airlineName}}</td>
						<td>{{flightsDetailer.fromLocation}}</td>
						<td>{{flightsDetailer.toLocation}}</td>
						<td>{{flightsDetailer.totalSeatEconomy}}</td>
						<td>{{flightsDetailer.totalSeatBusiness}}</td>
						<td>{{flightsDetailer.baggageLimit}}</td>
						<td>{{flightsDetailer.departureTime}}</td>
						<td>{{flightsDetailer.arrivalTime}}</td>
						<td>{{flightsDetailer.priceEconomy}}</td>
						<td>{{flightsDetailer.priceBusiness}}</td>
					</tr>
				</tbody>
			</table>
			<center>
	</div>


	<div ng-show="show==2" class="hideByDefault">

		<center>
			<table class="striped centered">
				<thead>
					<tr>
						<th>Hotel Id</th>
						<th>Hotel Name</th>
						<th>Location</th>
						<th>AC Deluxe Rooms</th>
						<th>Non AC Rooms</th>
						<th>Price AC</th>
						<th>Price NonAC</th>
					</tr>
				</thead>

				<tbody>
					<tr ng-repeat="hotelsDetail in hotelDetails">
						<td>{{hotelsDetail.hotelId}}</td>
						<td>{{hotelsDetail.hotelName}}</td>
						<td>{{hotelsDetail.location}}</td>
						<td>{{hotelsDetail.totalRoomsAc}}</td>
						<td>{{hotelsDetail.totalRoomsNonAc}}</td>
						<td>{{hotelsDetail.priceAc}}</td>
						<td>{{hotelsDetail.priceNonAc}}</td>
					</tr>
				</tbody>
			</table>
			<center>
	</div>

	<div ng-show="show==3" class="hideByDefault">

		<center>
			<table class="striped centered">
				<thead>
					<tr>
						<th>Booking Id</th>
						<th>Customer Id</th>
						<th>Flight Id</th>
						<th>Price</th>
					</tr>
				</thead>

				<tbody>
					<tr ng-repeat="flightBookings in flightBookings">
						<td>{{flightBookings.bookingId}}</td>
						<td>{{flightBookings.customerId}}</td>
						<td>{{flightBookings.flightId}}</td>
						<td>{{flightBookings.price}}</td>
					</tr>
				</tbody>
			</table>
			<center>
	</div>

	<div ng-show="show==4" class="hideByDefault">

		<center>
			<table class="striped centered">
				<thead>
					<tr>
						<th>Booking Id</th>
						<th>Customer Id</th>
						<th>Hotel Id</th>
						<th>Price</th>
					</tr>
				</thead>

				<tbody>
					<tr ng-repeat="hotelBookings in hotelBookings">
						<td>{{hotelBookings.bookingId}}</td>
						<td>{{hotelBookings.customerId}}</td>
						<td>{{hotelBookings.hotelId}}</td>
						<td>{{hotelBookings.price}}</td>
					</tr>
				</tbody>
			</table>
			<center>
	</div>




	<div ng-show="show==5" class="hideByDefault">


		<div class="row"></div>

		<form name="addflights" class="col s6" ng-submit="submitFlight()">

			<div class="row">

				<div class="input-field col s3">
				
				<input type="text"  id="flightId" name="flightId" required="required"  ng-model="addflight.flightId" ng-maxlength="5" ng-minlength="5" ng-pattern="/^\d{5}$/" />
                 <label for="flightId">FLIGHT ID</label>
                <span class="error-message red-text" ng-show="addflights.flightId.$dirty && addflights.flightId.$invalid">eg:12345 (Max:5)</span>
				
					<!--input placeholder="FlightId" id="flightId" type="text"
						ng-model="addflight.flightId" name="flightId" required="required"
						 data-error="Value not entered"> <label for="flightId">FLIGHT
						ID</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				    <input type="text"  id="airlineId" name="airlineId" required="required" ng-model="addflight.airlineId" ng-maxlength="3" ng-minlength="3" ng-pattern="/^[A-Z]{1}[0-9]{0,2}$/" />
                 <label for="airlineId">AIRLINE ID</label>
                <span class="error-message red-text" ng-show="addflights.airlineId.$dirty && addflights.airlineId.$invalid">eg:A11 (Max:3)</span>
				
					<!--  input placeholder="AirlineId" id="airlineId" type="text"
						ng-model="addflight.airlineId" name="airlineId"
						required="required"  data-error="Value not entered"> <label
						for="airlineId">AIRLINE ID</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				<input type="text"  id="airlineName" name="airlineName" required="required" ng-model="addflight.airlineName" ng-maxlength="20"  ng-pattern="/^[a-zA-Z]/"/>
                 <label for="airlineName">AIRLINE NAME</label>
                <span class="error-message red-text" ng-show="addflights.airlineName.$dirty && addflights.airlineName.$invalid">Max:20</span>
				
					<!--  input placeholder="AirlineName" id="airlineName" type="text"
						ng-model="addflight.airlineName" name="airlineName"
						required="required"  data-error="Value not entered"> <label
						for="airlineName">AIRLINE NAME</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				    <input type="text"  id="fromLocation" required="required" name="fromLocation" ng-model="addflight.fromLocation" ng-maxlength="3"  ng-minlength="3" ng-pattern="/^[A-Z][A-Z][A-Z]$/" />
                 <label for="fromLocation">FROM</label>
                <span class="error-message red-text" ng-show="addflights.fromLocation.$dirty && addflights.fromLocation.$invalid">Give airport code</span>
				
					<!--  input placeholder="FromLocation" id="fromLocation" type="text"
						ng-model="addflight.fromLocation" name="fromLocation"
						required="required"  data-error="Value not entered"> <label
						for="fromLocation">FROM LOCATION</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				    <input type="text"  id="toLocation" required="required" name="toLocation" ng-model="addflight.toLocation" ng-maxlength="3"  ng-minlength="3" ng-pattern="/^[A-Z][A-Z][A-Z]$/" />
                 <label for="toLocation">TO</label>
                <span class="error-message red-text" ng-show="addflights.toLocation.$dirty && addflights.toLocation.$invalid">Give airport code</span>
				
					<!-- input placeholder="ToLocation" id="toLocation" type="text"
						ng-model="addflight.toLocation" name="fromLocation"
						required="required"  data-error="Value not entered"> <label
						for="toLocation">TO LOCATION</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				    <input type="text"  id="economySeats" required="required" name="economySeats" ng-model="addflight.totalSeatEconomy" ng-maxlength="3"  ng-minlength="1" ng-pattern="/^([1-9][0-9]{0,2})$/" />
                 <label for="economySeats">ECONOMY SEATS</label>
                <span class="error-message red-text" ng-show="addflights.economySeats.$dirty && addflights.economySeats.$invalid">Max 999</span>
				
					<!--  input placeholder="EconomySeats" id="economySeats" type="text"
						ng-model="addflight.totalSeatEconomy" name="economySeats"
						required="required"  data-error="Value not entered"> <label
						for="economySeats">ECONOMY SEATS</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				    <input type="text"  id="businessSeats" required="required" name="businessSeats" ng-model="addflight.totalSeatBusiness" ng-maxlength="3" ng-minlength="1" ng-pattern="/^([1-9][0-9]{0,2})$/" />
                 <label for="businessSeats">BUSINESS SEATS</label>
                <span class="error-message red-text" ng-show="addflights.businessSeats.$dirty && addflights.businessSeats.$invalid">Max 999</span>
				
					<!--  input placeholder="BusinessSeats" id="businessSeats" type="text"
						ng-model="addflight.totalSeatBusiness" name="businessSeats"
						required="required"  data-error="Value not entered"> <label
						for="businessSeats">BUSINESS SEATS</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				   <input type="text"  id="baggageLimit" required="required" name="baggageLimit" ng-model="addflight.baggageLimit" ng-maxlength="2" ng-pattern="/^([1-9][0-9]{0,1})$/" />
                 <label for="baggageLimit">BAGGAGE LIMIT</label>
                <span class="error-message red-text" ng-show="addflights.baggageLimit.$dirty && addflights.baggageLimit.$invalid">Max 99Kg</span>
				
					<!-- input placeholder="BaggageLimit" id="baggageLimit" type="text"
						ng-model="addflight.baggageLimit" name="baggageLimit"
						required="required"  data-error="Value not entered"> <label
						for="baggageLimit">BAGGAGE LIMIT</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				    <input type="text"  id="departureTime" required="required" name="departureTime" ng-model="addflight.departureTime" ng-maxlength="2" ng-pattern="/^[0-2]{1}[0-4]{1}$/" />
                 <label for="departureTime">DEPARTURE TIME</label>
                <span class="error-message red-text" ng-show="addflights.departureTime.$dirty && addflights.departureTime.$invalid">eg: 00,24 (Hour)</span>
				
					<!--  input placeholder="DepartureTime" id="departureTime" type="text"
						ng-model="addflight.departureTime" name="departureTime"
						required="required"  data-error="Value not entered"> <label
						for="departureTime">DEPARTURE TIME</label-->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				    <input type="text"   id="arrivalTime" required="required" name="arrivalTime" ng-model="addflight.arrivalTime" ng-maxlength="2" ng-pattern="/^[0-2]{1}[0-4]{1}$/" />
                 <label for="arrivalTime">ARRIVAL TIME</label>
                <span class="error-message red-text" ng-show="addflights.arrivalTime.$dirty && addflights.arrivalTime.$invalid">eg: 00,24 (Hour)</span>
					<!-- input placeholder="ArrivalTime" id="arrivalTime" type="text"
						ng-model="addflight.arrivalTime" name="arrivalTime"
						required="required"  data-error="Value not entered"> <label
						for="arrivalTime">ARRIVAL TIME</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				    <input type="text"  id="priceEconomy" required="required" name="priceEconomy" ng-model="addflight.priceEconomy" ng-maxlength="10" ng-minlength="4" ng-pattern="/^([1-9][0-9]{0,9})$/" />
                 <label for="priceEconomy">PRICE ECONOMY</label>
                <span class="error-message red-text" ng-show="addflights.priceEconomy.$dirty && addflights.priceEconomy.$invalid">Price 1000-9999999999</span>
				
					
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
				
				     <input type="text"  id="priceBusiness" required="required" name="priceBusiness" ng-model="addflight.priceBusiness" ng-maxlength="10" ng-minlength="4" ng-pattern="/^([1-9][0-9]{0,9})$/" />
                 <label for="priceBusiness">PRICE BUSINESS</label>
                <span class="error-message red-text" ng-show="addflights.priceBusiness.$dirty && addflights.priceBusiness.$invalid">Price 1000-9999999999</span>
				
					<!--  input placeholder="PriceBusiness" id="priceBusiness" type="text"
						ng-model="addflight.priceBusiness" name="priceBusiness"
						required="required"  data-error="Value not entered"> <label
						for="priceBusiness">PRICE BUSINESS</label -->
				</div>
			</div>


			<div class="row"></div>
			<div class="row"></div>
			<button style="margin-left: 50px" class="btn teal accent-4" class="btn btn-primary pull-right" ng-disabled="addflights.$invalid"
				type="submit" onclick="Materialize.toast('Flight Added Successfully', 4000)">PROCEED</button>
		</form>
	</div>


	<div ng-show="show==6" class="hideByDefault">


		<div class="row"></div>

		<form name="addhotels" class="col s6" ng-submit="submitHotel()">

			<div class="row">

				<div class="input-field col s3">
				 <input type="text"  id="hotelId" name="hotelId" required="required"  ng-model="addhotel.hotelId" ng-maxlength="4" ng-pattern="/^[a-zA-Z]{1}[0-9]{0,3}$/"/>
                 <label for="hotelId">HOTEL ID</label>
                <span class="error-message red-text" ng-show="addhotels.hotelId.$dirty && addhotels.hotelId.$invalid">eg:H111</span>
				
					<!--  input placeholder="HotelId" id="hotelId" type="text"
						ng-model="addhotel.hotelId" name="hotelId" required="required"
						 data-error="Value not entered"> <label for="hotelId">HOTEL
						ID</label -->
				</div>
			</div>

			<div class="row">
				<div class="input-field col s3">
				
				<input type="text"  id="hotelName" name="hotelName" required="required"  ng-model="addhotel.hotelName" ng-maxlength="15" ng-pattern="/^[a-zA-Z]/" />
                 <label for="hotelName">HOTEL NAME</label>
              <span class="error-message red-text" ng-show="addhotels.hotelName.$dirty && addhotels.hotelName.$invalid">Max:15</span>
				
					<!--  input placeholder="HotelName" id="hotelName" type="text"
						ng-model="addhotel.hotelName" name="hotelName" required="required"
						 data-error="Value not entered"> <label for="hotelName">HOTEL
						NAME</label-->
				</div>
			</div>

			<div class="row">
				<div class="input-field col s3">
				
				
				 <input type="text"  id="location" name="location" required="required"  ng-model="addhotel.location" ng-maxlength="3"  ng-minlength="3" ng-pattern="/^[A-Z][A-Z][A-Z]$/"  />
                 <label for="location">LOCATION</label>
              <span class="error-message red-text" ng-show="addhotels.location.$dirty && addhotels.location.$invalid">Give airport code</span>
              
					<!--  input placeholder="Location" id="location" type="text"
						ng-model="addhotel.location" name="location" required="required"
						 data-error="Value not entered"> <label for="location">LOCATION</label-->
				</div>
			</div>

			<div class="row">
				<div class="input-field col s3">
				 <input type="text"  id="totalRoomsAc" name="totalRoomsAc" required="required"  ng-model="addhotel.totalRoomsAc" ng-maxlength="3" ng-minlength="1" ng-pattern="/^([1-9][0-9]{0,2})$/" />
                 <label for="totalRoomsAc">TOTAL ROOMS AC</label>
                 <span class="error-message red-text" ng-show="addhotels.totalRoomsAc.$dirty && addhotels.totalRoomsAc.$invalid">Max 999</span>
					
					<!-- input placeholder="TotalRoomsAc" id="totalRoomsAc" type="text"
						ng-model="addhotel.totalRoomsAc" name="totalRoomsAc"
						required="required"  data-error="Value not entered"> <label
						for="totalRoomsAc">TOTAL ROOMS AC</label-->
				</div>
			</div>

			<div class="row">
				<div class="input-field col s3">
				
				
					 <input type="text"  id="totalRoomsNonAc" name="totalRoomsNonAc" required="required"  ng-model="addhotel.totalRoomsNonAc"  ng-maxlength="3" ng-minlength="1" ng-pattern="/^([1-9][0-9]{0,2})$/"/>
                 <label for="totalRoomsNonAc">TOTAL ROOMS NON AC</label>
                 <span class="error-message red-text" ng-show="addhotels.totalRoomsNonAc.$dirty && addhotels.totalRoomsNonAc.$invalid">Max 999</span>
					
					
					<!--  input placeholder="TotalRoomsNonAc" id="totalRoomsNonAc"
						type="text" ng-model="addhotel.totalRoomsNonAc"
						name="totalRoomsNonAc" required="required"
						 data-error="Value not entered"> <label
						for="totalRoomsNonAc">TOTAL ROOMS NON AC</label-->
				</div>
			</div>

			<div class="row">
				<div class="input-field col s3">
				
				<input type="text"  id="priceAc" name="priceAc" required="required"  ng-model="addhotel.priceAc" ng-minlength="3" ng-maxlength="5" ng-pattern="/^([1-9][0-9]{0,4})$/"/>
                 <label for="priceAc">PRICE AC</label>
                 <span class="error-message red-text" ng-show="addhotels.priceAc.$dirty && addhotels.priceAc.$invalid">Price 100-99999</span>
                 
				
					<!--  input placeholder="PriceAc" id="priceAc" type="text"
						ng-model="addhotel.priceAc" name="priceAc" required="required"
						 data-error="Value not entered"> <label for="priceAc">PRICE
						AC</label-->
				</div>
			</div>

			<div class="row">
				<div class="input-field col s3">
				
				
				 <input type="text"  id="priceNonAc" name="priceNonAc" required="required"  ng-model="addhotel.priceNonAc" ng-minlength="3" ng-maxlength="5" ng-pattern="/^([1-9][0-9]{0,4})$/"/>
                 <label for="priceNonAc">PRICE NON AC</label>
				<span class="error-message red-text" ng-show="addhotels.priceNonAc.$dirty && addhotels.priceNonAc.$invalid">Price 100-99999</span>
				
					<!--  input placeholder="PriceNonAc" id="priceNonAc" type="text"
						ng-model="addhotel.priceNonAc" name="priceNonAc"
						required="required"  data-error="Value not entered"> <label
						for="priceNonAc">PRICE NON AC</label-->
				</div>
			</div>

			<div class="row"></div>
			<div class="row"></div>
			<button style="margin-left: 50px" class="btn teal accent-4" class="btn btn-primary pull-right" ng-disabled="addhotels.$invalid"
				type="submit" onclick="Materialize.toast('Hotel Added Successfully', 4000)">PROCEED</button>
		</form>
	</div>





	<div class="fixed-action-btn click-to-toggle"
		style="bottom: 45px; right: 24px;">
		<a class="btn-floating btn-large pink waves-effect waves-light"> <i
			class="large material-icons">dehaze</i>
		</a>

		<ul>
			<li><a class="btn-floating red"><i class="material-icons">airplanemode_active</i></a>
				<a ng-href="" ng-click="viewFlights()" class="btn-floating fab-tip">View
					Flights</a></li>

			<li><a class="btn-floating yellow darken-1"><i
					class="material-icons">hotel</i></a> <a ng-href=""
				ng-click="viewHotels()" class="btn-floating fab-tip">View Hotels</a>
			</li>

			<li><a class="btn-floating green"><i class="material-icons">event_seat</i></a>
				<a ng-href="" ng-click="viewBkHotels()" class="btn-floating fab-tip">View
					Hotel Bookings</a></li>

			<li><a class="btn-floating blue"><i class="material-icons">airline_seat_recline_normal</i></a>
				<a ng-href="" ng-click="viewBkFlights()"
				class="btn-floating fab-tip">View Flight Bookings</a></li>

			<li><a class="btn-floating pink"><i class="material-icons">airplanemode_active</i></a>
				<a ng-href="" ng-click="addFlights()" class="btn-floating fab-tip">Add
					Flight</a></li>

			<li><a class="btn-floating violet"><i class="material-icons">event_seat</i></a>
				<a ng-href="" ng-click="addHotels()" class="btn-floating fab-tip">Add
					Hotel</a></li>

		</ul>
	</div>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>

	<!--END::  -->
</body>

</html>