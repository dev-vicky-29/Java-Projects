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
<title>Online Blood Bank Management System</title>
<link href="/Online_Blood_Bank_Management_System/css/index.css" rel="stylesheet" />
<!-- <link href="/Online_Blood_Bank_Management_System/css/bootstrap.css" rel="stylesheet" /> -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

</head>
<body>


 <!-- Navbar Start -->
   <nav class="navbar navbar-expand-lg bg-light  sticky-top px-4 px-lg-5 fs-5" data-bs-theme="light">
  <div class="container-fluid">
     <img src="/Online_Blood_Bank_Management_System/img/BloodDonationLogo.png" class="navbar-brand" height="80" />  
   
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
          <a class="nav-link active fw-bold" href="/Online_Blood_Bank_Management_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/aboutus.jsp">About us</a>
        </li>
         <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/blood_availability.jsp">Blood Availability</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/search_donors.jsp">Find Donors</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/request_blood.jsp">Request Blood</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold " href="/Online_Blood_Bank_Management_System/contact.jsp">Contact</a>
        </li>
        <!-- 
        <li class="nav-item">
          <a class="nav-link fw-bold " href="/Online_Blood_Bank_Management_System/feedback.jsp">Feedback</a>
        </li>
         -->
        
      </ul>
      <form class="d-flex">
       <ul class="navbar-nav">
       
       <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle fw-bold font-monospace" href="#" id="loginDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        Login
    </a>
    <ul class="dropdown-menu" aria-labelledby="loginDropdown">
        <li><a class="dropdown-item" href="/Online_Blood_Bank_Management_System/admin_login.jsp">Admin</a></li>
        <li><a class="dropdown-item" href="/Online_Blood_Bank_Management_System/donor_login.jsp">Donor</a></li>
        <li><a class="dropdown-item" href="/Online_Blood_Bank_Management_System/requester_login.jsp">Requester</a></li>
        <li><a class="dropdown-item" href="/Online_Blood_Bank_Management_System/hospital_login.jsp">Hospital</a></li>
    </ul>
</li>
       <li class="nav-item">
          <a class="nav-link fw-bold font-monospace" href="/Online_Blood_Bank_Management_System/Become_Donor.jsp">Become-Donor</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold font-monospace" href="/Online_Blood_Bank_Management_System/signup.jsp">SignUp</a>
        </li>
        </ul>
        </form>
        
        <!-- Admin Page NavBar -->
        
        <%
       } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("Admin")){
        %>
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Blood_Bank_Management_System/Admin/admin.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Admin/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Admin/admin_dashboard.jsp">Dashboard</a>
        </li>
         <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Admin/bloodRequest.jsp">View Request</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Admin/manage_stock.jsp">Manage Stock</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Admin/manage_donors.jsp">Manage Donors</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Admin/donor_list.jsp">Donor List</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Admin/reports.jsp">Reports</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold " href="/Online_Blood_Bank_Management_System/Admin/Events.jsp">Events</a>
        </li>
        
      </ul>
 		 <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  
  			   <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Admin/add_donor.jsp">Add Donor</a>
  			    <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Admin/add_BloodBank.jsp">Add Blood Banks</a>
  			    <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Admin/add_Events.jsp">Add Events</a>
  			    <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Admin/bloodRequestList.jsp">Blood Request List</a>
  			 
    		<a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Admin/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>
        <!-- Donor NavBar  -->
        
         <%
     } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("Donor")){
        %>
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Blood_Bank_Management_System/Donor/donor.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Donor/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Donor/emergency.jsp">Emergency</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Donor/Events.jsp">Events</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Donor/blood_banks.jsp">Blood Banks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Donor/request_blood.jsp">Request Blood</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Donor/feedback.jsp">Feedback</a>
        </li>
        
        
        
      </ul>
       <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Donor/YourProfile.jsp">Your Profile</a>
  			   <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Donor/donation_history.jsp">Donation History</a>
  			  <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Donor/track_request.jsp">Track Request</a>
    		<a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Donor/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Donor/logout.jsp">Logout</a>
 		 </div>
			</div>
      
        <!-- Requester NavBar  -->
         <%
      } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("Requester")){
        %>
         <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Blood_Bank_Management_System/Requester/requester.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Requester/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Requester/blood_availability.jsp">Blood Availability</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Requester/request_blood.jsp">Request Blood</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Requester/feedback.jsp">Feedback</a>
        </li>
        
        
      </ul>
       <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Requester/YourProfile.jsp">Your Profile</a>
  			  <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Requester/track_request.jsp">Track Request</a>
    		<a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Requester/changePassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Requester/logout.jsp">Logout</a>
 		 </div>
			</div> 
      
        <!-- Hospital NavBar  -->
        <%
      } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("Hospital")){
        %>
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Blood_Bank_Management_System/Hospital/hospital.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Hospital/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Hospital/blood_availability.jsp">Blood Availability</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Hospital/request_blood.jsp">Request Blood</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Hospital/search_donors.jsp">Find Donors</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Blood_Bank_Management_System/Hospital/feedback.jsp">Feedback</a>
        </li>
         
        
      </ul>
      
      <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Hospital/YourProfile.jsp">Your Profile</a>
  			  <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Hospital/track_request.jsp">Track Request</a>
    		<a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Hospital/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Online_Blood_Bank_Management_System/Hospital/logout.jsp">Logout</a>
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

