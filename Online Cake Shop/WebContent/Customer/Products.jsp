<%@ include file="../header.jsp"%>
<%@page import="java.sql.ResultSet"%>

<div class="container my-5">
    <hr>
    <h1 class="text-center bg-warning text-dark py-3">Cake Palace Products</h1>
    <hr>
</div>

<div class="row row-cols-1 row-cols-md-3 g-4">
    <%
        // Retrieve Product list from the database
        ResultSet rs = db.getRows("select * from product");
        while (rs.next()) {
            String productId = rs.getString(1);
            String productName = rs.getString(2);
            String productCategory = rs.getString(4);
            String productSize = rs.getString(5);
            String mainPrice = rs.getString(6);
            String offerPrice = rs.getString(7);
            String productImage = rs.getString(9);
            int quantity = rs.getInt("Qty"); // Retrieve product quantity
    %>
    <div class="col mb-4">
        <div class="card h-100 shadow-sm">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="/Online_Cake_Shop/ProductImages/<%= productImage %>" 
                         class="img-fluid rounded-start h-100 object-fit-cover" alt="Product Image">
                </div>
                <div class="col-md-8">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <h5 class="card-title fw-bold text-truncate" style="max-height: 60px; overflow: hidden;"><%= productName %></h5>
                        <p class="card-text text-muted" style="font-size: 0.9rem; color: #555;">
                            <%= productCategory.length() > 50 ? productCategory.substring(0, 50) + "..." : productCategory %>
                        </p>
                        <p class="card-text font-monospace">Product Size: <%= productSize %></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <p class="card-text">
                                    <small class="text-muted text-decoration-line-through">
                                        MRP: <%= mainPrice %>
                                    </small>
                                </p>
                                <p class="card-text fw-bold text-success">
                                    Discount Price: <%= offerPrice %>
                                </p>
                            </div>
                            <div>
                                <form method="POST" action="/Online_Cake_Shop/Customer/addCart.jsp">
                                    <input type="hidden" name="item_id" value="<%= productId %>">
                                    <input type="hidden" name="user_id" value="<%= session.getAttribute("mail") != null ? session.getAttribute("mail") + "" : "" %>">
                                    <%
                                        // Check if the product is out of stock
                                        if (quantity == 0) {
                                    %>
                                    <button type="button" disabled class="btn btn-secondary btn-sm w-100">Out of Stock</button>
                                    <%
                                        } else {
                                            // Check if the product is already in the cart
                                            ResultSet rs3 = db.getRows(
                                                "select ProductID from Cart where UserName=? and ProductID=?", 
                                                session.getAttribute("mail") + "", productId);
                                            if (rs3.next()) {
                                    %>
                                    <button type="button" disabled class="btn btn-success btn-sm w-100">In Cart</button>
                                    <%
                                            } else {
                                    %>
                                    <button type="submit" name="Product_submit" class="btn btn-primary btn-sm w-100">Add to Cart</button>
                                    <%
                                            }
                                        }
                                    %>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>

<%@ include file="../footer.jsp"%>
