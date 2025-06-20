<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    if (request.getParameter("action") != null) {
        String action = request.getParameter("action");
        String productId = request.getParameter("productId");
        int qty = Integer.parseInt(request.getParameter("qty"));
        String size = request.getParameter("size");
        String unit = request.getParameter("unit");

        if ("update".equals(action)) {
            db.executeSql("UPDATE product SET Qty = ?, Size = ?, Unit = ? WHERE ProductID = ?", qty, size, unit, productId);
            successMsg = "Product details updated successfully!";
        } else if ("add".equals(action)) {
            db.executeSql("UPDATE product SET Qty = Qty + ? WHERE ProductID = ?", qty, productId);
            successMsg = "Quantity added successfully!";
        }
    }
%>

<div class="container">
    <h1 id="heading">Fertilizer Product Management</h1>
    <br>
    <table id="productTable" class="table table-bordered">
        <thead>
            <tr class="bg-primary text-white">
                <th>Product Image</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Category Name</th>
                <th>Size</th>
                <th>Unit</th>
                <th>Qty</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            ResultSet rs = db.getRows("SELECT ProductImage, ProductID, ProductName, CategoryName, Size, Unit, Qty FROM product");
            while (rs.next()) {
                String productId = rs.getString("ProductID");
                int currentQty = rs.getInt("Qty");
                String size = rs.getString("Size");
                String unit = rs.getString("Unit");
            %>
            <tr>
                <td><img src="/Online_Fertilizer_Shop/ProductImages/<%= rs.getString("ProductImage") %>" alt="Product Image" style="width: 50px; height: 50px;"></td>
                <td><%= productId %></td>
                <td><%= rs.getString("ProductName") %></td>
                <td><%= rs.getString("CategoryName") %></td>
                <td><%= size %></td>
                <td><%= unit %></td>
                <td><%= currentQty %></td>
                <td>
                    <!-- Edit Form -->
                    <form method="post" style="display:inline;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="productId" value="<%= productId %>">
                        
                        <!-- Size -->
                        <input type="text" name="size" value="<%= size %>" class="form-control d-inline w-25" required>

                        <!-- Unit -->
                        <select name="unit" class="form-select d-inline w-25" required>
                            <option value="Set" <%= "Set".equals(unit) ? "selected" : "" %>>Set</option>
                            <option value="Kg" <%= "Kg".equals(unit) ? "selected" : "" %>>Kg</option>
                            <option value="Ml" <%= "Ml".equals(unit) ? "selected" : "" %>>Ml</option>
                            <option value="Liter" <%= "Liter".equals(unit) ? "selected" : "" %>>Liter</option>
                        </select>

                        <!-- Qty -->
                        <input type="number" name="qty" value="<%= currentQty %>" min="0" class="form-control d-inline w-25" required>

                        <button type="submit" class="btn btn-success">Update</button>
                    </form>

                    <!-- Add Quantity Form -->
                    <form method="post" style="display:inline;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="<%= productId %>">
                        <input type="number" name="qty" placeholder="Add Qty" min="0" class="form-control d-inline w-50" required>
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
