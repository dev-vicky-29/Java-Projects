<%@ include file="header.jsp"%>
<%@ page import="java.sql.ResultSet" %>

<div class="container">
    <br>
    <hr>
    <br>
    <h1 class="text-center bg-warning text-dark">Furniture Products</h1>
    <br>
    <hr>
    <br>
</div>

<div class="container">
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <%
        // Retrieve Product list from the database
        ResultSet rs = db.getRows("SELECT * FROM product");
        while (rs.next()) {
            // Fetch necessary fields from the product table
            String productName = rs.getString("ProductName");
            String categoryName = rs.getString("CategoryName");
            String dimensions = rs.getString("Dimensions");
            String brand = rs.getString("Brand");
            String material = rs.getString("PrimaryMaterial");
            String price = rs.getString("OPrice");
            String productImage = rs.getString("ProductImage");
        %>

        <!-- Product Card -->
        <div class="col">
            <div class="card h-100 shadow-sm">
                <!-- Product Image -->
                <img src="/Online_Furniture_Shop/ProductImages/<%= productImage %>" class="card-img-top img-fluid" alt="Product Image" style="height: 200px; object-fit: cover;">
                
                <!-- Product Details -->
                <div class="card-body">
                    <h5 class="card-title text-primary fw-bold"><%= productName %></h5>
                    <p class="card-text text-muted"><strong>Category:</strong> <%= categoryName %></p>
                    <p class="card-text"><strong>Dimensions:</strong> <%= dimensions %></p>
                    <p class="card-text"><strong>Material:</strong> <%= material %></p>
                    <p class="card-text"><strong>Brand:</strong> <%= brand %></p>
                    <p class="card-text text-danger fs-5"><strong>Price:</strong> Rs.<%= price %></p>
                    
                    <!-- Buy Now Button -->
                    <div class="text-center">
                        <a href="/Online_Furniture_Shop/login.jsp" class="btn btn-success btn-sm">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>

        <%
        }
        %>

    </div>
</div>

<%@ include file="footer.jsp" %>
