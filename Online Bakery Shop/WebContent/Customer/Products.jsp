<%@ include file="../header.jsp"%>

<%@page import="java.sql.ResultSet"%>

<div class="container">
    <br>
    <hr>
    <br>
    <h1 class="text-center bg-warning text-dark">Cake Palace Products</h1>
    <br>
    <hr>
    <br>
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
    <div class="col">
        <div class="card mb-3" style="max-width: 540px; height: 400px;">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="/Online_Bakery_Shop/ProductImages/<%= productImage %>" 
                         class="img-fluid rounded-start h-auto" alt="Product Image">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title fw-bold"><%= productName %></h5>
                        <p class="card-text "><%= productCategory %></p>
                        <p class="card-text font-monospace">Product Size: <%= productSize %></p>
                        <p class="card-text">
                            <small class="text-muted text-decoration-line-through">
                                MRP: <%= mainPrice %>
                            </small>
                        </p>
                        <p class="card-text">
                            <small class="fw-bold">Discount Price: <%= offerPrice %></small>
                        </p>
                        <form method="POST" action="/Online_Bakery_Shop/Customer/addCart.jsp">
                            <input type="hidden" name="item_id" value="<%= productId %>">
                            <input type="hidden" name="user_id"
                                   value="<%= session.getAttribute("mail") != null 
                                               ? session.getAttribute("mail") + "" 
                                               : "" %>">

                            <%
                                // Check if the product is out of stock
                                if (quantity == 0) {
                            %>
                            <div class="text-center d-grid gap-2">
                                <button type="button" disabled class="btn btn-secondary font-size-12">
                                    Product Out of Stock
                                </button>
                            </div>
                            <%
                                } else {
                                    // Check if the product is already in the cart
                                    ResultSet rs3 = db.getRows(
                                        "select ProductID from Cart where UserName=? and ProductID=?", 
                                        session.getAttribute("mail") + "", productId);
                                    if (rs3.next()) {
                            %>
                            <div class="text-center d-grid gap-2">
                                <button type="submit" disabled class="btn btn-success font-size-12">
                                    In the Cart
                                </button>
                            </div>
                            <%
                                    } else {
                            %>
                            <div class="text-center d-grid gap-2">
                                <button type="submit" name="Product_submit" 
                                        class="btn btn-primary btn-lg font-size-12">
                                    Add to Cart
                                </button>
                            </div>
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
    <%
        }
    %>
</div>

<%@ include file="../footer.jsp"%>
