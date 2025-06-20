<%@ include file="../header.jsp"%>
<%@page import="java.sql.ResultSet"%>

<%
String productId = request.getParameter("productId");
ResultSet rs = db.getRows("SELECT * FROM product WHERE ProductID=?", productId);
if (rs.next()) {
    String productName = rs.getString("ProductName");
    String categoryName = rs.getString("CategoryName");
    String weight = rs.getString("Weight");
    String mainPrice = rs.getString("MPrice");
    String offerPrice = rs.getString("OPrice");
    String warranty = rs.getString("Warranty");
    String dimensions = rs.getString("Dimensions");
    String brand = rs.getString("Brand");
    String primaryMaterial = rs.getString("PrimaryMaterial");
    String productImage = rs.getString("ProductImage");
    int quantity = rs.getInt("Qty");
%>

<!-- Page Container -->
<div class="container py-5">
    <div class="row">
        <!-- Product Image Section -->
        <div class="col-md-6">
            <div class="product-image-container">
                <img src="/Online_Furniture_Shop/ProductImages/<%= productImage %>" 
                     class="img-fluid product-image" alt="Product Image">
            </div>
        </div>

        <!-- Product Details Section -->
        <div class="col-md-6">
            <h1 class="text-primary fw-bold mb-3"><%= productName %></h1>
            <p class="text-muted mb-1"><strong>Category:</strong> <%= categoryName %></p>
            <p class="text-muted mb-1"><strong>Weight:</strong> <%= weight %></p>
            <p class="text-muted mb-1"><strong>Warranty:</strong> <%= warranty %></p>
            <p class="text-muted mb-1"><strong>Dimensions:</strong> <%= dimensions %></p>
            <p class="text-muted mb-1"><strong>Brand:</strong> <%= brand %></p>
            <p class="text-muted mb-3"><strong>Material:</strong> <%= primaryMaterial %></p>

            <!-- Pricing -->
            <p class="fs-4 text-danger">
                <strong>Offer Price:</strong> Rs.<%= offerPrice %>
                <small class="text-muted text-decoration-line-through">Rs.<%= mainPrice %></small>
            </p>

            <!-- Add to Cart Section -->
            <form method="POST" action="/Online_Furniture_Shop/Customer/addCart.jsp">
                <input type="hidden" name="item_id" value="<%= productId %>">
                <input type="hidden" name="user_id"
                       value="<%= session.getAttribute("mail") != null 
                                   ? session.getAttribute("mail") + "" 
                                   : "" %>">

                <%
                if (quantity == 0) {
                %>
                <button type="button" disabled class="btn btn-secondary btn-lg w-100">
                    Out of Stock
                </button>
                <%
                } else {
                    ResultSet rs3 = db.getRows(
                        "SELECT ProductID FROM Cart WHERE UserName=? AND ProductID=?", 
                        session.getAttribute("mail") + "", productId);
                    if (rs3.next()) {
                %>
                <button type="submit" disabled class="btn btn-success btn-lg w-100">
                    Already in Cart
                </button>
                <%
                    } else {
                %>
                <button type="submit" name="Product_submit" class="btn btn-primary btn-lg w-100">
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

<%
}
%>

<%@ include file="../footer.jsp"%>

<!-- Additional CSS -->
<style>
    /* Container for the product image */
    .product-image-container {
        overflow: hidden;
        border-radius: 10px;
        position: relative;
    }

    /* Product image styling */
    .product-image {
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    }

    /* Zoom effect on hover */
    .product-image-container:hover .product-image {
        transform: scale(1.2); /* Zoom effect */
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
</style>
