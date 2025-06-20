<%@page import="com.db.DBClass"%>
<%
DBClass db=new DBClass();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Muscle Gym Management System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Barlow+Semi+Condensed:100,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    
     <link href="css/bootstrap.min.css" rel="stylesheet">
     <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootbox.js"></script>
	
    
	<script>
    function showMsg(msg){
		bootbox.alert(msg);
	}
    $(document).ready(function(){
    	
    });
    </script>
   
    <style>
    label.error
    {
    	color:white;
    }
    </style>
   
    
  </head>
  <body>
  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	   
	    
	      <a class="navbar-brand py-2 px-4" href="index.jsp">Muscle</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse"  id="ftco-nav">
	        <ul class="navbar-nav ml-auto" >
	         
	          <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="schedule.jsp" class="nav-link">Schedule</a></li>
	          <li class="nav-item"><a href="equipments.jsp" class="nav-link">Equipments</a></li>
	          <li class="nav-item"><a href="gallery.jsp" class="nav-link">Photo Gallery</a></li>
	          <li class="nav-item"><a href="forgot.jsp" class="nav-link">Forgot Password</a></li>
               <li class="nav-item"><a href="trainerlogin.jsp" class="nav-link">Trainer</a></li>
	          <li class="nav-item"><a href="adminlogin.jsp" class="nav-link">Admin</a></li>
	          <li class="nav-item"><a href="login.jsp" class="nav-link">LogIn</a></li>
	        </ul>
	      </div>
		  
		  
		  </div>
	  </nav>
    <!-- END nav -->

    <section class="home-slider js-fullheight owl-carousel ftco-degree-bottom" style="margin-bottom:5px">
      <div class="slider-item js-fullheight" style="background-image: url(images/bg_1.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-sm-6 ftco-animate text-center">
              <h1 class="mb-4">Fuel Your Body Fitness</h1>
              <h2 class="subheading">Be One Of Us</h2>
            </div>

          </div>
        </div>
      </div>
      

      <div class="slider-item js-fullheight" style="background-image: url(images/bg_2.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-sm-7 ftco-animate text-center">
              <h1 class="mb-4">Challenge Yourself</h1>
              <h2 class="subheading">Get Your Body Fit</h2>
            </div>

          </div>
        </div>
      </div>
    </section> 
