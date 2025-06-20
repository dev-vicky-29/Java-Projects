<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String eid = (String) session.getAttribute("eid");
//ResultSet rs = db.getRows("SELECT p.*, c.CategoryName FROM product p INNER JOIN category c ON p.CategoryId = c.CategoryId WHERE p.ProductId=?", eid);
ResultSet rs = db.getRows("SELECT p.*, c.CategoryName FROM product p INNER JOIN category c ON p.CategoryName = c.CategoryName WHERE p.ProductId=?", eid);

String productId = "";
String productName = "";
String categoryName = "";
String productSize = "";
String mainPrice = "";
String offerPrice = "";
String quantity = "";

if (rs.next()) {
    productId = rs.getString("ProductId");
    productName = rs.getString("ProductName");
    categoryName = rs.getString("CategoryName");
    productSize = rs.getString("Size");
    mainPrice = rs.getString("MainPrice");
    offerPrice = rs.getString("OfferPrice");
    quantity = rs.getString("Qty");
}

if (request.getParameter("btnupdate") != null) {
    productName = request.getParameter("productName");
    categoryName = request.getParameter("categoryName");
    productSize = request.getParameter("productSize");
    mainPrice = request.getParameter("mainPrice");
    offerPrice = request.getParameter("offerPrice");
    quantity = request.getParameter("quantity");

    if (productName.isEmpty() || categoryName.isEmpty() || productSize.isEmpty() || mainPrice.isEmpty() || offerPrice.isEmpty() || quantity.isEmpty()) {
        errorMsg = "All fields are required";
    } else {
        int rowsAffected = db.executeSql("UPDATE product SET ProductName=?, CategoryId=?, Size=?, MainPrice=?, OfferPrice=?, Qty=? WHERE ProductId=?", productName, categoryName, productSize, mainPrice, offerPrice, quantity, productId);

        if (rowsAffected > 0) {
            successMsg = productId + " Record Updated Successfully";
        } else {
            errorMsg = "Failed to update record";
        }
    }
}

// Get categories from the database
ResultSet categories = db.getRows("SELECT * FROM category");
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Edit Product</h2>
            <% if (!errorMsg.isEmpty()) { %>
                <div class="alert alert-danger" role="alert">
                    <%= errorMsg %>
                </div>
            <% } else if (!successMsg.isEmpty()) { %>
                <div class="alert alert-success" role="alert">
                    <%= successMsg %>
                </div>
            <% } %>
            <form method="post">
                <div class="form-group">
                    <label for="productId">Product ID:</label>
                    <input type="text" id="productId" name="productId" class="form-control" value="<%= productId %>" readonly>
                </div>
                <div class="form-group">
                    <label for="productName">Product Name:</label>
                    <input type="text" id="productName" name="productName" class="form-control" value="<%= productName %>">
                </div>
                <div class="form-group">
                    <label for="categoryName">Category Name:</label>
                    <select class="form-control" id="categoryName" name="categoryName">
                        <% while (categories.next()) { %>
                            <option value="<%= categories.getString("CategoryId") %>" <%= categoryName.equals(categories.getString("CategoryId")) ? "selected" : "" %>><%= categories.getString("CategoryName") %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="productSize">Product Size:</label>
                    <input type="text" id="productSize" name="productSize" class="form-control" value="<%= productSize %>">
                </div>
                <div class="form-group">
                    <label for="mainPrice">Main Price:</label>
                    <input type="text" id="mainPrice" name="mainPrice" class="form-control" value="<%= mainPrice %>">
                </div>
                <div class="form-group">
                    <label for="offerPrice">Offer Price:</label>
                    <input type="text" id="offerPrice" name="offerPrice" class="form-control" value="<%= offerPrice %>">
                </div>
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="text" id="quantity" name="quantity" class="form-control" value="<%= quantity %>">
                </div>
                <div class="text-center">
                    <button type="submit" name="btnupdate" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>
