<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>


<%
  

    // Get the product ID from the request parameter
    String eid = request.getParameter("eid");

    // Fetch product details from the database based on the product ID
    ResultSet rs = db.getRows("SELECT * FROM product WHERE ProductID=?", eid);

    // Declare variables to store product details
    String productId = "";
    String productName = "";
    String categoryName = "";
    String productSize = "";
    String mainPrice = "";
    String offerPrice = "";
    String quantity = "";
    String productInfo = "";

    // Fetch product details from the ResultSet
    if (rs.next()) {
        productId = rs.getString("ProductId");
        productName = rs.getString("ProductName");
        categoryName = rs.getString("CategoryName");
        productSize = rs.getString("Size");
        mainPrice = rs.getString("MPrice");
        offerPrice = rs.getString("OPrice");
        quantity = rs.getString("Qty");
        productInfo = rs.getString("ProductInfo");
    }

    // Check if the update button is clicked
    if (request.getParameter("btnupdate") != null) {
        // Retrieve form data
        productName = request.getParameter("productName");
        categoryName = request.getParameter("categoryName");
        productSize = request.getParameter("productSize");
        mainPrice = request.getParameter("mainPrice");
        offerPrice = request.getParameter("offerPrice");
        quantity = request.getParameter("quantity");
        productInfo = request.getParameter("productInfo");

        // Validate form data
        if (productName.isEmpty() || categoryName.isEmpty() || productSize.isEmpty() || mainPrice.isEmpty() || offerPrice.isEmpty() || quantity.isEmpty()) {
            errorMsg = "All fields are required.";
        } else {
            // Update product in the database
            int rowsUpdated = db.executeSql("UPDATE product SET ProductName=?, CategoryName=?, ProductInfo=?, Size=?, MPrice=?, OPrice=?, Qty=? WHERE ProductID=?", productName, categoryName, productInfo, productSize, mainPrice, offerPrice, quantity, productId);

            // Check if the update was successful
            if (rowsUpdated > 0) {
                successMsg = "Product " + productId + " updated successfully!";
            } else {
                errorMsg = "Failed to update product. Please try again.";
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
                            <option value="<%= categories.getString("CategoryName") %>" <%= categoryName.equals(categories.getString("CategoryName")) ? "selected" : "" %>><%= categories.getString("CategoryName") %></option>
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
                <div class="form-group">
                    <label for="productInfo">Product Info:</label>
                    <textarea id="productInfo" name="productInfo" class="form-control"><%= productInfo %></textarea>
                </div>
                <br><hr><br>
                <div class="text-center mb-5">
                    <button type="submit" name="btnupdate" class="btn btn-primary">Update</button>
                    <a href="/Online_Bakery_Shop/Admin/ProductList.jsp"  class="btn btn-danger">Product List</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>
