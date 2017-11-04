<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancellation</title>

<!-- Angular Script File -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<!--  -->

<!--BEGIN:: From Initial Admin.html Used For SRS -->

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
<style>

/*  preloader */
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
.nav-wrapper {
	background-color:#1e88e5 ;
}

.iris {
	background-image:url("http://www.worldtravelshop-ng.com/images/slider/img.jpg");
	background-attachment:fixed;
	background-repeat: no-repeat;
	height: 100vh;
	background-size: cover;
}

/*   */
</style>

<!--END::  -->


<!-- BEGIN:: Angular Scripts -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/pages/angular/app/cancel.js"></script>

<script type="text/javascript">
 		document.addEventListener("DOMContentLoaded", function(){
 			$('.preloader-background').delay(1000).fadeOut('slow');
 			
 			$('.preloader-wrapper')
 				.delay(1000)
 				.fadeOut();
 		});
 		</script>

<!-- END:: -->

</head>

<body class="iris" ng-app="cancelApp" ng-controller="cancelCtrl">


	<!-- preloader -->

	<div class="preloader-background">
		<div class="preloader-wrapper big active">
			<div class="spinner-layer spinner-black-only">
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

	<!--BEGIN:: From Initial Admin.html Used For SRS -->

	<nav>
	<div class="nav-wrapper">
		<a href="#!" class="brand-logo right">iVoyage</a>
		<ul class="left hide-on-med-and-down">
			<li><a href="" ng-click="flightNav()">Flights</a></li>
			<li><a href="" ng-click="hotelNav()">Hotels</a></li>
			<li class="active"><a href="" ng-click="cancelNav()">Cancel</a></li>
		</ul>
	</div>
	</nav>

	<div class="row">
		<div class="col s6 ">




			<center>

				<div class="section"></div>

				<h5 class="blue-text" style="border: 3px solid #0277bd;border-radius: 8px; background:white">Cancel Flight Bookings</h5>
				<div class="section"></div>

				<div class="container">
					<div class="z-depth-1 white lighten-5/css/materialize row hoverable"
						style="display: inline-block; padding: 32px 48px 0px 48px; border: 3px solid #EEE;">

						<form class="col s12" ng-submit="fcancel()">
							<div class='row'>
								<div class='col s12'></div>
							</div>

							<div class='row'>
								<div class='input-field col s12'>
									<input class='validate' placeholder="Booking Id" type='text'
										ng-model="fbkngId" name='fbkngId' id='fbkngId' style="font-family: Arial"/> <label
										for='fbkngId'></label>
								</div>
							</div>

							<div class='row'>
								<div class='input-field col s12'>
									<input placeholder="Customer Id" class='validate' type='text'
										name='fcustId' ng-model="fcustId" id='fcustId'  style="font-family: Arial" /> <label
										for='fcustId'></label>
								</div>
							</div>

							<br />
							<center>
								<div class='row'>
									<button type='submit' name='btn_login'
										class='col s12 btn btn-large waves-effect blue'>Cancel</button>
								</div>
							</center>
						</form>
					</div>
				</div>
			</center>
			<div ng-if="noFbkn==1">No Bookings Found</div>

		</div>
		<div class="col s6 ">



			<center>

				<div class="section"></div>

				<h5 class="blue-text" style="border: 3px solid #0277bd;border-radius: 8px; background:white;">Cancel Hotel Bookings</h5>
				<div class="section"></div>

				<div class="container">
					<div class="z-depth-1 white lighten-5/css/materialize row hoverable"
						style="display: inline-block; padding: 32px 48px 0px 48px; border: 3px solid #EEE; background-color: rgba(0, 0, 0, 0.2);">

						<form class="col s12" ng-submit="hcancel()">
							<div class='row'>
								<div class='col s12'></div>
							</div>

							<div class='row'>
								<div class='input-field col s12'>
									<input class='validate' placeholder="Bookings Id" type='text'
										ng-model="hbkngId" name='bkngId' id='bkngId'  style="font-family: Arial"/> <label
										for='bkngId'></label>
								</div>
							</div>

							<div class='row'>
								<div class='input-field col s12'>
									<input class='validate' type='text' placeholder="Customer Id"
										ng-model="hcustId" name='custId' id='custId' style="font-family: Arial" /> <label
										for='custId'></label>
								</div>
							</div>

							<br />
							<center>
								<div class='row'>
									<button type='submit' name='btn_login'
										class='col s12 btn btn-large waves-effect blue'>Cancel</button>
								</div>
							</center>
						</form>
					</div>
				</div>

			</center>
			<div ng-if="noHbkn==1">No Bookings Found</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
</body>

</html>