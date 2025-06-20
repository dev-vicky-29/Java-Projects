<%@ include file="../header.jsp"%>
<%@page import="java.sql.ResultSet"%>

<%
String productId = request.getParameter("productId");
ResultSet rs = db.getRows("SELECT * FROM product WHERE ProductID=? AND Status='Active'", productId);
if (rs.next()) {
    String productName = rs.getString("ProductName");
    String categoryName = rs.getString("CategoryName");
    String productInfo = rs.getString("ProductInfo");
    String unit = rs.getString("Unit");
    String size = rs.getString("Size");
    String mainPrice = rs.getString("MPrice");
    String offerPrice = rs.getString("OPrice");
    int quantity = rs.getInt("Qty");
    String productImage = rs.getString("ProductImage");
%>

<div class="container py-5">
    <div class="row">
        <!-- Product Image Section -->
        <div class="col-md-6">
            <div class="product-image-container">
                <img src="/Online_Fertilizer_Shop/ProductImages/<%= productImage %>" 
                     class="img-fluid product-image" alt="Product Image">
            </div>
        </div>

        <!-- Product Details Section -->
        <div class="col-md-6">
            <h1 class="text-primary fw-bold mb-3"><%= productName %></h1>
            <p class="text-muted mb-1"><strong>Category:</strong> <%= categoryName %></p>
            
            <p class="text-muted mb-1"><strong>Size:</strong> <%= size %><%= unit %></p>
            <p><strong>Free Delivery:</strong> Yes!</p>
            <p><strong>Other Services:</strong> We offer fast delivery, easy returns, and dedicated customer support.</p>
            <p class="text-muted mb-3"><strong>Product Info:</strong> <%= productInfo %></p>

            <!-- Pricing -->
            <p class="fs-4 text-danger">
                <strong>Offer Price:</strong> Rs.<%= offerPrice %>
                <small class="text-muted text-decoration-line-through">Rs.<%= mainPrice %></small>
            </p>

            <!-- Add to Cart Section -->
            <form method="POST" action="/Online_Fertilizer_Shop/Customer/addCart.jsp">
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

<style>
    .product-image-container {
        overflow: hidden;
        border-radius: 10px;
        position: relative;
    }

    .product-image {
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    }

    .product-image-container:hover .product-image {
        transform: scale(1.2);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
</style>
