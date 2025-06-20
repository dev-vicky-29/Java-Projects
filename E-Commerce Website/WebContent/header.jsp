<%@page import="com.util.db.DataAccess"%> <%@page import="com.util.db.DataAccess"%>
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
<title>E-Commerce Shop</title>
<!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    
        <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Oswald:wght@500;600;700&family=Pacifico&display=swap" rel="stylesheet"> 

    

<link href="/E-Commerce_Website/css/bootstrap.css" rel="stylesheet">
<link href="/E-Commerce_Website/css/bootstrap.min.css" rel="stylesheet">
<style>
label.error{
color:red;
font-weight:bold;
}

.footer {
            background: #1e293b;
            color: white;
            text-align: center;
            padding: 20px;
        }
</style>
</head>
<body>

 <!-- Navbar Start -->
   <nav class="navbar navbar-expand-lg bg-primary navbar-light sticky-top px-4 px-lg-5 fs-5" data-bs-theme="dark">
  <div class="container-fluid">
     <img src="/E-Commerce_Website/img/Logo.png" class="navbar-brand" height="50" />  
   
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
          <a class="nav-link active fw-bold" href="/E-Commerce_Website/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white fw-bold" href="/E-Commerce_Website/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white fw-bold" href="/E-Commerce_Website/product.jsp">Products</a>
        </li>
        
        
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/E-Commerce_Website/contact.jsp">Contact</a>
        </li>
        
      </ul>
      <form class="d-flex">
       <ul class="navbar-nav">
       <li class="nav-item">
          <a class="nav-link fw-bold font-monospace" href="/E-Commerce_Website/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold font-monospace" href="/E-Commerce_Website/signup.jsp">SignUp</a>
        </li>
        </ul>
        </form>
        
        <%
      } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        %>
        
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/E-Commerce_Website/Admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  text-white" href="/E-Commerce_Website/Admin/aboutus.jsp">About us</a>
        </li>
          <li class="nav-item">
          <a class="nav-link text-white" href="/E-Commerce_Website/Admin/dashboard.jsp">Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/E-Commerce_Website/Admin/product.jsp">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  text-white" href="/E-Commerce_Website/Admin/orders2.jsp">View Orders</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/E-Commerce_Website/Admin/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  text-white" href="/E-Commerce_Website/Admin/reports.jsp">Reports</a>
        </li>
        </ul>
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
       
        <a class="dropdown-item" href="/E-Commerce_Website/Admin/addcategory.jsp">Add Categories</a>
        <a class="dropdown-item" href="/E-Commerce_Website/Admin/category_list.jsp">View Categories</a>
        <a class="dropdown-item" href="/E-Commerce_Website/Admin/addsubcategory.jsp">Add SubCategories</a>
        <a class="dropdown-item" href="/E-Commerce_Website/Admin/subcategorylist.jsp">View Categories</a>
        <a class="dropdown-item" href="/E-Commerce_Website/Admin/AddProduct.jsp">Add Product</a>
        <a class="dropdown-item" href="/E-Commerce_Website/Admin/ProductList.jsp">View Product</a>
         <a class="dropdown-item" href="/E-Commerce_Website/Admin/reports.jsp">View Reports</a>
      <a class="dropdown-item" href="/E-Commerce_Website/Admin/ChangePassword.jsp">Change Password</a>
       <a class="dropdown-item" href="/E-Commerce_Website/Admin/logout.jsp">Logout</a>
    </div>
   </div>  
      
   <!-- Customer NavBar -->
        
         <%
      } else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")){
        %>
        
        <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/E-Commerce_Website/Customer/customer.jsp">Customer
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link  text-white" href="/E-Commerce_Website/Customer/aboutus.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/E-Commerce_Website/Customer/product.jsp">Products</a>
        </li>
      
        
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/E-Commerce_Website/Customer/feedback.jsp">Feedback</a>
        </li>
         
        </ul>
       <!-- Collector NavBar After Login -->
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
       <a class="dropdown-item" href="/E-Commerce_Website/Customer/YourProfile.jsp">Your Profile</a>
        <a class="dropdown-item" href="/E-Commerce_Website/Customer/cart.jsp">My Cart</a>
        <a class="dropdown-item" href="/E-Commerce_Website/Customer/orderhistory.jsp">Orders</a>
        <a class="dropdown-item" href="/E-Commerce_Website/Customer/contact.jsp">Contact us</a>
      <a class="dropdown-item" href="/E-Commerce_Website/Customer/changepassword.jsp">Change Password</a>
       <a class="dropdown-item" href="/E-Commerce_Website/Customer/logout.jsp">Logout</a>
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