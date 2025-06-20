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
<title>Online Education System</title>
<link href="/Online_Education_System/css/bootstrap.css" rel="stylesheet"/>
<link href="/Online_Education_System/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/Online_Education_System/css/Style.css" rel="stylesheet"/>

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
    <a class="navbar-brand" href="#">OES</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold active" href="/Online_Education_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
       
     
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/aboutus.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/News.jsp">News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/career.jsp">Career</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/contactus.jsp">Contact</a>
        </li>
      
       </ul>
      <form class="d-flex">
       <ul class="navbar-nav">
         <!-- Login & Sign Up -->
         <li class="nav-item float-end">
         <a class="nav-link fw-bold text-white hover" href="/Online_Education_System/login.jsp">Login</a>
         
         </li>
         <li class="nav-item float-end">
         <a class="nav-link fw-bold text-white hover" href="/Online_Education_System/signup.jsp">Signup</a>
         </li>
          </ul>
        </form>
       
        <%
        	} else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        		
      	%>
        <!-- Admin Related Navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold  active" href="/Online_Education_System/Admin/index.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
      <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Admin/aboutus.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Admin/Dashboard.jsp">Dashboard</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Admin/approve_students.jsp">View Student</a>
        </li>
          <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Admin/News.jsp">News</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Admin/LiveClass.jsp">Live Classes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Admin/Lecture.jsp">Lectures</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Admin/reportlist.jsp">Reports</a>
        </li>
      
      
        </ul>
		<!-- Admin NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  
  			  <a class="dropdown-item" href="/Online_Education_System/Admin/AddCourse.jsp">Add Course</a>			   
  			   <a class="dropdown-item" href="/Online_Education_System/Admin/AddLiveClass.jsp">Add Live Class</a>
  			   <a class="dropdown-item" href="/Online_Education_System/Admin/AddLecture.jsp">Add Lecture</a>
  			   <a class="dropdown-item" href="/Online_Education_System/Admin/AddNotes.jsp">Add Notes</a>
  			     <a class="dropdown-item" href="/Online_Education_System/Admin/AddNews.jsp">Add News</a>
  			       <a class="dropdown-item" href="/Online_Education_System/Admin/AddHackathon.jsp">Add Hackathon</a>
  			       <a class="dropdown-item" href="/Online_Education_System/Admin/AddJob.jsp">Add Job</a>
  			  <a class="dropdown-item" href="/Online_Education_System/Admin/ContactList.jsp">Contact List</a>
  			  <a class="dropdown-item" href="/Online_Education_System/Admin/FeedbackList.jsp">Feedback List</a>
    		<a class="dropdown-item" href="/Online_Education_System/Admin/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Online_Education_System/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>       
		 <%
        	}   else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("student")){
        		
        %>
        
        <!-- Student Related navbar -->
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-bold active" href="/Online_Education_System/Student/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Student/aboutus.jsp">About</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Student/News.jsp">News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Student/Career.jsp">Career</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Student/Hackathon.jsp">Hackathon</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Student/Lecture.jsp">Lectures</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Education_System/Student/Feedback.jsp">Feedback</a>
        </li>
        
        </ul>
        
<!-- Student NavBar After Login -->
			<div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  <a class="dropdown-item" href="/Online_Education_System/Student/YourProfile.jsp">Your Profile</a>
  			  <a class="dropdown-item" href="/Online_Education_System/Student/MyLiveClass.jsp">My Live Class</a>
  			  <a class="dropdown-item" href="/Online_Education_System/Student/MyLecture.jsp">My Lecture</a>
  			  <a class="dropdown-item" href="/Online_Education_System/Student/MyNotes.jsp">My Notes</a>
  			  <a class="dropdown-item" href="/Online_Education_System/Student/MyNotes.jsp"></a>
    		<a class="dropdown-item" href="/Online_Education_System/Student/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Online_Education_System/Student/logout.jsp">Logout</a>
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

