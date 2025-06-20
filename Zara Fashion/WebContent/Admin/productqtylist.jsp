<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    if (request.getParameter("action") != null) {
        String action = request.getParameter("action");
        String productId = request.getParameter("productId");
        int qty = Integer.parseInt(request.getParameter("qty"));

        if ("update".equals(action)) {
            db.executeSql("UPDATE product SET Qty = ? WHERE ProductID = ?", qty, productId);
            successMsg = "Quantity updated successfully!";
        } else if ("add".equals(action)) {
            db.executeSql("UPDATE product SET Qty = Qty + ? WHERE ProductID = ?", qty, productId);
            successMsg = "Quantity added successfully!";
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">Product Quantity Management</h2>

    <div class="table-responsive">
        <table id="productTable" class="table  table-bordered text-center">
            <thead class="table-dark">
                <tr>
                    <th>Product Image</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Stock</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                ResultSet rs = db.getRows("SELECT ProductImage, ProductID, ProductName, CategoryName, Qty FROM product");
                while (rs.next()) {
                    String productId = rs.getString("ProductID");
                    int currentQty = rs.getInt("Qty");
                %>
                <tr>
                    <td>
                        <img src="/Zara_Fashion/ProductImages/<%= rs.getString("ProductImage") %>" 
                             alt="Product Image" class="img-thumbnail" style="max-width: 60px;">
                    </td>
                    <td><%= productId %></td>
                    <td><%= rs.getString("ProductName") %></td>
                    <td><%= rs.getString("CategoryName") %></td>
                    <td><%= currentQty %></td>
                    <td class="d-flex justify-content-center gap-2">
                        <!-- Edit Quantity Form -->
                        <form method="post" class="d-inline">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="productId" value="<%= productId %>">
                            <input type="number" name="qty" value="<%= currentQty %>" min="0" class="form-control d-inline w-50">
                            <button type="submit" class="btn btn-sm btn-success">Update</button>
                        </form>

                        <!-- Add Quantity Form -->
                        <form method="post" class="d-inline">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="<%= productId %>">
                            <input type="number" name="qty" placeholder="Add Qty" min="1" class="form-control d-inline w-50">
                            <button type="submit" class="btn btn-sm btn-primary">Add</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="../footer.jsp" %>
