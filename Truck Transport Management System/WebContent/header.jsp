<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.db.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
    <%
    String  errorMsg="";
    String successMsg="";
    String backURL="";
    DataAccess db=new DataAccess();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Truck Transport Management System</title>
<link href="/Truck_Transport_Management_System/css/index.css" rel="stylesheet" />
<!-- <link href="/Truck_Transport_Management_System/css/bootstrap.css" rel="stylesheet" /> -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

</head>
<body>


 <!-- Navbar Start -->
   <nav class="navbar navbar-expand-lg bg-light  sticky-top px-4 px-lg-5 fs-5" data-bs-theme="light">
  <div class="container-fluid">
     <img src="/Truck_Transport_Management_System/img/Logo.png" class="navbar-brand" height="80" />  
   
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <%
      if(session.getAttribute("user")==null)//if No login
      {
      %>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Truck_Transport_Management_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/aboutus.jsp">About us</a>
        </li>
         <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/TruckList.jsp">Truck List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Booking.jsp">Service Areas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/faq.jsp">FAQ</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold " href="/Truck_Transport_Management_System/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold " href="/Truck_Transport_Management_System/BookTruck.jsp">Book Truck</a>
        </li>
        
      </ul>
      <form class="d-flex">
       <ul class="navbar-nav">
       <li class="nav-item">
          <a class="nav-link fw-bold font-monospace" href="/Truck_Transport_Management_System/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold font-monospace" href="/Truck_Transport_Management_System/signup.jsp">SignUp</a>
        </li>
        </ul>
        </form>
        
        <!-- Admin Page NavBar -->
        
        <%
       } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        %>
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Truck_Transport_Management_System/Admin/admin.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Admin/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Admin/admin_dashboard.jsp">Dashboard</a>
        </li>
         <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Admin/bookRequest.jsp">View Request</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Admin/ManageBookings.jsp">Manage booking</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Admin/DriverList.jsp">Manage Drivers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Admin/UserList.jsp">User List</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Admin/reportlist.jsp">Reports</a>
        </li>
        
        
      </ul>
 		 <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/YourProfile.jsp">Your Profile</a>
  			   <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/AddDriver.jsp">Add Driver</a>
  			    <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/AddTruck.jsp">Add Trucks</a>
  			    <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/AddCities.jsp">Add Cities</a>
  			    <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/AddCityDistances.jsp">Add City Distances</a>
  			    <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/DriverList.jsp">Driver List</a>
  			  <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/TruckList.jsp">Truck List</a>
  			  <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/DriverPayment.jsp">Make Payment</a>
    		<a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Truck_Transport_Management_System/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>
        <!-- Donor NavBar  -->
        
         <%
     } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")){
        %>
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Truck_Transport_Management_System/Customer/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Customer/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Customer/TruckList.jsp">Truck List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Customer/Booking.jsp">Service Areas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Customer/faq.jsp">FAQ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Customer/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Customer/BookTruck.jsp">Book Truck</a>
        </li>
        
        
        
      </ul>
       <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Truck_Transport_Management_System/Customer/YourProfile.jsp">Your Profile</a>
  			   <a class="dropdown-item" href="/Truck_Transport_Management_System/Customer/MyBooking.jsp">My Booking</a>
  			  <a class="dropdown-item" href="/Truck_Transport_Management_System/Customer/FindBooking.jsp">Find Booking</a>
    		<a class="dropdown-item" href="/Truck_Transport_Management_System/Customer/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Truck_Transport_Management_System/Customer/logout.jsp">Logout</a>
 		 </div>
			</div>
      
        <!-- Requester NavBar  -->
         <%
      } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("driver")){
        %>
         <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Truck_Transport_Management_System/Driver/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Driver/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Driver/TruckList.jsp">Truck List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Driver/Booking.jsp">Service Areas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Driver/faq.jsp">FAQ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Truck_Transport_Management_System/Driver/contact.jsp">Contact</a>
        </li>
       
        
        
      </ul>
       <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Truck_Transport_Management_System/Driver/YourProfile.jsp">Your Profile</a>
  			  <a class="dropdown-item" href="/Truck_Transport_Management_System/Driver/ViewTrip.jsp">My Trips</a>
  			   <a class="dropdown-item" href="/Truck_Transport_Management_System/Driver/MySalary.jsp">My Salary</a>
    		<a class="dropdown-item" href="/Truck_Transport_Management_System/Driver/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Truck_Transport_Management_System/Driver/logout.jsp">Logout</a>
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

