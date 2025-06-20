<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    if (request.getParameter("action") != null) {
        String action = request.getParameter("action");
        String productId = request.getParameter("productId");
        int qty = Integer.parseInt(request.getParameter("qty"));

        if ("update".equals(action)) {
            db.executeSql("UPDATE Product SET Qty = ? WHERE ProductID = ?", qty, productId);
            successMsg = "Quantity updated successfully!";
        } else if ("add".equals(action)) {
            db.executeSql("UPDATE Product SET Qty = Qty + ? WHERE ProductID = ?", qty, productId);
            successMsg = "Quantity added successfully!";
        }
    }
%>

<div class="container">
    <h1 id="heading">Product Quantity Management</h1>
    <br>
    <table id="productTable" class="table table-bordered">
        <thead>
            <tr class="bg-primary text-white">
                <th>Product Image</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Category Name</th>
                <th>Qty</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            ResultSet rs = db.getRows("SELECT ProductImage, ProductID, ProductName, CategoryName, Qty FROM Product");
            while (rs.next()) {
                String productId = rs.getString("ProductID");
                int currentQty = rs.getInt("Qty");
            %>
            <tr>
                <td><img src="/Online_Cake_Shop/ProductImages/<%= rs.getString("ProductImage") %>" alt="Product Image" style="width: 50px; height: 50px;"></td>
                <td><%= productId %></td>
                <td><%= rs.getString("ProductName") %></td>
                <td><%= rs.getString("CategoryName") %></td>
                <td><%= currentQty %></td>
                <td>
                    <!-- Edit Form -->
                    <form method="post" style="display:inline;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="productId" value="<%= productId %>">
                        <input type="number" name="qty" value="<%= currentQty %>" min="0" class="form-control d-inline w-50">
                        <button type="submit" class="btn btn-success">Update</button>
                    </form>

                    <!-- Add Form -->
                    <form method="post" style="display:inline;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="<%= productId %>">
                        <input type="number" name="qty" placeholder="Add Qty" min="0" class="form-control d-inline w-50">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </form>
                </td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
