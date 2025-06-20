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
    
    String productName = rs.getString("ProductName");
    String categoryName = rs.getString("CategoryName");
    String mainPrice = rs.getString("MPrice");
    String discountPrice = rs.getString("OPrice");
    String quantity = rs.getString("Qty");

    if (request.getParameter("btnupdate") != null) {
        productName = request.getParameter("ProductName");
        categoryName = request.getParameter("CategoryName");
        mainPrice = request.getParameter("MPrice");
        discountPrice = request.getParameter("OPrice");
        quantity = request.getParameter("Qty");
        
        try {
            int rowsUpdated = db.executeSql(
                "UPDATE product SET ProductName=?, CategoryName=?, MPrice=?, OPrice=?, Qty=? WHERE ProductID=?",
                productName, categoryName, mainPrice, discountPrice, quantity, eid
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
                    <label for="categoryName">Category Name</label>
                    <select class="form-control" id="CategoryName" name="CategoryName" required>
                        <%
                            ResultSet rs1 = db.getRows("SELECT * FROM category");
                            while (rs1.next()) {
                        %>
                            <option value="<%=rs1.getString(2) %>"><%=rs1.getString(2) %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
        <div class="mb-3">
            <label class="form-label">Main Price</label>
            <input type="text" class="form-control" name="MPrice" value="<%= mainPrice %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Discount Price</label>
            <input type="text" class="form-control" name="OPrice" value="<%= discountPrice %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Quantity</label>
            <input type="number" class="form-control" name="Qty" value="<%= quantity %>" required>
        </div>
        <button type="submit" name="btnupdate" class="btn btn-primary">Update Product</button>
    </form>
</div>

<%@ include file="../footer.jsp" %>
