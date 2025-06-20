<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<%
    String eid = request.getParameter("eid"); // Retrieve 'eid' from the request
    if (eid == null) {
        eid = (String) session.getAttribute("eid"); // Check session for 'eid' if not in request
    }

    if (eid == null) {
        out.println("<div class='alert alert-danger'>Error: Product ID is missing.</div>");
        return; // Stop processing if no Product ID
    }

    session.setAttribute("eid", eid); // Store eid in session for subsequent requests

    ResultSet rs = db.getRows("SELECT * FROM product WHERE ProductID = ?", eid);
    if (!rs.next()) {
        out.println("<div class='alert alert-danger'>Error: Product not found.</div>");
        return; // Stop processing if product not found
    }

    // Extract product details
    String productName = rs.getString("ProductName");
    String categoryName = rs.getString("CategoryName");
    String weight = rs.getString("Weight");
    String mainPrice = rs.getString("MPrice");
    String discountPrice = rs.getString("OPrice");
    String quantity = rs.getString("Qty");
    String warranty = rs.getString("Warranty");
    String dimensions = rs.getString("Dimensions");
    String brand = rs.getString("Brand");
    String primaryMaterial = rs.getString("PrimaryMaterial");

   

    // Handle update action
    if (request.getParameter("btnupdate") != null) {
        // Retrieve form data - if a field isn't submitted, it will keep the original value
        productName = request.getParameter("ProductName") != null ? request.getParameter("ProductName") : productName;
        categoryName = request.getParameter("CategoryName") != null ? request.getParameter("CategoryName") : categoryName;
        weight = request.getParameter("Weight") != null ? request.getParameter("Weight") : weight;
        mainPrice = request.getParameter("MPrice") != null ? request.getParameter("MPrice") : mainPrice;
        discountPrice = request.getParameter("OPrice") != null ? request.getParameter("OPrice") : discountPrice;
        quantity = request.getParameter("Qty") != null ? request.getParameter("Qty") : quantity;
        warranty = request.getParameter("Warranty") != null ? request.getParameter("Warranty") : warranty;
        dimensions = request.getParameter("Dimensions") != null ? request.getParameter("Dimensions") : dimensions;
        brand = request.getParameter("Brand") != null ? request.getParameter("Brand") : brand;
        primaryMaterial = request.getParameter("PrimaryMaterial") != null ? request.getParameter("PrimaryMaterial") : primaryMaterial;

        try {
            // Validate that price and quantity are at least numeric strings
            if (!mainPrice.matches("^[0-9]+([.][0-9]+)?$") || !discountPrice.matches("^[0-9]+([.][0-9]+)?$") || !quantity.matches("^[0-9]+$")) {
                errorMsg = "Please enter valid numeric values for prices and quantity.";
            } else {
                // Update the product in the database, excluding image
                int rowsUpdated = db.executeSql(
                    "UPDATE product SET ProductName=?, CategoryName=?, Weight=?, MPrice=?, OPrice=?, Qty=?, Warranty=?, Dimensions=?, Brand=?, PrimaryMaterial=? WHERE ProductID=?",
                    productName, categoryName, weight, mainPrice, discountPrice, quantity, warranty, dimensions, brand, primaryMaterial, eid
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
    <form method="post" action="">
        <input type="hidden" name="ProductID" value="<%= eid %>">
        <div class="mb-3">
            <label for="ProductName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="ProductName" name="ProductName" value="<%= productName %>" required>
        </div>
        <div class="mb-3">
            <label for="CategoryName" class="form-label">Category Name</label>
            <input type="text" class="form-control" id="CategoryName" name="CategoryName" value="<%= categoryName %>" required>
        </div>
        <div class="mb-3">
            <label for="Weight" class="form-label">Weight</label>
            <input type="text" class="form-control" id="Weight" name="Weight" value="<%= weight %>" required>
        </div>
        <div class="mb-3">
            <label for="MPrice" class="form-label">Main Price</label>
            <input type="text" class="form-control" id="MPrice" name="MPrice" value="<%= mainPrice %>" required>
        </div>
        <div class="mb-3">
            <label for="OPrice" class="form-label">Discount Price</label>
            <input type="text" class="form-control" id="OPrice" name="OPrice" value="<%= discountPrice %>" required>
        </div>
        <div class="mb-3">
            <label for="Qty" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="Qty" name="Qty" value="<%= quantity %>" required>
        </div>
        <div class="mb-3">
            <label for="Warranty" class="form-label">Warranty</label>
            <input type="text" class="form-control" id="Warranty" name="Warranty" value="<%= warranty %>">
        </div>
        <div class="mb-3">
            <label for="Dimensions" class="form-label">Dimensions</label>
            <input type="text" class="form-control" id="Dimensions" name="Dimensions" value="<%= dimensions %>">
        </div>
        <div class="mb-3">
            <label for="Brand" class="form-label">Brand</label>
            <input type="text" class="form-control" id="Brand" name="Brand" value="<%= brand %>">
        </div>
        <div class="mb-3">
            <label for="PrimaryMaterial" class="form-label">Primary Material</label>
            <input type="text" class="form-control" id="PrimaryMaterial" name="PrimaryMaterial" value="<%= primaryMaterial %>">
        </div>
        <button type="submit" name="btnupdate" class="btn btn-primary">Update Product</button>
    </form>
</div>

<%@ include file="../footer.jsp" %>