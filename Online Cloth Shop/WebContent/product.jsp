 <%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"  %>
 <link href="/Online_Cloth_Shop/css/product.css" rel="stylesheet">
  <!-- Page Content -->
    <div class="page-heading products-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content">
              <h4>Our Products</h4>
              <h2>Shree Collection</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
 
 
 
 <ul class="nav nav-tabs justify-content-center mt-4" role="tablist">
 
 
  <li class="nav-item" role="presentation">
    <a class="nav-link active" data-bs-toggle="tab" href="#men" aria-selected="true" role="tab">Men</a>
  </li>
  
  
  <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#women" aria-selected="false" role="tab" tabindex="-1">Women</a>
  </li>
  
  
  
   <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#kids" aria-selected="false" role="tab" tabindex="-1">Kids</a>
  </li>
  
  
</ul>


<div id="myTabContent" class="tab-content">

<div class="tab-pane fade show active" id="men" role="tabpanel">
<div class="row row-cols-1 row-cols-md-3 g-4">
  
  <%
  //Retrive Product list from the database
  ResultSet rs=db.getRows("select * from product where CategoryName='Men' ");
  while(rs.next()){

  
  %>
  <div class="col">
  <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="/Online_Cloth_Shop/ProductImages/<%= rs.getString(8) %>" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title fw-bold"><%= rs.getString(2) %></h5>
        <p class="card-text font-monospace">Product Size: <%= rs.getString(4) %></p>
        <p class="card-text"><small class="text-muted text-decoration-line-through">MRP:- <%= rs.getString(5) %></small></p>
        <p class="card-text"><small class="fw-bold">Discount Price:- <%= rs.getString(6) %></small></p>
        <div class="text-center d-grid gap-2">
        <a href="/Online_Cloth_Shop/login.jsp" class="btn  btn-primary">Buy Now</a>
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
 </div>
 
  
  
  
  <div class="tab-pane fade" id="women" role="tabpanel">
    <div class="row row-cols-1 row-cols-md-3 g-4">
  
  <%
  //Retrive Product list from the database
  ResultSet ws=db.getRows("select * from product where CategoryName='Women' ");
  while(ws.next()){

  
  %>
  <div class="col">
  <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="/Online_Cloth_Shop/ProductImages/<%= ws.getString(8) %>" class="img-fluid rounded-start custom-card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title fw-bold"><%= ws.getString(2) %></h5>
        <p class="card-text font-monospace">Product Size: <%= ws.getString(4) %></p>
        <p class="card-text"><small class="text-muted text-decoration-line-through">MRP:- <%= ws.getString(5) %></small></p>
        <p class="card-text"><small class="fw-bold">Discount Price:- <%= ws.getString(6) %></small></p>
        <div class="text-center d-grid gap-2">
        <a href="/Online_Cloth_Shop/login.jsp" class="btn  btn-primary">Buy Now</a>
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
     </div>
  
  
  
  <div class="tab-pane fade" id="kids" role="tabpanel">
  <div class="row row-cols-1 row-cols-md-3 g-4">
  
  <%
  //Retrive Product list from the database
  ResultSet ks=db.getRows("select * from product where CategoryName='Kids' ");
  while(ks.next()){

  
  %>
  <div class="col">
  <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="/Online_Cloth_Shop/ProductImages/<%= ks.getString(8) %>" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title fw-bold"><%= ks.getString(2) %></h5>
        <p class="card-text font-monospace">Product Size: <%= ks.getString(4) %></p>
        <p class="card-text"><small class="text-muted text-decoration-line-through">MRP:- <%= ks.getString(5) %></small></p>
        <p class="card-text"><small class="fw-bold">Discount Price:- <%= ks.getString(6) %></small></p>
        <div class="text-center d-grid gap-2">
        <a href="/Online_Cloth_Shop/login.jsp" class="btn  btn-primary">Buy Now</a>
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
  </div>
  
  
  
</div>
          
 
  <%@ include file="footer.jsp"  %>