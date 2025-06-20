<%@page import="com.util.db.DataAccess"%> 
<%@page import="com.util.db.DataAccess"%>
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
<title>Online Book Shop</title>
<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Oswald:wght@500;600;700&family=Pacifico&display=swap" rel="stylesheet"> 

<link href="/Online_Book_Shop/css/bootstrap.css" rel="stylesheet">
<link href="/Online_Book_Shop/css/bootstrap.min.css" rel="stylesheet">
<style>
label.error {
    color:red;
    font-weight:bold;
}
</style>
</head>
<body>

<!-- Navbar Start bg-#fd7e14 style="background-color:#fd7e14;"-->
<nav class="navbar navbar-expand-lg bg-primary  navbar-light sticky-top px-4 px-lg-5 fs-5"  data-bs-theme="dark">
  <div class="container-fluid">
    <img src="/Online_Book_Shop/img/BookShopLogo1.png" class="navbar-brand rounded-circle" height="50" />
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <%
      if(session.getAttribute("user") == null) { // If No login
      %>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Book_Shop/index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white fw-bold" href="/Online_Book_Shop/about.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white fw-bold" href="/Online_Book_Shop/Services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white fw-bold" href="/Online_Book_Shop/Products.jsp">Books</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Contact.jsp">Contact</a>
        </li>
      </ul>
      <form class="d-flex">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link fw-bold font-monospace" href="/Online_Book_Shop/login.jsp">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link fw-bold font-monospace" href="/Online_Book_Shop/signup.jsp">SignUp</a>
          </li>
        </ul>
      </form>
      
      <%
      } else if(session.getAttribute("user") != null && session.getAttribute("type").equals("admin")) {
      %>

      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Book_Shop/Admin/admin.jsp">Admin</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Admin/about.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Admin/Services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Admin/Products.jsp">Products</a>
        </li>
       
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Admin/Contact.jsp">Contact</a>
        </li>
          <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Admin/orders2.jsp">View Orders</a>
        </li> 
       
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Admin/reportlist.jsp">Report</a>
        </li> 
        
      </ul>

      <div class="nav-item dropdown d-flex float-end">
        <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Profile Photo"/>
        <div class="dropdown-menu dropdown-menu-end">
          <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/addcategory.jsp">Add Categories</a>
          <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/category_list.jsp">View Categories</a>
          <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/AddProduct.jsp">Add Book</a>
          <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/ProductList.jsp">View Books</a>
          <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/productqtylist.jsp">View Quantity</a>
           <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/ContactList.jsp">Contact List</a>
           <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/feedbacklist.jsp">Feedback List</a>
          <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/changepassword.jsp">Change Password</a>
          <a class="dropdown-item fw-bold text-white" href="/Online_Book_Shop/Admin/logout.jsp">Logout</a>
        </div>
      </div>

      <%
      } else if(session.getAttribute("user") != null && session.getAttribute("type").equals("customer")) {
      %>

      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-bold" href="/Online_Book_Shop/Customer/customer.jsp">Customer</a>
        </li>
         <li class="nav-item">
          <a class="nav-link fw-bold  text-white" href="/Online_Book_Shop/Customer/about.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Customer/Services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Customer/Products.jsp">Products</a>
        </li>
       
        
         <li class="nav-item">
          <a class="nav-link fw-bold text-white" href="/Online_Book_Shop/Customer/Contact.jsp">Contact</a>
        </li>
      </ul>

      <div class="nav-item dropdown d-flex float-end">
        <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Profile Photo"/>
        <div class="dropdown-menu dropdown-menu-end">
          <a class="dropdown-item text-light" href="/Online_Book_Shop/Customer/cart.jsp">My Cart</a>
          <a class="dropdown-item text-light" href="/Online_Book_Shop/Customer/orderhistory.jsp">My Orders</a>
          <a class="dropdown-item text-light" href="/Online_Book_Shop/Customer/changepassword.jsp">Change Password</a>
          <a class="dropdown-item text-light" href="/Online_Book_Shop/Customer/logout.jsp">Logout</a>
        </div>
      </div>

      <%
      }
      %>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

