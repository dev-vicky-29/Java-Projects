<%@ include file="../header.jsp"%>
<%@page import="java.sql.ResultSet"%>

<div class="container">
    <br>
    <hr>
    <br>
    <h1 class="text-center bg-warning text-dark">Our Fashion Collection</h1>
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
            String productId = rs.getString("ProductID");
            String productName = rs.getString("ProductName");
            String categoryName = rs.getString("CategoryName");
            String brandName = rs.getString("BrandName");
            String gender = rs.getString("Gender");
            String size = rs.getString("Size");
            String markedPrice = rs.getString("MPrice");
            String offerPrice = rs.getString("OPrice");
            String productImage = rs.getString("ProductImage");
            int quantity = rs.getInt("Qty");
            String status = rs.getString("Status");
        %>

        <!-- Product Card -->
        <div class="col">
            <div class="card h-100 shadow-sm">
                <!-- Product Image -->
                <img src="/Zara_Fashion/ProductImages/<%= productImage %>" 
                     class="card-img-top img-fluid" alt="Product Image" style="height: 200px; object-fit: cover;">
                
                <!-- Product Details -->
                <div class="card-body">
                    <h5 class="card-title text-primary fw-bold"><%= productName %></h5>
                    <p class="card-text text-muted"><strong>Category:</strong> <%= categoryName %></p>
                    <p class="card-text"><strong>Brand:</strong> <%= brandName %></p>
                    <p class="card-text"><strong>Gender:</strong> <%= gender %></p>
                    <p class="card-text"><strong>Size:</strong> <%= size %></p>
                    <p class="card-text text-muted"><strong>MRP:</strong> <del>Rs.<%= markedPrice %></del></p>
                    <p class="card-text text-danger fs-5"><strong>Offer Price:</strong> Rs.<%= offerPrice %></p>
                    
                    <!-- Buttons -->
                    <div class="d-flex justify-content-between">
                        <!-- View Product Button -->
                        <a href="/Zara_Fashion/Customer/viewProduct.jsp?productId=<%= productId %>" 
                           class="btn btn-info btn-sm">
                            View Product
                        </a>

                        <!-- Add to Cart Form -->
                        <form method="POST" action="login.jsp">
                            <input type="hidden" name="item_id" value="<%= productId %>">
                            <input type="hidden" name="user_id"
                                   value="<%= session.getAttribute("mail") != null 
                                               ? session.getAttribute("mail") + "" 
                                               : "" %>">

                            <%
                            if (quantity == 0 || "Unavailable".equalsIgnoreCase(status)) {
                            %>
                            <button type="button" disabled class="btn btn-secondary btn-sm">
                                Out of Stock
                            </button>
                            <%
                            } else {
                                ResultSet rs3 = db.getRows(
                                    "SELECT ProductID FROM Cart WHERE UserName=? AND ProductID=?", 
                                    session.getAttribute("mail") + "", productId);
                                if (rs3.next()) {
                            %>
                            <button type="submit" disabled class="btn btn-success btn-sm">
                                In Cart
                            </button>
                            <%
                                } else {
                            %>
                            <button type="submit" name="Product_submit" class="btn btn-dark btn-sm">
                                Add to Cart
                            </button>
                            <%
                                }
                            }
                            %>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%
        }
        %>

    </div>
</div>

<%@ include file="../footer.jsp"%>
