<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.db.DataAccess"%>
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
<title>Primary School Management System</title>
<link href="/Primary_School_Management_System/css/bootstrap.css" rel="stylesheet"/>
<link href="/Primary_School_Management_System/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/Primary_School_Management_System/css/Style.css" rel="stylesheet"/>
<!-- DataTables CSS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">


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
    <img src="/Primary_School_Management_System/img/logo.png" class="navbar-brand " height="50" />
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold active" href="/Primary_School_Management_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
       
     
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/aboutus.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/News.jsp">News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Lecture.jsp">Lectures</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/contactus.jsp">Contact</a>
        </li>
      
       </ul>
      <form class="d-flex">
       <ul class="navbar-nav">
         <!-- Login & Sign Up -->
         <li class="nav-item float-end">
         <a class="nav-link fw-bold text-white hover" href="/Primary_School_Management_System/login.jsp">Login</a>
         
         </li>
         <li class="nav-item float-end">
         <a class="nav-link fw-bold text-white hover" href="/Primary_School_Management_System/signup.jsp">Signup</a>
         </li>
          </ul>
        </form>
       
        <%
        	} else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        		
      	%>
        <!-- Admin Related Navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold  active" href="/Primary_School_Management_System/Admin/index.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
      <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/aboutus.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/Dashboard.jsp">Dashboard</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/approve_students.jsp">View Student</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/AssignClassTeacher.jsp">Class Teacher</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/teacherAttendance.jsp">Teacher Attendance</a>
        </li>
          <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/News.jsp">News</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/LiveClassList.jsp">Live Classes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/Lecture.jsp">Lectures</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Admin/reportlist.jsp">Reports</a>
        </li>
      
      
        </ul>
		<!-- Admin NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Admin/AddClass.jsp">Add Class</a>
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Admin/ClassList.jsp">Class List</a>
  			  	<a class="dropdown-item" href="/Primary_School_Management_System/Admin/AddSubject.jsp">Add Subject</a>	
  			  	<a class="dropdown-item" href="/Primary_School_Management_System/Admin/SubjectList.jsp">Subject List</a>
  			   <a class="dropdown-item" href="/Primary_School_Management_System/Admin/AddTeacher.jsp">Add Teacher</a>
  			   <a class="dropdown-item" href="/Primary_School_Management_System/Admin/TeacherList.jsp">Teacher List</a>
  			   <a class="dropdown-item" href="/Primary_School_Management_System/Admin/ManageLecture.jsp">Add Lecture</a>
  			   <a class="dropdown-item" href="/Primary_School_Management_System/Admin/viewAttendance.jsp">View Teacher Attendance</a>
  			     <a class="dropdown-item" href="/Primary_School_Management_System/Admin/AddAnnouncement.jsp">Add News</a>
  			       
  			     
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Admin/ContactList.jsp">Contact List</a>
  			  
    		<a class="dropdown-item" href="/Primary_School_Management_System/Admin/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Primary_School_Management_System/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>       
		 <%
        	}   else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("teacher")){
        		
        %>
        
        <!-- Student Related navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold active" href="/Primary_School_Management_System/Teacher/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Teacher/aboutus.jsp">About</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Teacher/News.jsp">News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Teacher/MyLiveClass.jsp">Live Class</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Teacher/Lecture.jsp">Lectures</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Teacher/MyClass.jsp">My Class</a>
        </li>
        
        </ul>
        
<!-- Student NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Teacher/YourProfile.jsp">Your Profile</a>
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Teacher/AddLiveClass.jsp">Add Live Class</a>
  			  
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Teacher/AddNotes.jsp">Add Notes</a>
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Teacher/MyNotes.jsp"></a>
    		<a class="dropdown-item" href="/Primary_School_Management_System/Teacher/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Primary_School_Management_System/Teacher/logout.jsp">Logout</a>
 		 </div>
			</div>

         <%
        	}   else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("student")){
        		
        %>
        
        <!-- Student Related navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold active" href="/Primary_School_Management_System/Student/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Student/aboutus.jsp">About</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Student/News.jsp">News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Student/Lecture.jsp">Lectures</a>
        </li>
       
       
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Primary_School_Management_System/Student/contactus.jsp">Conatct</a>
        </li>
        
        </ul>
        
<!-- Student NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Student/YourProfile.jsp">Your Profile</a>
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Student/StudentLiveClass.jsp">My Live Class</a>
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Student/MyLecture.jsp">My Lecture</a>
  			  <a class="dropdown-item" href="/Primary_School_Management_System/Student/Mynotes.jsp">My Notes</a>
  			  
    		<a class="dropdown-item" href="/Primary_School_Management_System/Student/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Primary_School_Management_System/Student/logout.jsp">Logout</a>
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

