<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ include file="../header.jsp" %>

<%
    String eid = request.getParameter("eid");
    if (eid == null) {
        eid = (String) session.getAttribute("eid");
    }
    if (eid == null) {
        out.println("<div class='alert alert-danger'>Error: Product ID is missing.</div>");
        return;
    }
    session.setAttribute("eid", eid);

    ResultSet rs = db.getRows("SELECT * FROM product WHERE ProductID = ?", eid);
    if (!rs.next()) {
        out.println("<div class='alert alert-danger'>Error: Product not found.</div>");
        return;
    }
    
    // Retrieve product details
    String productName = rs.getString("ProductName");
    String categoryName = rs.getString("CategoryName");
    String brandName = rs.getString("BrandName");
    String gender = rs.getString("Gender");
    String size = rs.getString("Size");
    String mainPrice = rs.getString("MPrice");
    String discountPrice = rs.getString("OPrice");
    String quantity = rs.getString("Qty");
    String status = rs.getString("Status");

    if (request.getParameter("btnupdate") != null) {
        productName = request.getParameter("ProductName");
        categoryName = request.getParameter("CategoryName");
        brandName = request.getParameter("BrandName");
        gender = request.getParameter("Gender");
        size = request.getParameter("Size");
        mainPrice = request.getParameter("MPrice");
        discountPrice = request.getParameter("OPrice");
        quantity = request.getParameter("Qty");
        status = request.getParameter("Status");
        
        try {
            int rowsUpdated = db.executeSql(
                "UPDATE product SET ProductName=?, CategoryName=?, BrandName=?, Gender=?, Size=?, MPrice=?, OPrice=?, Qty=?, Status=? WHERE ProductID=?",
                productName, categoryName, brandName, gender, size, mainPrice, discountPrice, quantity, status, eid
            );
            if (rowsUpdated > 0) {
                out.println("<div class='alert alert-success'>Product Updated Successfully</div>");
            } else {
                out.println("<div class='alert alert-danger'>Failed to update product.</div>");
            }
        } catch (SQLException e) {
            out.println("<div class='alert alert-danger'>Database error: " + e.getMessage() + "</div>");
        }
    }
%>

<div class="container mt-5">
    <h2>Edit Product</h2>
    <form method="post" action="">
        <input type="hidden" name="ProductID" value="<%= eid %>">
        
        <div class="mb-3">
            <label class="form-label">Product Name</label>
            <input type="text" class="form-control" name="ProductName" value="<%= productName %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Category Name</label>
            <select class="form-control" name="CategoryName" required>
                <%
                    ResultSet rs1 = db.getRows("SELECT * FROM category");
                    while (rs1.next()) {
                        String category = rs1.getString("CategoryName");
                %>
                    <option value="<%= category %>" <%= category.equals(categoryName) ? "selected" : "" %>><%= category %></option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Brand Name</label>
            <input type="text" class="form-control" name="BrandName" value="<%= brandName %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Gender</label>
            <select class="form-control" name="Gender" required>
                <option value="Men" <%= gender.equals("Men") ? "selected" : "" %>>Men</option>
                <option value="Women" <%= gender.equals("Women") ? "selected" : "" %>>Women</option>
                <option value="Unisex" <%= gender.equals("Kids") ? "selected" : "" %>>Kids</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Size</label>
            <input type="text" class="form-control" name="Size" value="<%= size %>" required>
            
        </div>

        <div class="mb-3">
            <label class="form-label">Main Price (Rs.)</label>
            <input type="text" class="form-control" name="MPrice" value="<%= mainPrice %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Discount Price (Rs.)</label>
            <input type="text" class="form-control" name="OPrice" value="<%= discountPrice %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Quantity</label>
            <input type="number" class="form-control" name="Qty" value="<%= quantity %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Status</label>
            <select class="form-control" name="Status" required>
                <option value="Available" <%= status.equals("Available") ? "selected" : "" %>>Available</option>
                <option value="Out of Stock" <%= status.equals("Out of Stock") ? "selected" : "" %>>Out of Stock</option>
            </select>
        </div>

        <button type="submit" name="btnupdate" class="btn fw-bold btn-dark">Update Product</button>
        <a class="btn btn-dark fw-bold text-white" href="/Zara_Fashion/Admin/ProductList.jsp">Back</a>
    </form>
</div>

<%@ include file="../footer.jsp" %>
