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
                 class="img-fluid rounded shadow" alt="Product Image" style="max-width: 100%; height: auto;">
        </div>

        <!-- Product Details -->
        <div class="col-md-7">
            <h2 class="text-primary fw-bold"><%= rs.getString("ProductName") %></h2>
            <p><strong>Category:</strong> <%= rs.getString("CategoryName") %></p>
            <p><strong>Brand:</strong> <%= rs.getString("BrandName") %></p>
            <p><strong>Gender:</strong> <%= rs.getString("Gender") %></p>
            <p><strong>Size:</strong> <%= rs.getString("Size") %></p>
            <p class="fs-5 text-muted"><strong>MRP:</strong> <del>Rs.<%= rs.getString("MPrice") %></del></p>
            <p class="fs-4 text-danger"><strong>Offer Price:</strong> Rs.<%= rs.getString("OPrice") %></p>

            <!-- Add to Cart Button -->
            <form method="POST" action="/Zara_Fashion/Customer/addCart.jsp">
                <input type="hidden" name="item_id" value="<%= productId %>">
                <input type="hidden" name="user_id"
                       value="<%= session.getAttribute("mail") != null 
                                   ? session.getAttribute("mail") + "" 
                                   : "" %>">

                <%
                int quantity = rs.getInt("Qty");
                String status = rs.getString("Status");
                if (quantity == 0 || "Unavailable".equalsIgnoreCase(status)) {
                %>
                <button type="button" disabled class="btn btn-secondary">
                    Out of Stock
                </button>
                <%
                } else {
                    ResultSet rs3 = db.getRows(
                        "SELECT ProductID FROM Cart WHERE UserName=? AND ProductID=?", 
                        session.getAttribute("mail") + "", productId);
                    if (rs3.next()) {
                %>
                <button type="submit" disabled class="btn btn-success">
                    In Cart
                </button>
                <%
                    } else {
                %>
                <button type="submit" name="Product_submit" class="btn btn-dark">
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
    } else {
%>
    <div class="container mt-5">
        <h3 class="text-center text-danger">Product Not Found!</h3>
    </div>
<%
    }
%>

<%@ include file="../footer.jsp" %>
