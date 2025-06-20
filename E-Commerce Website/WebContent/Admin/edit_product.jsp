<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
String eid = request.getParameter("eid"); // Get from request parameter

// If eid is in request, store in session
if (eid != null && !eid.isEmpty()) {
    session.setAttribute("eid", eid);
} else {
    // If not in request, fetch from session
    eid = (String) session.getAttribute("eid");
}

// Debugging output
System.out.println("Debug: Product ID in session - " + eid);

String productId = "", productName = "", description = "", categoryName = "", subCategoryName = "", gender = "", size = "", mainPrice = "", offerPrice = "", quantity = "";


// Fetch product details if eid is valid
if (eid != null && !eid.isEmpty()) {
    try {
        ResultSet rs = db.getRows("SELECT * FROM product WHERE ProductId=?", eid);
        if (rs.next()) {
            productId = rs.getString("ProductId");
            productName = rs.getString("ProductName");
            description = rs.getString("Description");
            categoryName = rs.getString("CategoryName");
            subCategoryName = rs.getString("SubCategoryName");
            gender = rs.getString("Gender");
            size = rs.getString("Size");
            mainPrice = rs.getString("MPrice");
            offerPrice = rs.getString("OPrice");
            quantity = rs.getString("Qty");
        } else {
            errorMsg = "Product not found in database!";
        }
        rs.close();
    } catch (Exception e) {
        errorMsg = "Error fetching product: " + e.getMessage();
    }
} else {
    errorMsg = "Invalid product ID received!";
}

// Handle product update
if (request.getParameter("btnupdate") != null) {
    productName = request.getParameter("productName");
    description = request.getParameter("description");
    categoryName = request.getParameter("categoryName");
    subCategoryName = request.getParameter("subCategoryName");
    gender = request.getParameter("gender");
    size = request.getParameter("size");
    mainPrice = request.getParameter("mainPrice");
    offerPrice = request.getParameter("offerPrice");
    quantity = request.getParameter("quantity");

    if (productName.isEmpty() || description.isEmpty() || categoryName.isEmpty() || subCategoryName.isEmpty() || gender.isEmpty() || size.isEmpty() || mainPrice.isEmpty() || offerPrice.isEmpty() || quantity.isEmpty()) {
        errorMsg = "All fields are required!";
    } else {
        int rowsAffected = db.executeSql("UPDATE product SET ProductName=?, Description=?, CategoryName=?, SubCategoryName=?, Gender=?, Size=?, MPrice=?, OPrice=?, Qty=? WHERE ProductId=?", 
            productName, description, categoryName, subCategoryName, gender, size, mainPrice, offerPrice, quantity, productId);

        if (rowsAffected > 0) {
            successMsg = "Product updated successfully!";
            session.removeAttribute("eid");
            // Clear session after update
            redirectUrlSuccess ="/E-Commerce_Website/Admin/ProductList.jsp";
        } else {
            errorMsg = "Failed to update product.";
        }
    }
}

// Fetch categories & subcategories
ResultSet categories = db.getRows("SELECT * FROM category");
ResultSet subCategories = db.getRows("SELECT * FROM subcategory");
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Edit Product</h2>
            <% if (!errorMsg.isEmpty()) { %>
                <div class="alert alert-danger"><%= errorMsg %></div>
            <% } else if (!successMsg.isEmpty()) { %>
                <div class="alert alert-success"><%= successMsg %></div>
            <% } %>
            
            <form method="post">
                <div class="form-group">
                    <label for="productId">Product ID:</label>
                    <input type="text" id="productId" name="productId" class="form-control" value="<%= productId %>" readonly>
                </div>
                <div class="form-group">
                    <label for="productName">Product Name:</label>
                    <input type="text" id="productName" name="productName" class="form-control" value="<%= productName %>" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" class="form-control" required><%= description %></textarea>
                </div>
                <div class="form-group">
                    <label for="categoryName">Category:</label>
                    <select class="form-control" id="categoryName" name="categoryName" required>
                        <% while (categories.next()) { %>
                            <option value="<%= categories.getString("CategoryName") %>" <%= categoryName.equals(categories.getString("CategoryName")) ? "selected" : "" %>><%= categories.getString("CategoryName") %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="subCategoryName">Sub-Category:</label>
                    <select class="form-control" id="subCategoryName" name="subCategoryName" required>
                        <% while (subCategories.next()) { %>
                            <option value="<%= subCategories.getString("SubCategoryName") %>" <%= subCategoryName.equals(subCategories.getString("SubCategoryName")) ? "selected" : "" %>><%= subCategories.getString("SubCategoryName") %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <input type="text" id="gender" name="gender" class="form-control" value="<%= gender %>" required>
                </div>
                <div class="form-group">
                    <label for="size">Size:</label>
                    <input type="text" id="size" name="size" class="form-control" value="<%= size %>" required>
                </div>
                <div class="form-group">
                    <label for="mainPrice">Main Price:</label>
                    <input type="text" id="mainPrice" name="mainPrice" class="form-control" value="<%= mainPrice %>" required>
                </div>
                <div class="form-group">
                    <label for="offerPrice">Offer Price:</label>
                    <input type="text" id="offerPrice" name="offerPrice" class="form-control" value="<%= offerPrice %>" required>
                </div>
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="text" id="quantity" name="quantity" class="form-control" value="<%= quantity %>" required>
                </div>
                <div class="text-center">
                    <button type="submit" name="btnupdate" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>
