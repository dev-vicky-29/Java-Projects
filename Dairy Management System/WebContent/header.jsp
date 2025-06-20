<%@ page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
      DataAccess db=new DataAccess();
      String successMsg="";
      String errorMsg="";
      String redirectUrlSuccess="";
      String redirectUrlError="";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dairy management system</title>
<link href="/Dairy_Management_System/css/bootstrap.css" rel="stylesheet"/>
<link href="/Dairy_Management_System/css/Style.css" rel="stylesheet"/>
<style>
label.error{
color:red;
font-weight:bold;
}
</style>
</head>
<body>


  <!-- For DropDown -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


<nav class="navbar navbar-expand-lg bg-info navbar-light sticky-top px-4 px-lg-5 fs-5" data-bs-theme="dark">
  <div class="container-fluid ">
    <a class="navbar-brand" href="/Dairy_Management_System/index.jsp">Sidhnath Dairy</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      
      <!-- Master Page When no one is Login -->
      
      <%
      if(session.getAttribute("user")==null) //if no login
      {
      %>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/Dairy_Management_System/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_Management_System/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_Management_System/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_Management_System/ourjourney.jsp">Our Journey</a>
            </div>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/animalfeed.jsp">Animal feed</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/milkratecard.jsp">Milk rate card</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/contact.jsp">Contact</a>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/login.jsp">Login</a>
        </li>
                
             </ul>  
      
      <!-- Admin Page When Admin  is Login -->
      
         <%
           }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
         %> 
         <ul class="navbar-nav me-auto">
         <li class="nav-item">
          <a class="nav-link active" href="/Dairy_Management_System/admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_Management_System/admin/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_Management_System/admin/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_Management_System/admin/ourjourney.jsp">Our Journey</a>
            </div>
        </li> 
        <li class="nav-item ">
            
            <a class="nav-link" href="/Dairy_Management_System/admin/adduser.jsp">Add User</a>
           
        </li>             
          <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/admin/AddMilkSell.jsp">Add Milk</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/admin/animalfeed.jsp">Animal feed</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/admin/MilkCollection.jsp">View Milk Card</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/admin/Bill.jsp">Payment</a>
        </li> 
        </ul>
        <!-- Admin NavBar After Login -->
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
        <a class="dropdown-item" href="/Dairy_Management_System/admin/addanimalfeed.jsp">Add Animal Feed</a>
        <a class="dropdown-item" href="/Dairy_Management_System/admin/customerlist.jsp">View Customer List</a>
        <a class="dropdown-item" href="/Dairy_Management_System/admin/supplierlist.jsp">View Supplier List</a>
        <a class="dropdown-item" href="/Dairy_Management_System/admin/feedbacks.jsp">View FeedBacks</a>
          <a class="dropdown-item" href="/Dairy_Management_System/admin/OrderFeedList.jsp">View Ordered Feed</a>
        <a class="dropdown-item" href="/Dairy_Management_System/admin/FatRate.jsp">View Milk Rate Card</a>
        <a class="dropdown-item" href="/Dairy_Management_System/admin/DailyCollection.jsp">View Daily Collection</a>
         <a class="dropdown-item" href="/Dairy_Management_System/admin/MilkCollectionReport.jsp">View Milk Collection</a>
         <a class="dropdown-item" href="/Dairy_Management_System/admin/updateMilkRate.jsp">Update Milk Rate</a>
        <a class="dropdown-item" href="/Dairy_Management_System/admin/setmilkrate.jsp">Set Milk Rate</a>
                <a class="dropdown-item" href="/Dairy_Management_System/admin/reportlist.jsp">Reports</a>
      <a class="dropdown-item" href="/Dairy_Management_System/admin/changepass.jsp">Change Password</a>
       <a class="dropdown-item" href="/Dairy_Management_System/admin/logout.jsp">Logout</a>
    </div>
   </div>
       
      
             <!-- Customer Page When Customer is Login -->
                                                              
      <%
      }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")){
      %>
      <ul class="navbar-nav me-auto">
      <li class="nav-item">
          <a class="nav-link active" href="/Dairy_Management_System/customer/customer.jsp">Customer
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_Management_System/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_Management_System/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_Management_System/ourjourney.jsp">Our Journey</a>
            </div>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Bill</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_Management_System/customer/addsupplier.jsp">Bill Card</a>
            <a class="dropdown-item" href="/Dairy_Management_System/customer/addcustomer.jsp">Bill Report</a>
            </div>
        </li>             
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/animalfeed.jsp">Animal feed</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="milkbuy.jsp">Feedback</a>
        </li>
        </ul>
           <!-- Customer NavBar After Login -->
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
       <a class="dropdown-item" href="/Dairy_Management_System/customer/YourProfile.jsp">Your Profile</a>
        <a class="dropdown-item" href="/Dairy_Management_System/customer/addanimalfeed.jsp">View Milk Rate</a>
      <a class="dropdown-item" href="/Dairy_Management_System/customer/FatSnf.jsp">Fat & SNF Chart</a>
      <a class="dropdown-item" href="/Dairy_Management_System/customer/changepassword.jsp">Change Password</a>
       <a class="dropdown-item" href="/Dairy_Management_System/customer/logout.jsp">Logout</a>
    </div>
   </div>           
             <!-- Supplier Page when Supplier is Login -->
      <%
      }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("supplier")){
      %>
            <ul class="navbar-nav me-auto">
      <li class="nav-item">
          <a class="nav-link active" href="/Dairy_Management_System/supplier/supplier.jsp">Supplier
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_Management_System/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_Management_System/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_Management_System/ourjourney.jsp">Our Journey</a>
            </div>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Bill</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_Management_System/supplier/billcard.jsp">Bill Card</a>
            <a class="dropdown-item" href="/Dairy_Management_System/supplier/billreport.jsp">Bill Report</a>
            </div>
        </li>             
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/supplier/orderfeed.jsp">Animal feed</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_Management_System/supplier/contact.jsp">Feedback</a>
        </li>
        </ul>
           <!-- Supplier NavBar After Login -->
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
        <a class="dropdown-item" href="/Dairy_Management_System/supplier/milkratecard.jsp">View Milk Rate</a>
      <a class="dropdown-item" href="/Dairy_Management_System/supplier/changepass.jsp">Change Password</a>
       <a class="dropdown-item" href="/Dairy_Management_System/supplier/logout.jsp">Logout</a>
    </div>
   </div> 
   
          
      <%
      }
      %>
      </div>
        </div> 
       
      </nav> 
      
      
      
      
          
      