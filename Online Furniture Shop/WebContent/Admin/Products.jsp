<%@ include file="../header.jsp"%>
<%@page import="java.sql.ResultSet"%>

<div class="container">
    <br>
    <hr>
    <br>
    <h1 class="text-center bg-warning text-dark">Furniture Shop Products</h1>
    <br>
    <hr>
    <br> 
</div>

<div class="row row-cols-1 row-cols-md-3 g-4">
  
  <%
  // Retrieve Product list from the database
  ResultSet rs = db.getRows("SELECT * FROM product");
  if (rs == null) {
      out.println("<div class='alert alert-danger'>No products found or an error occurred.</div>");
  } else {
      while(rs.next()){
  %>
      <div class="col">
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="/Online_Furniture_Shop/ProductImages/<%= rs.getString("ProductImage") %>" class="img-fluid rounded-start" alt="Product Image">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title fw-bold"><%= rs.getString("ProductName") %></h5>
              <p class="card-text"><%= rs.getString("CategoryName") %></p>
              <p class="card-text">Dimensions: <%= rs.getString("Dimensions") %></p>
              <p class="card-text">Primary Material: <%= rs.getString("PrimaryMaterial") %></p>
              <p class="card-text"><small class="text-muted text-decoration-line-through">MRP: <%= rs.getString("MPrice") %></small></p>
              <p class="card-text"><small class="fw-bold">Discount Price: <%= rs.getString("OPrice") %></small></p>
              <div class="text-center d-grid gap-2">
                <a href="/Online_Furniture_Shop/Admin/productview.jsp?productId=<%= rs.getString("ProductID") %>" class="btn btn-primary">View Details</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <%
      }
      rs.close();
  }
 %>
</div>

<%@ include file="../footer.jsp"%>