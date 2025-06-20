<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<!-- Men Offers Start -->
<div class="container-fluid pt-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Shree Collection</h2>
            <h1 class="display-4 text-uppercase">Men Deals</h1>
        </div>
        <div class="row gx-5">
        
        <%
  //Retrive Product list from the database
  ResultSet rs=db.getRows("select * from product where CategoryName='Men' ");
  while(rs.next()){

  
  %>
        
            <div class="col-lg-4 col-md-6 mb-5">
                <div class="card h-100 border-primary">
                    <img class="card-img-top" src="/Online_Cloth_Shop/ProductImages/<%= rs.getString(8) %>" alt="/Online_Cloth_Shop/ProductImages/<%= rs.getString(8) %>">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title text-uppercase mb-2"><%= rs.getString(2) %></h4>
                        <p class="card-text">Size Available: <strong><%= rs.getString(4) %></strong></p>
                        <p class="card-text"><strong>Price:</strong> <del>Rs.<%= rs.getString(5) %></del>   - Rs.<%= rs.getString(5) %></p>
                        <a href="#" class="btn btn-primary mt-auto">Buy Now</a>
                    </div>
                </div>
            </div>
            
            <%
 }
 %>
            
            </div>
            </div>
            </div>
            

<%@ include file="../footer.jsp"%>