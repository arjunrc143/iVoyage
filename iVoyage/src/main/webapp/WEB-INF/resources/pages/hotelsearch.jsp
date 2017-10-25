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
	  
	  
	  /*CUSTOMER*/
	  
	    .irisCust {
    background-image: url("customer.jpeg");
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
	  
	  /**/
	  
	  .iris {
    
    background-repeat: no-repeat;
    height: 100vh;
    background-size: cover;
	}
	  
	.nav-wrapper{
		background-color:#455a64 ;
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
	
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pages/angular/app/hotelsearch.js"></script>
 		
</head>

<body class= "iris" ng-app="hotelSearch" ng-controller="hotelSearchController">

<!-- Navigation Bar Start--> 
	
  			<nav>
  				  	<div class="nav-wrapper">
     				<a href="#!" class="brand-logo right">iVoyage</a>
      				<ul class="left hide-on-med-and-down">
        			<li><a href="" ng-click="flightNav()">Flights</a></li>
        			<li class="active"><a href="" ng-click="hotelNav()">Hotels</a></li>
      				</ul>
    				</div>
 	 		</nav>
<!-- Navigation Bar End-->  

<div ng-show="show==0" class="hideByDefault" >	

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
	
	
	<form class="col s6" ng-submit="hotelSearch()">
	
	   	<div class="row">
		
				<div class="input-field col s4">
					<input placeholder="location"  id="location" type="text" ng-model="Hotelform.location" name="location">
					<label for="location">LOCATION</label>
				</div>
				
				
				
				
				
				<div class="input-field col s4">
					<input placeholder="DD/MM/YYYY"  type="text" id="checkInDate" name="checkInDate" ng-model="Hotelform.checkInDate"  >
					<label for="checkInDate">CHECKIN</label>
				</div>
				
				<div class="input-field col s4">
					<input placeholder="DD/MM/YYYY"  type="text" id="checkOutDate" name="checkOutDate" ng-model="Hotelform.checkOutDate" >
					<label for="checkOutDate">CHECKOUT</label>
				</div>
				
	 			<div class="row">
					<button style="margin-left:50px" class="btn teal accent-4" type="submit">SEARCH</button>
				</div>
				
		</div>
	
		<ul><li ng-bind="noHotels"></li></ul>

	</form>
	<!-- Form Ends -->

</div>	

<!-- SEARCH VIEW -->
<div ng-show="show==1" class="hideByDefault" >

<div ng-repeat="hotel in hotelDetails">
      <div class="col s12 m5">
        <div class="card-panel teal">
          <h5>{{hotel.hotelName}}</h5>
          <a ng-click="bookHotel($index)" class="btn right red"><i class="large material-icons red">book</i></a>	
          <span class="white-text">{{hotel.hotelId}}</span><br>
          <span class="white-text">AC Deluxe Rooms::{{hotel.totalRoomsAc}}</span><br>
          <span class="white-text">Non AC Deluxe Rooms::{{hotel.totalRoomsNonAc}}</span><br>
          
    	</div>	
	   </div>
	   
</div>
</div>

<!-- SEARCH VIEW ENDS -->

<!-- Customer View Begins -->

<div ng-show="show==2" class="hideByDefault" >

	<div><span ng-bind="currentBookId"></span></div>
		
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
	<form class="col s6" ng-submit="submitCustomer()">
	
	   	<div class="row">
		
				<div class="input-field col s3">
					<input placeholder="FirstName" id="firstname" type="text" ng-model="customerform.firstName" name="firstname" required="required" data-error="Value not entered">
					<label for="firstname">FIRST NAME</label>
				</div>
				
				<div class="input-field col s3">
					<input placeholder="LastName"  id="lastname" type="text" ng-model="customerform.lastName" name="lastname" required="required" data-error="Value not entered">
					<label for="lastname">LAST NAME</label>
				</div>
				<div class="row">
               <div class="input-field col s3">
                   <p>
                     <input id="male" type="radio" name="gender" value="male" checked ng-model="customerform.gender">
                     <label for="male">Male</label>
                     <input id="female" type="radio" name="gender" value="female" checked ng-model="customerform.gender">
                     <label for="female">Female</label>
                  </p>
                  
               </div>
			   	
				<div class="input-field col s3">
						
						<input id="icon_mobile" type="text" class="validate" name="mobile" ng-model="customerform.mobile">
						<label for="icon_mobile">MOBILE</label>
				</div>
				
				<div class="row"></div>
				<div class="row"></div>
					<button style="margin-left:50px" class="btn teal accent-4" type="submit">PROCEED</button>
				
		</div>

	</form>
		

</div>

<!-- Customer View Ends -->


		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>



</body>
</html>