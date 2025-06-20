<%@ include file="../header.jsp"%>

 <%@page import="java.sql.ResultSet"%>
 
 <div class="container">
 <br>
 <hr>
 <br>
 <h1 class="text-center bg-warning text-dark">Cake Palace Products</h1>
<br>
<hr>
<br> 
 </div>
 
<div class="row row-cols-1 row-cols-md-3 g-4">
  
  <%
  //Retrive Product list from the database
  ResultSet rs=db.getRows("select * from product");
  while(rs.next()){

  
  %>
  <div class="col">
  <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="/Online_Bakery_Shop/ProductImages/<%= rs.getString(9) %>" class="img-fluid rounded-start h-auto" alt="Product Images">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title fw-bold"><%= rs.getString(2) %></h5>
        <p class="card-text "> <%= rs.getString(4) %></p>
        <p class="card-text font-monospace">Product Size: <%= rs.getString(5) %></p>
        <p class="card-text"><small class="text-muted text-decoration-line-through">MRP:- <%= rs.getString(6) %></small></p>
        <p class="card-text"><small class="fw-bold">Discount Price:- <%= rs.getString(7) %></small></p>
        <div class="text-center d-grid gap-2">
        <a href="#" class="btn  btn-primary">Buy Now</a>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

 

<%
 }
 %>
 </div>

<%@ include file="../footer.jsp"%>