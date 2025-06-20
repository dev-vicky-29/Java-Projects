<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    // Delete Product Logic
    if (request.getParameter("did") != null) {
        String productId = request.getParameter("did");
        db.executeSql("DELETE FROM product WHERE ProductID = ?", productId);
        successMsg = "Product deleted successfully!";
    }

    // Fetch Products from Database
    ResultSet products = db.getRows("SELECT ProductID, ProductName, CategoryName, ProductInfo, Size, Unit, ProductImage, Status FROM product");
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-outline-success pr-5" href="/Online_Fertilizer_Shop/Admin/AddProduct.jsp">Add Product</a>
</div>

<div class="container mt-5">
    <h2 class="mb-4">Product List</h2>
    <table id="table1" class="table border-secondary border border-2">
        <thead>
            <tr>
                <th>Image</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Category Name</th>
               <!--  <th>Description</th>  -->
                <th>Size</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% while (products.next()) { %>
                <tr>
                    <td><img src="/Online_Fertilizer_Shop/ProductImages/<%= products.getString("ProductImage") %>" alt="Product Image" width="50" height="50"></td>
                    <td><%= products.getString("ProductID") %></td>
                    <td><%= products.getString("ProductName") %></td>
                    <td><%= products.getString("CategoryName") %></td>
                  <!--    <td><%= products.getString("ProductInfo") %></td> -->
                    <td><%= products.getString("Size") %><%= products.getString("Unit") %></td>
                    <td><%= products.getString("Status") %></td>
                    <td class="d-flex justify-content-between">
                        <a href="EditProduct.jsp?pid=<%= products.getString("ProductID") %>" class="btn btn-outline-primary" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">EditProduct</a>
                        
                        <a href="?did=<%= products.getString("ProductID") %>" onclick="return confirm('Do you want to delete <%= products.getString("ProductName") %> Product?');" class="btn btn-outline-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">Delete</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>

<script>
$(function(){
    $("#table1").DataTable();
});
</script>
