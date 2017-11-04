<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>iVoyage-Hotels</title>

<!-- Angular Script File -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js"></script>
<!--  -->

<!--BEGIN:: From Initial Admin.html Used For SRS -->

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">



<style>

html{

	color:#f3ca52;
	}



	
/*CUSTOMER*/
.irisCust {
	background-image: url("customer.jpeg");
	background-repeat: no-repeat;
	height: 100vh;
	background-size: cover;
}

.nav-wrapper {
	background-color: #37474f;
}
/* label focus color */
.input-field input[type=text]:focus+label {
	color: #f3ca52;
}
/* label underline focus color */
.input-field input[type=text]:focus {
	border-bottom: 1px solid #000;
	box-shadow: 0 1px 0 0 #000;
}

/**/
.iris {
	background-image:url("resources/images/hotel.jpg");
	background-attachment:fixed;
	background-repeat: no-repeat;
	height: 100vh;
	background-size: cover;
}

.nav-wrapper {
	background-color: #37474f ;
}
/* label focus color */

/* label underline focus color */
.input-field input[type=text]:focus {
	border-bottom: 1px solid #000;
	box-shadow: 0 1px 0 0 #000;
}
[type="radio"]:checked+label:after {
    border-radius: 50%;
    border: 2px solid #f3ca52;
    background-color: #f3ca52;
    z-index: 0;
    -webkit-transform: scale(1.02);
    transform: scale(1.02);
}

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

.card-panel{

background-color: rgba(0, 0, 0, 0.2);
}

.input-field input[type=text]:focus+label {
	color: #f3ca52;
}
/* label underline focus color */
.input-field input[type=text]:focus {
	border-bottom: 1px solid #f1f1f1;
	
}

.input-field label{

	color:#f3ca52;
}
.input[type=radio]{

color:#f2f2f2;
}


/*   */
</style>


<!-- BEGIN:: Angular Scripts -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/pages/angular/app/hotelsearch.js"></script>
<script type="text/javascript">
 		document.addEventListener("DOMContentLoaded", function(){
 			$('.preloader-background').delay(1000).fadeOut('slow');
 			
 			$('.preloader-wrapper')
 				.delay(1000)
 				.fadeOut();
 		});
 		</script>
</head>

<body class="iris" ng-app="hotelSearch"
	ng-controller="hotelSearchController">


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

	<!-- Navigation Bar Start-->

	<nav>
	<div class="nav-wrapper">
		<a href="#!" class="brand-logo right">iVoyage</a>
		<ul class="left hide-on-med-and-down">
			<li><a href="" ng-click="flightNav()">Flights</a></li>
			<li class="active"><a href="" ng-click="hotelNav()">Hotels</a></li>
			<li><a href="" ng-click="cancelNav()">Cancel</a></li>
		</ul>
	</div>
	</nav>
	<!-- Navigation Bar End-->
	<div ng-view=""></div>
	<script type = "text/ng-template" id = "hotelSearch.htm">
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

		<form name="hsearch" class="col s6" ng-submit="hotelSearch()">

			<div class="row">

				<div class="input-field col s6">

               <input class="white-text" id="location" type="text" 
						ng-model="Hotelform.location" ng-maxlength="3" ng-minlength="3" ng-pattern="/^[A-Z][A-Z][A-Z]$/" name="location" required="required"> 
						<label for="location" required="required">LOCATION</label>
						<span  class="error-message red-text" ng-show="hsearch.location.$dirty && hsearch.location.$invalid">Give Airport Code</span>
				

					<!-- input placeholder="location" id="location" type="text"
						ng-model="Hotelform.location" name="location" required="required"> <label
						for="location">LOCATION</label -->
				</div>

				<div class="input-field col s6">

                <label for="checkInDate">Departure Date</label><br>
					<input class="white-text" id="checkInDate" name="checkInDate" type="date" ng-model="date.depdate" required="required">
					
                  
					<!-- input placeholder="YYYY-MM-DD" type="text" id="checkInDate"
						name="checkInDate" ng-model="Hotelform.checkInDate" required="required"> <label
						for="checkInDate">CHECKIN</label -->
				</div>

				<div class="row">
					<button style="margin-left: 50px" class="btn blue-grey darken-3" class="btn btn-primary pull-right" ng-disabled="hsearch.$invalid"
						type="submit">SEARCH</button>
				</div>

			</div>

			<ul>
				<li ng-bind="noHotels"></li>
			</ul>

		</form>
		<!-- Form Ends -->
	</script>

	<!-- SEARCH VIEW -->
	<script type = "text/ng-template" id = "searchPages.htm">
		<!--   -->

		<form class="form-inline">
			<input ng-model="query" type="text" placeholder="Filter by" autofocus>
		</form>
<div>
		<button type="button" class="btn blue-grey darken-3" ng-click="setOrder('priceAc')">Price
			AC</button>
		<button type="button" class="btn blue-grey darken-3"
			ng-click="setOrder('priceNonAc')">Price NonAC</button>
		<button type="button" class="btn blue-grey darken-3"
			ng-click="setOrder('totalRoomsAc')">Available Rooms AC</button>
		<button type="button" class="btn blue-grey darken-3"
			ng-click="setOrder('totalRoomsNonAc')">Available Rooms Non
			AC</button>
</div><br>
		<!--   -->
		<div class="row">
		<div ng-repeat="hotel in hotelDetails | filter:query | orderBy: order">
			<div class="col s4 m5">
				<div class="card-panel indigo darken-2">
					<span class="white-text"><h5>{{hotel.hotelName}}</h5></span>
					<a ng-click="bookHotel($index)" class="btn right blue-grey darken-3"><i class="large material-icons blue-grey darken-3">book</i></a>
					 <span class="white-text">{{hotel.hotelId}}</span><br><br>
					 <span class="white-text"><h5>AVAILABLE</h5></span>
					<span class="white-text">AC Deluxe Rooms::{{hotel.totalRoomsAc}}</span><br>
					<span class="white-text">Non AC Deluxe Rooms::{{hotel.totalRoomsNonAc}}</span><br> <br>
					<span class="white-text">AC Rooms Rs::{{hotel.priceAc}}</span><br>
					<span class="white-text">Non-AC Rooms Rs::{{hotel.priceNonAc}}</span><br>
				</div>
			</div>

		</div>
		</div>
	</script>
	<!-- SEARCH VIEW ENDS -->

	<!-- Customer View Begins -->
	<script type = "text/ng-template" id = "custPages.htm">
		<div>
			<span ng-bind="currentHotelId"></span>
		</div>

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
 

					<!-- input class=""  id="firstname" type="text"
						ng-model="customerform.firstName" name="firstname"
						required="required"  data-error="Value not entered"> <label
						for="firstname">FIRST NAME</label -->
				</div>

				<div class="input-field col s3">


                        <input class="white-text" id="lastName" type="text"
						ng-model="customerform.lastName" ng-maxlength="10" ng-pattern="/^[a-zA-Z]*$/" name="lastName" required="required" data-error="Value not entered"> 
						<label for="lastName" >LAST NAME</label>
						<span  class="error-message red-text" ng-show="cusform.lastName.$dirty && cusform.lastName.$invalid">Enter Valid Name</span>               
 

					<!-- input  id="lastname" type="text"
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


        
					<!-- input id="mobile" type="text" class="validate" name="mobile"
						ng-model="customerform.mobile" required="required"> <label for="mobile">MOBILE</label -->
				</div>

				<div class="row"></div>
				<div class="row"></div>
				<button style="margin-left: 50px" class="btn blue-grey darken-3" class="btn btn-primary pull-right" ng-disabled="cusform.$invalid"
					type="submit">PROCEED</button>

			</div>

		</form>
	</script>
	<!-- Customer View Ends      -->




	<!-- HOTELBOOKING VIEW BEGINS -->
<script type = "text/ng-template" id = "bookView.htm">
		<form name="confirm" class="col s6">

			<div class="row">
				<div class="row">
				<div class="col s6 offset-s3">
				<div class="card-panel">
		<center>		<h1><span >Hotel Confirmation</span></h1>
				<div class="row"></div>
				<div class="row"></div>
				<div class="row"></div>

				
					<h5>Hello,<span ng-bind="customerform.firstName"></span></h5>
					<div class="row"></div>
					<span >Hotel Details</span><br>
					<h5><span   ng-bind="hotelDetails[ind].hotelId"></span><br></h5>
					<h5><span   ng-bind="hotelDetails[ind].hotelName"></span><br></h5> 
					<h5><span   ng-bind="hotelDetails[ind].location"></span></h5>
					<!-- <span ng-bind="name"></span> -->
				
			</center>


				<div class="input-field col s4">

                 <input class="white-text" type="text" name="no_ofdays" id="no_ofdays" required="required" ng-model="paymentform.days" ng-maxlength="1" ng-minlength="1" ng-pattern="/^[1-9]{1}$/" />
                 <label for="no_ofdays">DAYS</label>
                 <span class="error-message red-text" ng-show="confirm.no_ofdays.$dirty && confirm.no_ofdays.$invalid">Maximum 9 days</span>

                    
					<!-- input placeholder="0" id="no_ofdays" type="number"
						name="no_ofdays" ng-model="paymentform.days"> <label
						for="no_ofdays">DAYS</label -->
				</div>


				<div class="input-field col s4">

                     <input class="white-text" type="text" name="no_ofAC" id="no_ofAC" required="required" ng-model="paymentform.ac" ng-maxlength="1" ng-minlength="1" ng-pattern="/^[1-9]{1}$/" />
                 <label for="no_ofAC">AC ROOMS</label>
                 <span class="error-message red-text" ng-show="confirm.no_ofAC.$dirty && confirm.no_ofAC.$invalid">Maximum 9 rooms</span>

					<!-- input placeholder="0" id="no_ofAC" type="number" name="no_ofAC"
						ng-model="paymentform.ac"> <label for="no_ofAC">AC
						ROOMS</label -->
				</div>

				<div class="input-field col s4">

                    <input class="white-text" type="text" name="no_ofNonAC" id="no_ofNonAC" required="required" ng-model="paymentform.nonac" ng-maxlength="1" ng-minlength="1" ng-pattern="/^[1-9]{1}$/" />
                 <label for="no_ofNonAC">NONAC ROOMS</label>
                 <span class="error-message red-text" ng-show="confirm.no_ofNonAC.$dirty && confirm.no_ofNonAC.$invalid">Maximum 9 rooms</span>

					<!--input placeholder="0" id="no_ofNonAC" type="number"
						name="no_ofNonAC" ng-model="paymentform.nonac"> <label
						for="no_ofNonAC">NONAC ROOMS</label -->
				</div>
			<!--	<div class="row">
					<div class="col s6 center">
						<a ng-click="payment()" style=margin-left class="btn blue-grey darken-3 " >TOTAL PAYMENT</a>
					</div>
					<div class="col s6">
						<big><ul>
								<span class="white-text"><li ng-bind="totalPayment"></li></span>
							</ul></big>
					</div>
				</div> -->

				<div class="row"></div>
				<div class="row"></div>
				


				<div class="col s3 ">
					<a style="margin-left: 300px" ng-click="submitHotelBooking()"
						class="btn left  blue-grey darken-3" class="btn btn-primary pull-right" ng-disabled="confirm.$invalid">SUBMIT</a>
				</div>


				<div class="col s3 offset-s6">
					<a style="margin-right: 300px" onclick="Materialize.toast('Cancellation Successfull', 4000)" ng-click="cancelHotelBooking()"
						class="btn right  blue-grey darken-3">CANCEL</a>
				</div>
				</div>
			</div>
			</div>
			</div>
		</form>
	</script>
	<!-- HOTELBOOKING VIEW ENDS -->
	<!-- HOTEL BOOKINGS CONFIRMATION VIEW STARTS -->
	<script type = "text/ng-template" id = "confirmations.htm">
		<form>
			<div class="row">
				<div class=class="valign-wrapper">
				<center>	<h3>
						<div>ThankYou. Your Booking is Confirmed</div>
						 BookingID:<span class="white-text" ng-bind="bookingId"></span>
					</h3></center>
				</div>
			</div>

			<div class="row">
				<div class="col s6 offset-s3">
					<div class="card-panel hoverable">
			<center>			<h3>
							Customer Id:<span ng-bind="confirmHotelBookings"></span>
						</h3>
						<h4>Hello,</h4>
						<h6>
							<span ng-bind="customerform.firstName"></span>
						</h6>
						<h6>
							<span ng-bind="customerform.lastName"></span>
						</h6>
						<h6>
							<span ng-bind="customerform.mobile"></span>
						</h6>
						<br>
						<h4>
							<div>Hotel Details</div>
						</h4>
						<h6>
							HotelID: <span ng-bind="hId"></span>
						</h6>
						<h6>
							HotelName: <span ng-bind="hotelDetails[ind].hotelName"></span>
						</h6>
						<h6>
							Days: <span ng-bind="paymentform.days"></span>
						</h6>
						<h6>
							A/C Rooms: <span ng-bind="paymentform.ac"></span>
						</h6>
						<h6>
							Non A/C Rooms: <span ng-bind="paymentform.nonac"></span>
						</h6>
						<h6>
							Total Amount: <span ng-bind="pri"></span>
						</h6>
	</center>
					</div>
				</div>
			</div>
		</form>
	</script>
	<!-- HTEL BOOKINGS CONFIRMATION VIEW STARTS -->


	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>



</body>
</html>