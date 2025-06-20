<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    String productId = request.getParameter("pid");
    ResultSet product = db.getRows("SELECT * FROM products WHERE ProductID=?", productId);
    String productName = "", description = "", categoryName = "", sku = "", imagePath = "", status = "";
    if (product.next()) {
        productName = product.getString("ProductName");
        description = product.getString("Description");
        categoryName = product.getString("CategoryName");
        sku = product.getString("SKU");
        imagePath = product.getString("ImagePath");
        status = product.getString("Status");
    }
%>

<div class="container mt-5">
    <h2 class="mb-4"><%= productName %></h2>

    <div class="row">
        <div class="col-md-6">
            <img src="/Online_Fertilizer_Shop/ProductImages/<%= imagePath %>" class="img-fluid" alt="<%= productName %>">
        </div>
        <div class="col-md-6">
            <h4>Category: <%= categoryName %></h4>
            <p><strong>SKU:</strong> <%= sku %></p>
            <p><strong>Description:</strong> <%= description %></p>
            <p><strong>Status:</strong> <%= status %></p>
            <p><strong>Free Delivery:</strong> Yes!</p>
            <p><strong>Other Services:</strong> We offer fast delivery, easy returns, and dedicated customer support.</p>
            <a class="btn btn-success mt-2" href="/Online_Fertilizer_Shop/Admin/products.jsp">Add to Cart</a>
        </div>
    </div>
</div>

<script>
    function addToCart(productId) {
        // Add to cart logic here
        alert("Product " + productId + " added to cart!");
    }
</script>

<%@ include file="../footer.jsp" %>
