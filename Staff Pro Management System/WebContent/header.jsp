<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%
    String  errorMsg="";
    String successMsg="";
    DataAccess db=new DataAccess();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Project Management System</title>
<link href="/Staff_Pro_Management_System/css/bootstrap.css" rel="stylesheet"/>
<link href="/Staff_Pro_Management_System/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/Staff_Pro_Management_System/css/Style.css" rel="stylesheet"/>

<!-- Add this CSS code in the head section or in an external stylesheet -->
<style>
  label.error {
    color: red;
  }
</style>

</head>
<body>
						<!-- Nav Bar Section -->
<nav class="navbar navbar-expand-lg bg-info sticky-top" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">SPMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold active" href="/Staff_Pro_Management_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
       
     
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/aboutus.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/career.jsp">Career</a>
        </li>
      <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/contact.jsp">Contact</a>
        </li>
       </ul>
      <form class="d-flex">
       <ul class="navbar-nav">
         <!-- Login & Sign Up -->
         <li class="nav-item float-end">
         <a class="nav-link fw-bold text-white hover" href="/Staff_Pro_Management_System/login.jsp">Login</a>
         </li>
          </ul>
        </form>
       
        <%
        	} else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        		
      	%>
        <!-- Admin Related Navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold  active" href="/Staff_Pro_Management_System/Admin/index.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
      <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Admin/aboutus.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Admin/dashboard.jsp">Dashboard</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Admin/Attendance.jsp">Attendance</a>
        </li>
          <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Admin/StaffAttendanceReport.jsp">Attendance Report</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Admin/approve_reject_leave.jsp">Leave Request</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Admin/reportlist.jsp">Reports</a>
        </li>
      
      
        </ul>
		<!-- Admin NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  
  			  <a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/AddDepartment.jsp">Add Department</a>			   
  			   <a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/AddStaff.jsp">Add Staff</a>
  			   <a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/AddSalary.jsp">Add Salary</a>
  			   <a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/MakePayment.jsp">Make Payment</a>
  			     <a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/StaffList.jsp">Staff List</a>
  			       <a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/DepartmentList.jsp">Department List</a>
  			  <a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/ContactList.jsp">Contact List</a>
    		<a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Staff_Pro_Management_System/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>       
		 <%
        	} else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("staff")){
        		
        %>
        
        <!-- Teacher Related navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold active" href="/Staff_Pro_Management_System/Staff/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Staff/aboutus.jsp">About</a>
        </li>
       <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Staff/dashboard.jsp">Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Staff/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Staff_Pro_Management_System/Staff/leave_request.jsp">Leave</a>
        </li>
        
        </ul>
        
<!-- Teacher NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Staff_Pro_Management_System/Staff/YourProfile.jsp">Your Profile</a>
  			  <a class="dropdown-item" href="/Staff_Pro_Management_System/Staff/MySalary.jsp">My Salary</a>
  			  <a class="dropdown-item" href="/Staff_Pro_Management_System/Staff/StaffAttendanceReport.jsp">My Attendance</a>
  			  <a class="dropdown-item" href="/Staff_Pro_Management_System/Staff/MyLeaves.jsp">My Leaves</a>
    		<a class="dropdown-item" href="/Staff_Pro_Management_System/Staff/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Staff_Pro_Management_System/Staff/logout.jsp">Logout</a>
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
<!-- Header Auto Type -->
