<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<style>
/* Card styles */
.card {
  height: 100%; /* Ensures all cards are the same height */
  display: flex;
  flex-direction: column;
}

.card-body {
  flex-grow: 1; /* Allows the body to fill the available space */
  display: flex;
  flex-direction: column;
  justify-content: space-between; /* Spreads content within the card */
}

.card img {
  max-height: 200px; /* Limits the image height */
  object-fit: contain; /* Ensures the image fits within the card */
}

.card .btn {
  margin-top: auto; /* Pushes the button to the bottom */
}

</style>

<!-- Page Content -->
<div class="page-heading products-heading header-text">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="text-content text-center">
          <h4>Our Products</h4>
          <h2>Fertilizer Shop</h2>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="myTabContent" class="tab-content">

  <!-- Organic Fertilizers -->
  <div class="tab-pane fade show active" id="organic" role="tabpanel">
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <%
      // Fetching products from the Product table
      ResultSet rs = db.getRows("SELECT * FROM Product");  // Only showing active products
      while (rs.next()) {
    	  String productId = rs.getString("ProductID");
      %>
      <div class="col">
        <div class="card h-100 mb-3">
          <img src="/Online_Fertilizer_Shop/ProductImages/<%= rs.getString("ProductImage") %>" 
               class="card-img-top" alt="<%= rs.getString("ProductName") %>">
          <div class="card-body d-flex flex-column">
            <h5 class="card-title fw-bold"><%= rs.getString("ProductName") %></h5>
            <p class="card-text"><b>Category:</b> <%= rs.getString("CategoryName") %></p>
            <p class="card-text"><b>Size:</b> <%= rs.getString("Size") %><%= rs.getString("Unit") %> </p>
            <p class="card-text"><small class="text-muted text-decoration-line-through">MRP: Rs.<%= rs.getString("MPrice") %></small></p>
            <p class="card-text"><small class="fw-bold">Offer Price: Rs.<%= rs.getString("OPrice") %></small></p>
            <p class="card-text"><b>Stock:</b> <%= rs.getInt("Qty") > 0 ? "Available" : "Out of Stock" %></p>
            
            <a href="ProductPage.jsp?pid=<%= productId %>" class="btn btn-primary">View Details</a>
              <a href="#" class="btn btn-primary w-100">Buy Now</a>
            
          </div>
        </div>
      </div>
      <%
      }
      %>
    </div>
  </div>

</div>

<%@ include file="../footer.jsp" %>
