<%@page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
 	DataAccess db=new DataAccess();
 	String successMsg="";
 	String errorMsg="";
 	String redirectUrlSuccess = " ";
 	String redirectUrlError =" ";
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fitness Club Management System</title>

<link href="/Fitness_Club_Management_System/css/bootstrap.css" rel="stylesheet">
<link href="/Fitness_Club_Management_System/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>
<body>

						<!-- Nav Bar Section -->
<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">FitnessClub</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor02">
      
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/Fitness_Club_Management_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
       <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/aboutus.jsp">About</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/services.jsp">Services</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/gallery.jsp">Gallery</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/career.jsp">Career</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/contact.jsp">Contact</a>
        </li>
       </ul>
         <!-- Login & Sign Up -->
        <form class="d-flex">
       <ul class="navbar-nav">
       <li class="nav-item">
          <a class="nav-link fw-bold font-monospace active" href="/Fitness_Club_Management_System/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold font-monospace active" href="/Fitness_Club_Management_System/signup.jsp">SignUp</a>
        </li>
        </ul>
        </form>
        
        
        <%
        	} else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        		
      	%>
        <!-- Admin Related Navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/Fitness_Club_Management_System/Admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Admin/AdminDashboard.jsp">Dashboard</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Admin/aboutus.jsp">About</a>
        </li>
        
		 <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Admin/services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Admin/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Admin/AddTrainer.jsp">Add Trainer</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Admin/AddPackage.jsp">Add Package</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Admin/subscriptions.jsp">Subscriptions</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Admin/reportlist.jsp">Reports</a>
        </li>
       
        </ul>
		<!-- Admin NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			   <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/TrainerList.jsp">Trainer List</a>
  			   <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/AddCareer.jsp">Add Career</a>
  			    <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/CareerList.jsp">Career List</a>
  			    <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/add_video.jsp">Add Lectures</a>
  			    <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/ViewLectureList.jsp">Lecture List</a>
  			    <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/ViewLiveClassList.jsp">Live ClassList</a>
  			    <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/applicationsList.jsp">Applications List</a>
  			    <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/UserList.jsp">Client List</a>
  			    <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/PackageList.jsp">Package List</a>
  			   <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/AddGallery.jsp">Add Gallery</a>
  			    <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/GalleryList.jsp">Gallery List</a>
   			 <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/TrainerPayment.jsp">Trainer Payment</a>
   			 <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/TrainerPaymentList.jsp">Trainer PaymentList</a>
    		<a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Fitness_Club_Management_System/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>       
		 <%
        	} else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("trainer")){
        		
        %>
        
        <!-- Teacher Related navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/Fitness_Club_Management_System/Trainer/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Fitness_Club_Management_System/Trainer/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Fitness_Club_Management_System/Trainer/services.jsp">Services</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/Fitness_Club_Management_System/Trainer/contact.jsp">Contact Us</a>
          </div>
        </li>
       <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Trainer/gallery.jsp">Gallery</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Trainer/career.jsp">Career</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Trainer/schedule_class.jsp">Add Class</a>
        </li>
        </ul>
        
<!-- Teacher NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			<a class="dropdown-item" href="/Fitness_Club_Management_System/Trainer/YourProfile.jsp">Your Profile</a>
  			  <a class="dropdown-item" href="/Fitness_Club_Management_System/Trainer/ViewLiveClassList.jsp">Class List</a>
  			  <a class="dropdown-item" href="/Fitness_Club_Management_System/Trainer/PaymentHistory.jsp">Payment History</a>
    		<a class="dropdown-item" href="/Fitness_Club_Management_System/Trainer/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Fitness_Club_Management_System/Trainer/logout.jsp">Logout</a>
 		 </div>
			</div>

        
        <%
        	}else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("client")){
        		
        	
        %>
        
        <!-- Student Realated Navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/Fitness_Club_Management_System/Client/client.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Fitness_Club_Management_System/Client/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Fitness_Club_Management_System/Client/services.jsp">Services</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/Fitness_Club_Management_System/Client/contact.jsp">Contact Us</a>
          </div>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Client/client_dashboard.jsp">Dashboard</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Client/gallery.jsp">Gallery</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white active" href="/Fitness_Club_Management_System/Client/AllPackages.jsp">Packages</a>
        </li>
        
        
        </ul>
        
        <!-- Student NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Fitness_Club_Management_System/Client/YourProfile.jsp">Your Profile</a>
    		<a class="dropdown-item" href="/Fitness_Club_Management_System/Client/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Fitness_Club_Management_System/Client/logout.jsp">Logout</a>
 		 </div>
			</div>  
        
        <%
        	}
        %>
  </div>
  </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>