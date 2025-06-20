<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<style>
/* Card styles */
.card {
  height: 100%;
  display: flex;
  flex-direction: column;
}

.card-body {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.card img {
  max-height: 200px;
  object-fit: contain;
}

.card .btn {
  margin-top: auto;
}
</style>

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
  <div class="tab-pane fade show active" id="products" role="tabpanel">
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <%
      // Fetch active products from the database
      ResultSet rs = db.getRows("SELECT * FROM product WHERE Status = 'Active'");
      while (rs.next()) {
          String productId = rs.getString("ProductID");
          String productName = rs.getString("ProductName");
          String categoryName = rs.getString("CategoryName");
          String size = rs.getString("Size");
          String mainPrice = rs.getString("MPrice");
          String offerPrice = rs.getString("OPrice");
          String productImage = rs.getString("ProductImage");
          int quantity = rs.getInt("Qty");
      %>
      <div class="col">
        <div class="card h-100 mb-3">
          <img src="/Online_Fertilizer_Shop/ProductImages/<%= productImage %>" 
               class="card-img-top" alt="<%= productName %>">
          <div class="card-body">
            <h5 class="card-title fw-bold"><%= productName %></h5>
            <p class="card-text"><b>Category:</b> <%= categoryName %></p>
            <p class="card-text"><b>Size:</b> <%= size %></p>
            <p class="card-text">
              <small class="text-muted text-decoration-line-through">MRP: Rs.<%= mainPrice %></small>
            </p>
            <p class="card-text"><small class="fw-bold">Offer Price: Rs.<%= offerPrice %></small></p>
            <p class="card-text"><b>Stock:</b> <%= quantity > 0 ? "Available" : "Out of Stock" %></p>

            <!-- Add to Cart Section -->
            <form method="POST" action="/Online_Fertilizer_Shop/Customer/addCart.jsp">
              <input type="hidden" name="item_id" value="<%= productId %>">
              <input type="hidden" name="user_id"
                     value="<%= session.getAttribute("mail") != null ? session.getAttribute("mail") : "" %>">
              <%
              if (session.getAttribute("mail") == null) {
              %>
              <button type="button" class="btn btn-secondary w-100" disabled>
                Login to Add to Cart
              </button>
              <%
              } else if (quantity == 0) {
              %>
              <button type="button" class="btn btn-secondary w-100" disabled>
                Out of Stock
              </button>
              <%
              } else {
                  ResultSet rs3 = db.getRows(
                      "SELECT ProductID FROM cart WHERE UserName=? AND ProductID=?", 
                      session.getAttribute("mail") + "", productId);
                  if (rs3.next()) {
              %>
              <button type="submit" disabled class="btn btn-success w-100">
                In Cart
              </button>
              <%
                  } else {
              %>
              <button type="submit" name="Product_submit" class="btn btn-primary w-100">
                Add to Cart
              </button>
              <%
                  }
              }
              %>
            </form>

            <a href="/Online_Fertilizer_Shop/Customer/viewProduct.jsp?productId=<%= productId %>" 
               class="btn btn-info w-100 mt-3">View Details</a>
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
