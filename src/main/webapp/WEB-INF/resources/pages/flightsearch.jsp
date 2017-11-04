<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>iVoyage-Flights</title>

<!-- Angular Script File -->

	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.0/angular-material.min.js"></script>	

    <script src="http://ngmaterial.assets.s3.amazonaws.com/svg-assets-cache.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.0.4/angular-material.css">
      <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js"></script>	
<!--  -->

<!--BEGIN:: From Initial Admin.html Used For SRS -->

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">



<style>

/* TICEKT */
body {
	margin: 0;
	padding: 0;
	background: #fff;
}

.box {
	position: absolute;
	top: calc(50% - 125px);
	top: -webkit-calc(50% - 125px);
	left: calc(50% - 300px);
	left: -webkit-calc(50% - 300px);
}

.ticket {
	width: 600px;
	height: 250px;
	background: #00bfa5;
	border-radius: 3px;
	box-shadow: 0 0 100px #aaa;
	border-top: 1px solid #00bfa5;
	border-bottom: 1px solid #00bfa5;
}

.lefts {
	margin: 0;
	padding: 0;
	list-style: none;
	position: absolute;
	top: 0px;
	left: -5px;
}

.lefts li {
	width: 0px;
	height: 0px;
}

.lefts li:nth-child(-n+2) {
	margin-top: 8px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid #00bfa5;
}

.lefts li:nth-child(3),.lefts li:nth-child(6) {
	margin-top: 8px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid #EEEEEE;
}

.lefts li:nth-child(4) {
	margin-top: 8px;
	margin-left: 2px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid #EEEEEE;
}

.lefts li:nth-child(5) {
	margin-top: 8px;
	margin-left: -1px;
	border-top: 6px solid transparent;
	border-bottom: 6px solid transparent;
	border-right: 6px solid #EEEEEE;
}

.lefts li:nth-child(7),.lefts li:nth-child(9),.lefts li:nth-child(11),.lefts li:nth-child(12)
	{
	margin-top: 7px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid #E5E5E5;
}

.lefts li:nth-child(8) {
	margin-top: 7px;
	margin-left: 2px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid #E5E5E5;
}

.lefts li:nth-child(10) {
	margin-top: 7px;
	margin-left: 1px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid #E5E5E5;
}

.lefts li:nth-child(13) {
	margin-top: 7px;
	margin-left: 2px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid #00bfa5;
}

.lefts li:nth-child(14) {
	margin-top: 7px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-right: 5px solid #00bfa5;
}

.right {
	margin: 0;
	padding: 0;
	list-style: none;
	position: absolute;
	top: 0px;
	right: -5px;
}

.right li:nth-child(-n+2) {
	margin-top: 8px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid #00bfa5;
}

.right li:nth-child(3),.right li:nth-child(4),.right li:nth-child(6) {
	margin-top: 8px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid #EEEEEE;
}

.right li:nth-child(5) {
	margin-top: 8px;
	margin-left: -2px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid #EEEEEE;
}

.right li:nth-child(8),.right li:nth-child(9),.right li:nth-child(11) {
	margin-top: 7px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid #E5E5E5;
}

.right li:nth-child(7) {
	margin-top: 7px;
	margin-left: -3px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid #E5E5E5;
}

.right li:nth-child(10) {
	margin-top: 7px;
	margin-left: -2px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid #E5E5E5;
}

.right li:nth-child(12) {
	margin-top: 7px;
	border-top: 6px solid transparent;
	border-bottom: 6px solid transparent;
	border-left: 6px solid #E5E5E5;
}

.right li:nth-child(13),.right li:nth-child(14) {
	margin-top: 7px;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid #00bfa5;
}

.ticket:after {
	content: '';
	position: absolute;
	right: 200px;
	top: 0px;
	width: 2px;
	height: 250px;
	box-shadow: inset 0 0 0 #00bfa5, inset 0 -10px 0 #B56E0A, inset 0 -20px
		0 #00bfa5, inset 0 -30px 0 #B56E0A, inset 0 -40px 0 #00bfa5, inset 0
		-50px 0 #999999, inset 0 -60px 0 #E5E5E5, inset 0 -70px 0 #999999,
		inset 0 -80px 0 #E5E5E5, inset 0 -90px 0 #999999, inset 0 -100px 0
		#E5E5E5, inset 0 -110px 0 #999999, inset 0 -120px 0 #E5E5E5, inset 0
		-130px 0 #999999, inset 0 -140px 0 #E5E5E5, inset 0 -150px 0 #B0B0B0,
		inset 0 -160px 0 #EEEEEE, inset 0 -170px 0 #B0B0B0, inset 0 -180px 0
		#EEEEEE, inset 0 -190px 0 #B0B0B0, inset 0 -200px 0 #EEEEEE, inset 0
		-210px 0 #B0B0B0, inset 0 -220px 0 #00bfa5, inset 0 -230px 0 #B56E0A,
		inset 0 -240px 0 #00bfa5, inset 0 -250px 0 #B56E0A;
}

.ticket:before {
	content: '';
	position: absolute;
	z-index: 5;
	right: 199px;
	top: 0px;
	width: 1px;
	height: 250px;
	box-shadow: inset 0 0 0 #00bfa5, inset 0 -10px 0 #F4D483, inset 0 -20px
		0 #00bfa5, inset 0 -30px 0 #F4D483, inset 0 -40px 0 #00bfa5, inset 0
		-50px 0 #FFFFFF, inset 0 -60px 0 #E5E5E5, inset 0 -70px 0 #FFFFFF,
		inset 0 -80px 0 #E5E5E5, inset 0 -90px 0 #FFFFFF, inset 0 -100px 0
		#E5E5E5, inset 0 -110px 0 #FFFFFF, inset 0 -120px 0 #E5E5E5, inset 0
		-130px 0 #FFFFFF, inset 0 -140px 0 #E5E5E5, inset 0 -150px 0 #FFFFFF,
		inset 0 -160px 0 #EEEEEE, inset 0 -170px 0 #FFFFFF, inset 0 -180px 0
		#EEEEEE, inset 0 -190px 0 #FFFFFF, inset 0 -200px 0 #EEEEEE, inset 0
		-210px 0 #FFFFFF, inset 0 -220px 0 #00bfa5, inset 0 -230px 0 #F4D483,
		inset 0 -240px 0 #00bfa5, inset 0 -250px 0 #F4D483;
}

.content {
	position: absolute;
	top: 40px;
	width: 100%;
	height: 170px;
	background: #eee;
}

.airline {
	position: absolute;
	top: 10px;
	left: 10px;
	font-family: Arial;
	font-size: 20px;
	font-weight: bold;
	color: rgba(0, 0, 102, 1);
}

.boarding {
	position: absolute;
	top: 10px;
	right: 220px;
	font-family: Arial;
	font-size: 18px;
	color: rgba(255, 255, 255, 0.6);
}

.jfk {
	position: absolute;
	top: 10px;
	left: 20px;
	font-family: Arial;
	font-size: 38px;
	color: #222;
}

.sfo {
	position: absolute;
	top: 10px;
	left: 180px;
	font-family: Arial;
	font-size: 38px;
	color: #222;
}

.plane {
	position: absolute;
	left: 105px;
	top: 0px;
}

.sub-content {
	background: #e5e5e5;
	width: 100%;
	height: 100px;
	position: absolute;
	top: 70px;
}

.watermark {
	position: absolute;
	left: 5px;
	top: -10px;
	font-family: Arial;
	font-size: 110px;
	font-weight: bold;
	color: rgba(255, 255, 255, 0.2);
}

.name {
	position: absolute;
	top: 10px;
	left: 10px;
	font-family: Arial Narrow, Arial;
	font-weight: bold;
	font-size: 14px;
	color: #999;
}

.name span {
	color: #555;
	font-size: 17px;
}

.flight {
	position: absolute;
	top: 10px;
	left: 180px;
	font-family: Arial Narrow, Arial;
	font-weight: bold;
	font-size: 14px;
	color: #999;
}

.flight span {
	color: #555;
	font-size: 17px;
}

.gate {
	position: absolute;
	top: 10px;
	left: 280px;
	font-family: Arial Narrow, Arial;
	font-weight: bold;
	font-size: 14px;
	color: #999;
}

.gate span {
	color: #555;
	font-size: 17px;
}

.seat {
	position: absolute;
	top: 10px;
	left: 350px;
	font-family: Arial Narrow, Arial;
	font-weight: bold;
	font-size: 14px;
	color: #999;
}

.seat span {
	color: #555;
	font-size: 17px;
}

.boardingtime {
	position: absolute;
	top: 60px;
	left: 10px;
	font-family: Arial Narrow, Arial;
	font-weight: bold;
	font-size: 14px;
	color: #999;
}

.boardingtime span {
	color: #555;
	font-size: 17px;
}

.barcode {
	position: absolute;
	left: 8px;
	bottom: 6px;
	height: 30px;
	width: 90px;
	background: #222;
	box-shadow: inset 0 1px 0 #00bfa5, inset -2px 0 0 #00bfa5, inset -4px 0
		0 #222, inset -5px 0 0 #00bfa5, inset -6px 0 0 #222, inset -9px 0 0
		#00bfa5, inset -12px 0 0 #222, inset -13px 0 0 #00bfa5, inset -14px 0
		0 #222, inset -15px 0 0 #00bfa5, inset -16px 0 0 #222, inset -17px 0 0
		#00bfa5, inset -19px 0 0 #222, inset -20px 0 0 #00bfa5, inset -23px 0
		0 #222, inset -25px 0 0 #00bfa5, inset -26px 0 0 #222, inset -26px 0 0
		#00bfa5, inset -27px 0 0 #222, inset -30px 0 0 #00bfa5, inset -31px 0
		0 #222, inset -33px 0 0 #00bfa5, inset -35px 0 0 #222, inset -37px 0 0
		#00bfa5, inset -40px 0 0 #222, inset -43px 0 0 #00bfa5, inset -44px 0
		0 #222, inset -45px 0 0 #00bfa5, inset -46px 0 0 #222, inset -48px 0 0
		#00bfa5, inset -49px 0 0 #222, inset -50px 0 0 #00bfa5, inset -52px 0
		0 #222, inset -54px 0 0 #00bfa5, inset -55px 0 0 #222, inset -57px 0 0
		#00bfa5, inset -59px 0 0 #222, inset -61px 0 0 #00bfa5, inset -64px 0
		0 #222, inset -66px 0 0 #00bfa5, inset -67px 0 0 #222, inset -68px 0 0
		#00bfa5, inset -69px 0 0 #222, inset -71px 0 0 #00bfa5, inset -72px 0
		0 #222, inset -73px 0 0 #00bfa5, inset -75px 0 0 #222, inset -77px 0 0
		#00bfa5, inset -80px 0 0 #222, inset -82px 0 0 #00bfa5, inset -83px 0
		0 #222, inset -84px 0 0 #00bfa5, inset -86px 0 0 #222, inset -88px 0 0
		#00bfa5, inset -89px 0 0 #222, inset -90px 0 0 #00bfa5;
}

.slip {
	left: 455px;
}

.nameslip {
	top: 60px;
	left: 410px;
}

.flightslip {
	left: 410px;
}

.seatslip {
	left: 540px;
}

.jfkslip {
	font-size: 30px;
	top: 20px;
	left: 410px;
}

.sfoslip {
	font-size: 30px;
	top: 20px;
	left: 530px;
}

.planeslip {
	top: 10px;
	left: 475px;
}

.airlineslip {
	left: 455px;
}

/* */
.iris {
	background-image: url("resources/images/flight.jpg");
	background-attachment:fixed;
	background-repeat: no-repeat;
	height: 100vh;
	background-size: cover;
}

.nav-wrapper {
	background-color: #00bfa5;
}
/* label focus color */
.input-field input[type=text]:focus+label {
	color: teal accent-4;
}
/* label underline focus color */
.input-field input[type=text]:focus {
	border-bottom: 1px solid #f1f1f1;
	
}

.input-field label{

	color:#27ffeb;
}
/* */
.preloader-background {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #eee;
	position: fixed;
	z-index: 100;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}


	html{

	color:#eee;
	}
	
.card{
background-color:darkslategrey;
}
.row .col.s4 {
    width: 30.3333333333%;
    margin-left: auto;
    left: auto;
    right: auto;
}


	.input::-webkit-input-placeholder { /* WebKit, Blink, Edge */
    color:    white;
}
/* */

.md-datepicker-input-container {
    width: 300px;
}
</style>

<!-- BEGIN:: Angular Scripts -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/pages/angular/app/flightsearch.js"></script>
<script type="text/javascript">
 		document.addEventListener("DOMContentLoaded", function(){
 			$('.preloader-background').delay(500).fadeOut('slow');
 			
 			$('.preloader-wrapper')
 				.delay(500)
 				.fadeOut();
 		});
 		</script>
</head>




<body class="iris" ng-app="flightSearch"
	ng-controller="flightcontroller">

	<!-- Preloader -->

	<div class="preloader-background">
		<div class="preloader-wrapper big active">
			<div class="spinner-layer spinner-teal-only">
				<div class="circle-clipper left">
					<div class="circle"></div>
				</div>
				<div class="gap-patch">
					<div class="circle"></div>
				</div>
				<div class="circle-clipper right">
					<div class="circle"></div>
				</div>
			</div>
		</div>
	</div>


	<!--  -->


	<!-- Navigation Bar Start-->

	<nav>
	<div class="nav-wrapper">
		<a href="" class="brand-logo right">iVoyage</a>
		<ul class="left hide-on-med-and-down">
			<li class="active"><a href="" ng-click="flightNav()">Flights</a></li>
			<li><a href="" ng-click="hotelNav()">Hotels</a></li>
			<li><a href="" ng-click="cancelNav()">Cancel</a></li>
		</ul>
	</div>
	</nav>
	<!-- Navigation Bar End-->

	<!-- Initial Flight Search View -->
	<div ng-view=""></div>
	<script type = "text/ng-template" id = "flightSearch.htm">

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


		<form name="search" class="col s6" ng-submit="submitSearch()">

			<div class="row">

				<div class="input-field col s4">
					<input class="white-text" id="flightorigin" type="text"
						ng-model="flightform.flightorigin" ng-maxlength="3" ng-pattern="/^[A-Z][A-Z][A-Z]$/" name="flightorigin" required="required"> 
						<label for="flightorigin" required="required">FlightOrigin</label>
						<span  class="error-message red-text" ng-show="search.flightorigin.$dirty && search.flightorigin.$invalid">Give Airport Code</span>
				</div>


				<div class="input-field col s4">
					<input class="white-text" id="flightdestination"
						name="flightdestination" type="text"
						ng-model="flightform.flightdestination" ng-maxlength="3" class="validate" ng-pattern="/^[A-Z][A-Z][A-Z]$/" required="required">
					<label for="flightdestination">FlightDestination</label>
					<span  class="error-message red-text" ng-show="search.flightdestination.$dirty && search.flightdestination.$invalid">Give Airport Code</span>
				</div>


				<div class="input-field col s4">
					<label for="departuredate">Departure Date</label><br>
					<input class="white-text" id="departuredate" name="departuredate" type="date" ng-model="date.depdate" required="required">
					
				</div>

				<div class="row">
					<button style="margin-left: 50px" class="btn teal accent-4" class="btn btn-primary pull-right" ng-disabled="search.$invalid"
						type="submit">SEARCH</button>
				</div>

			</div>

		<center>	
				<h3 class="red-text" ng-bind="noflights"></h3>
			 </center>

		</form>
		<!-- Form Ends -->

	</script>
	<!-- Flight Search View Ends -->

	<!-- Searching Page Begins -->
	<script type = "text/ng-template" id = "searchPage.htm">
		<div class="row">
			<div ng-repeat="item in list">

			
				<div class="col s4 ">


					<div class="card hoverable darkslategrey">
						<div class="card-content">
							<h4 class="white-text">{{flightform.flightorigin}} ---
							{{flightform.flightdestination}}</h4>
					<!--  <button class="btn right" ng-click="bookFlight($index)">Book</button> -->
							<a ng-click="bookFlight($index)" class="btn teal accent-4"><i
							class="large material-icons teal accent-4">book</i></a>
						</div>
						
					<div class="card-tabs"></div>
					<div class="card-content" ng-repeat="route in item">
						<div id="{{route.flightId}}">
							<h5 class="white-text">{{route.fromLocation}} --- {{route.toLocation}}</h5>
							<p class="white-text">{{route.airlineName}}</p>
							<p class="white-text">{{route.flightId}}</p><br>
							<p class="white-text">BAGGAGE LIMIT: {{route.baggageLimit}}</p>
							<h6 class="white-text">AVAILABLE:</h6>
							<p class="white-text">ECONOMY SEAT: {{route.totalSeatEconomy}}</p>
							<p class="white-text">Rs. {{route.priceEconomy}}</p>
							<p class="white-text">BUSINESS SEAT: {{route.totalSeatBusiness}}</p>
							<p class="white-text">Rs. {{route.priceBusiness}}</p>
								
						</div>
					</div>
				</div>

			</div>
			</div>
		</div>

	</script>
	<!-- Searching Page Ends -->

	<!-- Customer Page -->
	<script type = "text/ng-template" id = "custPage.htm">
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
		<form name="cusform" class="col s6" ng-submit="submitCustomer()">

			<div class="row">

				<div class="input-field col s3">

                	<input class="white-text" id="firstname" type="text"
						ng-model="customerform.firstName" ng-maxlength="10" ng-pattern="/^[a-zA-Z]*$/" name="firstname" required="required" data-error="Value not entered"> 
						<label for="firstname">FIRST NAME</label>
						<span  class="error-message red-text" ng-show="cusform.firstname.$dirty && cusform.firstname.$invalid">Enter Valid Name(Max size:10)</span>               
 
					<!-- input class="white-text" id="firstname" type="text"
						ng-model="customerform.firstName" name="firstname"
						required="required"  data-error="Value not entered"> <label
						for="firstname">FIRST NAME</label -->
				</div>

				<div class="input-field col s3">

                <input class="white-text" id="lastName" type="text"
						ng-model="customerform.lastName" ng-maxlength="10" ng-pattern="/^[a-zA-Z]*$/" name="lastName" required="required" data-error="Value not entered"> 
						<label for="lastName" >LAST NAME</label>
						<span  class="error-message red-text" ng-show="cusform.lastName.$dirty && cusform.lastName.$invalid">Enter Valid Name</span>               
 
					<!-- input id="lastname" type="text"
						ng-model="customerform.lastName" name="lastname"
						required="required"  data-error="Value not entered"> <label
						for="lastname">LAST NAME</label -->
				</div>
			</div>
			<div class="row">
				<div class="input-field col s3">
					<p>
						<input id="male" type="radio" name="gender" value="male" 
							ng-model="customerform.gender" required> <label for="male">Male</label>
						<input id="female" type="radio" name="gender" value="female"
							 ng-model="customerform.gender"> <label
							for="female">Female</label>
					</p>

				</div>

				<div class="input-field col s3">

                <input class="white-text" type="text" name="mobile" id="mobile" required="required" ng-model="customerform.mobile" ng-maxlength="10" ng-minlength="10" ng-pattern="/^\d{10}$/" />
                 <label for="mobile">MOBILE</label>
    <span class="error-message red-text" ng-show="cusform.mobile.$dirty && cusform.mobile.$invalid">Enter Valid Mobile no:</span>

					<!-- input id="icon_mobile" type="text" class="validate" name="mobile"
						ng-model="customerform.mobile"> <label for="icon_mobile">MOBILE</label -->
				</div>

				<div class="row"></div>
				<div class="row"></div>
				<button style="margin-left: 50px" class="btn teal accent-4" class="btn btn-primary pull-right" ng-disabled="cusform.$invalid"
					type="submit">PROCEED</button>

			</div>

		</form>

	</script>
	<!-- Cust Ends -->

	<!-- Confirmation View  EDIT -->

	<script type = "text/ng-template" id = "confirmation.htm">

		<form name="confirm" class="col s6">

			<div class="row">
				<div class="card transparent hoverable white-text large offset-2" style="width:700px;height:500px;padding-left:2em;margin-left:50px;">
				<center><h1 style="color:rgb(40, 234, 182);">Confirm Your Booking</h1></center>
				<div class="row"></div>
				<div class="row"></div>
				<div class="row"></div>
				<center><h3 style="color:rgb(40, 234, 182);">Hello,</h3>
					<h5 style="color:rgb(40, 234, 182);">{{customerform.firstName}} {{customerform.lastName}}</h5>
					<span class="white-text"></span><br>
						<h4 style="color:rgb(40, 234, 182);">{{flightform.flightorigin}}-->{{flightform.flightdestination}}</h4><br></center>
				
				<div class="input-field col s4">

                  <input class="white-text" type="text" name="no_ofeconomyseats" id="no_ofeconomyseats" required="required" ng-model="bookingDetails.nes" ng-maxlength="1" ng-minlength="1" ng-pattern="/^\d{1}$/" />
                 <label for="no_ofeconomyseats">ECONOMY SEATS</label>
                 <span class="error-message red-text" ng-show="confirm.no_ofeconomyseats.$dirty && confirm.no_ofeconomyseats.$invalid">Maximum 9 seats</span>


					<!-- input  ng-model="bookingDetails.nes"
						id="no_ofeconomyseats" type="number" name="no_ofeconomyseats">
					<label for="nes">ECONOMY SEATS</label -->
				</div>


				<div class="input-field col s4">

                 <input class="white-text" type="text" name="no_ofbusiness" id="no_ofbusiness" required="required" ng-model="bookingDetails.nbs" ng-maxlength="1" ng-minlength="1" ng-pattern="/^\d{1}$/" />
                 <label for="no_ofbusiness">BUSINESS SEATS</label>
                  <span class="error-message red-text" ng-show="confirm.no_ofbusiness.$dirty && confirm.no_ofbusiness.$invalid">Maximum 9 seats</span>

					<!-- input ng-model="bookingDetails.nbs"
						id="no_ofbusiness" type="number" name="no_ofbusiness"> <label
						for="no_ofbusiness">BUSINESS SEATS</label -->
				</div>

				<div class="col s6">
					<button  class="btn teal accent-4" class="btn btn-primary pull-right" ng-disabled="confirm.$invalid" ng-click="confirmBooking()">CONFIRM</button>
				</div>
				<div class="col s6">
					<button  class="btn teal accent-4" style="margin-right:150px" onclick="Materialize.toast('Cancellation Successfull', 4000)" ng-click="cancelBooking()">CANCEL</button>


				</div>
				
				</div>
			</div>



		</form>
	</script>

	<!-- Confirmation Ends -->

	<!-- Final View -->
	<script type = "text/ng-template" id = "final.htm">
		<div ng-show="inview==0"><center><h5 style="color:rgb(40, 234, 182);">Keep The BookingID (bknxxxxx) and CustomerId (CID) for future
			reference</h5></center></div>
		<div class="box hoverable" ng-show="inview==0" class="hideByDefault">
			<ul class="lefts">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>

			<ul class="right">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<div class="ticket">
				<span class="airline" ng-bind="bookedId"></span> <span
					class="airline airlineslip">iVoyage</span> <span class="boarding">iVoyage
					Slip</span>
				<div class="content">
					<span class="jfk">{{flightform.flightorigin}}</span> <span
						class="plane">
						<?xml version="1.0" ?>
						<svg clip-rule="evenodd" fill-rule="evenodd" height="60"
							width="60" image-rendering="optimizeQuality"
							shape-rendering="geometricPrecision"
							text-rendering="geometricPrecision" viewBox="0 0 500 500"
							xmlns="http://www.w3.org/2000/svg">
						<g stroke="#222">
						<line fill="none" stroke-linecap="round" stroke-width="30"
							x1="300" x2="55" y1="390" y2="390" />
						<path
							d="M98 325c-9 10 10 16 25 6l311-156c24-17 35-25 42-50 2-15-46-11-78-7-15 1-34 10-42 16l-56 35 1-1-169-31c-14-3-24-5-37-1-10 5-18 10-27 18l122 72c4 3 5 7 1 9l-44 27-75-15c-10-2-18-4-28 0-8 4-14 9-20 15l74 63z"
							fill="#222" stroke-linejoin="round" stroke-width="10" /></g></svg>
					</span> <span class="sfo">{{flightform.flightdestination}}</span> <span
						class="jfk jfkslip">{{flightform.flightorigin}}</span> <span
						class="plane planeslip">
						<?xml version="1.0" ?>
						<svg clip-rule="evenodd" fill-rule="evenodd" height="50"
							width="50" image-rendering="optimizeQuality"
							shape-rendering="geometricPrecision"
							text-rendering="geometricPrecision" viewBox="0 0 500 500"
							xmlns="http://www.w3.org/2000/svg">
						<g stroke="#222">
						<line fill="none" stroke-linecap="round" stroke-width="30"
							x1="300" x2="55" y1="390" y2="390" />
						<path
							d="M98 325c-9 10 10 16 25 6l311-156c24-17 35-25 42-50 2-15-46-11-78-7-15 1-34 10-42 16l-56 35 1-1-169-31c-14-3-24-5-37-1-10 5-18 10-27 18l122 72c4 3 5 7 1 9l-44 27-75-15c-10-2-18-4-28 0-8 4-14 9-20 15l74 63z"
							fill="#222" stroke-linejoin="round" stroke-width="10" /></g></svg>
					</span> <span class="sfo sfoslip">{{flightform.flightdestination}}</span>
					<div class="sub-content">
						<span class="watermark">iVoyage</span> <span class="name">PASSENGER
							NAME<br>
						<span>{{customerform.firstName}} {{customerform.lastName}}</span>
						</span> <span class="flight">FLIGHT N&deg;<br>
						<span ng-bind="bookedFlightId"></span></span> <span class="gate">PRICE<br>
						<span ng-bind="bookedPrice"></span></span> <span class="seat">CID<br>
						<span ng-bind="bookedCustomerId"></span></span> <span
							class="boardingtime">BOARDING TIME<br>
						<span>8:25PM ON {{flightform.departuredate}}</span></span> <span
							class="flight flightslip">FLIGHT N&deg;<br>
						<span ng-bind="bookedFlightId"></span></span> <span class="seat seatslip">PRICE<br>
						<span ng-bind="bookedPrice"></span></span> <span class="name nameslip">PASSENGER
							NAME<br>
						<span>{{customerform.firstName}} {{customerform.lastName}}</span>
						</span>
					</div>
				</div>
				<div class="barcode"></div>
				<div class="barcode slip"></div>


			</div>


		</div>

		<div class="row hoverable" style= "background-color: transparent";>
		<center><h5 style="color:rgb(40, 234, 182);">Find Hotels...</h5></center>
		<div ng-repeat="item in bookingDetails.routeList">
			
      <div class="col s3 m5">
        <div class="card transparent hoverable">
        <center>  <h6 style="color:rgb(40, 234, 182);" ng-bind="item.toLocation"></h6><br>
          <button class="btn small teal accent-4 hoverable" ng-click="findHotel($index)">Find Hotels</button></center><br>
        </div>
      </div>
    	</div>
		</div>
		
		<!-- SEARCH VIEW -->
	<div ng-show="inview==1" class="hideByDefault">
		<!--   -->
		
		<center><h5 class="red-text" ng-bind="noHotels"></h5></center>

		<form class="form-inline">
			<input class="white-text" ng-model="query" type="text" placeholder="Filter by" autofocus>
		</form>

		<!--   -->
		<div class="row">
		<div ng-repeat="hotel in hotelDetails | filter:query | orderBy: order">
			
			<div class="col s4 m5">
				<div class="card-panel teal">
					<h5>{{hotel.hotelName}}</h5>
					 <span class="white-text">{{hotel.hotelId}}</span><br>
					<span class="white-text">AC Deluxe
						Rooms::{{hotel.totalRoomsAc}}</span><br> <span class="white-text">Non
						AC Deluxe Rooms::{{hotel.totalRoomsNonAc}}</span><br> <span
						class="white-text">AC Rooms Rs::{{hotel.priceAc}}</span><br>
					<span class="white-text">Non-AC Rooms
						Rs::{{hotel.priceNonAc}}</span><br>
				</div>
			</div>
			</div>
		</div>
	</div>

	<!-- SEARCH VIEW ENDS -->
	</script>
	<!--  -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>



</body>
</html>