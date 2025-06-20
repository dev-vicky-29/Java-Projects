<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ include file="../header.jsp"%>
<%
    // Get the product ID from the request or session
    String eid = request.getParameter("eid");
    if (eid == null) {
        eid = (String) session.getAttribute("eid");
    }

    if (eid == null) {
        out.println("<div class='alert alert-danger'>Error: Product ID is missing.</div>");
        return;
    }

    session.setAttribute("eid", eid); // Save eid in session

    ResultSet rs = db.getRows("SELECT * FROM product WHERE ProductID = ?", eid);
    if (!rs.next()) {
        out.println("<div class='alert alert-danger'>Error: Product not found.</div>");
        return;
    }

    // Extract product details
    String productName = rs.getString("ProductName");
    String categoryName = rs.getString("CategoryName");
    String productSize = rs.getString("Size");
    String mainPrice = rs.getString("MPrice");
    String offerPrice = rs.getString("OPrice");
    String quantity = rs.getString("Qty");
    String productInfo = rs.getString("ProductInfo");


    if (request.getParameter("btnupdate") != null) {
        // Retrieve form data, retaining original values if not submitted
        productName = request.getParameter("productName") != null ? request.getParameter("productName") : productName;
        categoryName = request.getParameter("categoryName") != null ? request.getParameter("categoryName") : categoryName;
        productSize = request.getParameter("productSize") != null ? request.getParameter("productSize") : productSize;
        mainPrice = request.getParameter("mainPrice") != null ? request.getParameter("mainPrice") : mainPrice;
        offerPrice = request.getParameter("offerPrice") != null ? request.getParameter("offerPrice") : offerPrice;
        quantity = request.getParameter("quantity") != null ? request.getParameter("quantity") : quantity;
        productInfo = request.getParameter("productInfo") != null ? request.getParameter("productInfo") : productInfo;

        try {
            // Validate numeric fields
            if (!mainPrice.matches("^[0-9]+([.][0-9]+)?$") || !offerPrice.matches("^[0-9]+([.][0-9]+)?$") || !quantity.matches("^[0-9]+$")) {
                errorMsg = "Please enter valid numeric values for prices and quantity.";
            } else {
                // Update the product in the database
                int rowsUpdated = db.executeSql(
                    "UPDATE product SET ProductName=?, CategoryName=?, ProductInfo=?, Size=?, MPrice=?, OPrice=?, Qty=? WHERE ProductID=?",
                    productName, categoryName, productInfo, productSize, mainPrice, offerPrice, quantity, eid
                );

                if (rowsUpdated > 0) {
                    successMsg = productName + " Product Updated Successfully";
                } else {
                    errorMsg = "Failed to update product. Please try again.";
                }
            }
        } catch (SQLException e) {
            errorMsg = "Database error occurred: " + e.getMessage();
        }
    }
%>

<div class="container mt-5">
    <h2>Edit Product</h2>
    <% if (!errorMsg.isEmpty()) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } else if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <form method="post">
        <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" name="productName" value="<%= productName %>" required>
        </div>
        <div class="mb-3">
            <label for="categoryName" class="form-label">Category Name</label>
            <input type="text" class="form-control" id="categoryName" name="categoryName" value="<%= categoryName %>" required>
        </div>
        <div class="mb-3">
            <label for="productSize" class="form-label">Product Size</label>
            <input type="text" class="form-control" id="productSize" name="productSize" value="<%= productSize %>">
        </div>
        <div class="mb-3">
            <label for="mainPrice" class="form-label">Main Price</label>
            <input type="text" class="form-control" id="mainPrice" name="mainPrice" value="<%= mainPrice %>" required>
        </div>
        <div class="mb-3">
            <label for="offerPrice" class="form-label">Offer Price</label>
            <input type="text" class="form-control" id="offerPrice" name="offerPrice" value="<%= offerPrice %>" required>
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value="<%= quantity %>" required>
        </div>
        <div class="mb-3">
            <label for="productInfo" class="form-label">Product Info</label>
            <textarea class="form-control" id="productInfo" name="productInfo"><%= productInfo %></textarea>
        </div>
        <button type="submit" name="btnupdate" class="btn btn-primary">Update Product</button>
    </form>
</div>

<%@ include file="../footer.jsp" %>
