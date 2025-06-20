<%@ include file="../header.jsp"%>
<%@page import="java.sql.ResultSet"%>

<div class="container">
    <br>
    <hr>
    <br>
    <h1 class="text-center bg-warning text-dark">Our Book Collection</h1>
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
            String language = rs.getString("Language");
            String publisher = rs.getString("Publisher");
            String offerPrice = rs.getString("OPrice");
            String productImage = rs.getString("ProductImage");
            int quantity = rs.getInt("Qty");
        %>

        <!-- Product Card -->
        <div class="col">
            <div class="card h-100 shadow-sm">
                <!-- Product Image -->
                <img src="/Online_Book_Shop/ProductImages/<%= productImage %>" 
                     class="card-img-top img-fluid" alt="Book Cover" style="height: 200px; object-fit: cover;">
                
                <!-- Product Details -->
                <div class="card-body">
                    <h5 class="card-title text-primary fw-bold"><%= productName %></h5>
                    <p class="card-text text-muted"><strong>Category:</strong> <%= categoryName %></p>
                    <p class="card-text"><strong>Language:</strong> <%= language %></p>
                    <p class="card-text"><strong>Publisher:</strong> <%= publisher %></p>
                    <p class="card-text text-danger fs-5"><strong>Price:</strong> Rs.<%= offerPrice %></p>
                    
                    <!-- Buttons -->
                    <div class="d-flex justify-content-between">
                        <!-- View Product Button -->
                        <a href="/Online_Book_Shop/viewProduct.jsp?productId=<%= productId %>" 
                           class="btn btn-info btn-sm">
                            View Product
                        </a>

                        <!-- Add to Cart Form -->
                        <form method="POST" action="signup.jsp">
                            <input type="hidden" name="item_id" value="<%= productId %>">
                            <input type="hidden" name="user_id"
                                   value="<%= session.getAttribute("mail") != null 
                                               ? session.getAttribute("mail") + "" 
                                               : "" %>">

                            <%
                            if (quantity == 0) {
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
                            <button type="submit" name="Product_submit" class="btn btn-primary btn-sm">
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
