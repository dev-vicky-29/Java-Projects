<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.db.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
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
<title>Online Fertilizer Shop</title>
<link href="/Online_Fertilizer_Shop/css/index.css" rel="stylesheet" />
<!-- <link href="/Online_Fertilizer_Shop/css/bootstrap.css" rel="stylesheet" /> -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

</head>
<body>


 <!-- Navbar Start -->
   <nav class="navbar navbar-expand-lg bg-success  sticky-top px-4 px-lg-5 fs-5 " data-bs-theme="light">
  <div class="container-fluid">
     <img src="/Online_Fertilizer_Shop/img/Logo.png" class="navbar-brand" height="80" />  
   
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
          <a class="nav-link active fw-bold" href="/Online_Fertilizer_Shop/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/aboutus.jsp">About us</a>
        </li>
         <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/products.jsp">Products</a>
        </li>
       
         <li class="nav-item">
          <a class="nav-link fw-bold " href="/Online_Fertilizer_Shop/contact.jsp">Contact</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold " href="/Online_Fertilizer_Shop/FeedbackCard.jsp">FeedBack</a>
        </li>
        
        
      </ul>
      <form class="d-flex">
       <ul class="navbar-nav">
       <li class="nav-item">
          <a class="nav-link fw-bold font-monospace" href="/Online_Fertilizer_Shop/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold font-monospace" href="/Online_Fertilizer_Shop/signup.jsp">SignUp</a>
        </li>
        </ul>
        </form>
        
        <!-- Admin Page NavBar -->
        
        <%
       } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        %>
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Fertilizer_Shop/Admin/admin.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Admin/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Admin/dashboard.jsp">Dashboard</a>
        </li>
         <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Admin/products.jsp">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Admin/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Admin/feedback.jsp">FeedBack</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Admin/reportlist.jsp">Reports</a>
        </li>
         
        
      </ul>
 		 <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  
  			  <a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/AddCategories.jsp">Add Category</a>
  			  <a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/AddProduct.jsp">Add Product</a>
  			  <a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/ProductList.jsp">Product List</a>
  			  <a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/ProductQtyList.jsp">Quantity List</a>
  			   <a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/manageCategories.jsp">Manage Categories</a>
  			   
  			    <a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/manageOrders.jsp">Manage Orders</a>
  			    <a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/manageUsers.jsp">Manage Users</a>
    		<a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/changePassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Online_Fertilizer_Shop/Admin/logout.jsp">Logout</a>
 		 </div>
			</div>
			
        <!-- Customer NavBar  -->
        
         <%
     } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")){
        %>
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Fertilizer_Shop/Customer/customer.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Customer/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Customer/Products.jsp">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Customer/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  fw-bold" href="/Online_Fertilizer_Shop/Customer/feedback.jsp">Feedback</a>
        </li>
        
        
        
      </ul>
       <div class="nav-item dropdown d-flex float-end" >
  			<img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
  			<div class="dropdown-menu dropdown-menu-end">
  			  
  			   <a class="dropdown-item" href="/Online_Fertilizer_Shop/Customer/cart.jsp">My Cart</a>
  			  <a class="dropdown-item" href="/Online_Fertilizer_Shop/Customer/ordersHistory.jsp">My Orders</a>
    		<a class="dropdown-item" href="/Online_Fertilizer_Shop/Customer/changepassword.jsp">Change Password</a>
   			 <a class="dropdown-item" href="/Online_Fertilizer_Shop/Customer/logout.jsp">Logout</a>
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

