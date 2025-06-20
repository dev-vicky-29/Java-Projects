<%@ include file="../header.jsp" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String productId = request.getParameter("productId");
    ResultSet rs = db.getRows("SELECT * FROM product WHERE ProductID=?", productId);
    if (rs.next()) {
%>

<div class="container mt-5">
    <div class="row">
        <!-- Product Image -->
        <div class="col-md-5 text-center">
            <img src="/Zara_Fashion/ProductImages/<%= rs.getString("ProductImage") %>" 
                 class="img-fluid rounded shadow" alt="Book Cover" style="max-width: 100%; height: auto;">
        </div>

        <!-- Product Details -->
        <div class="col-md-7">
            <h2 class="text-primary fw-bold"><%= rs.getString("ProductName") %></h2>
            <p><strong>Author:</strong> <%= rs.getString("Author") %></p>
            <p><strong>Category:</strong> <%= rs.getString("CategoryName") %></p>
            <p><strong>Language:</strong> <%= rs.getString("Language") %></p>
            <p><strong>Publisher:</strong> <%= rs.getString("Publisher") %></p>
            <p><strong>Publishing Date:</strong> <%= rs.getString("PublishingDate") %></p>
            <p><strong>Total Pages:</strong> <%= rs.getString("TotalPages") %></p>
            <p><strong>Description:</strong> <%= rs.getString("BookDescription") %></p>
            <p class="fs-5 text-danger"><strong>Price:</strong> Rs.<%= rs.getString("OPrice") %></p>
            
            
        </div>
    </div>
</div>

<%
    } else {
%>
    <div class="container mt-5">
        <h3 class="text-center text-danger">Product Not Found!</h3>
    </div>
<%
    }
%>

<%@ include file="../footer.jsp" %>
