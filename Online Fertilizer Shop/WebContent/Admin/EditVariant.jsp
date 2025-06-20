<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    String productId = request.getParameter("pid");
    ResultSet variants = db.getRows("SELECT * FROM product_variants WHERE ProductID=?", productId);
   

    // Update Variant Logic
    if (request.getParameter("btnUpdateVariant") != null) {
        String variantId = request.getParameter("variantId");
        String weightSize = request.getParameter("weightSize");
        String basePrice = request.getParameter("basePrice");
        String discountPrice = request.getParameter("discountPrice");
        String stock = request.getParameter("stock");

        db.executeSql(
            "UPDATE product_variants SET WeightOrSize=?, BasePrice=?, DiscountPrice=?, Stock=? WHERE VariantID=?",
            weightSize, basePrice, discountPrice, stock, variantId
        );
        response.sendRedirect("EditVariant.jsp?pid=" + productId + "&successMsg=Variant updated successfully!");
    }

    // Delete Variant Logic
    if (request.getParameter("deleteId") != null) {
        String variantId = request.getParameter("deleteId");
        db.executeSql("DELETE FROM product_variants WHERE VariantID=?", variantId);
        response.sendRedirect("EditVariant.jsp?pid=" + productId + "&successMsg=Variant deleted successfully!");
    }
%>
<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-outline-success pr-5"  style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="/Online_Fertilizer_Shop/Admin/ProductList.jsp">View Product</a>
</div>
<div class="container mt-4">
    <h2>Edit Variants</h2>
	
	<%
	
	ResultSet products = db.getRows("SELECT ProductName from products where ProductID=?", productId);
	 while (products.next()) { 
	%>
	<h6 class="text-success">Product Name:<%= products.getString("ProductName") %></h6>
	 <% } %>
	 
	 
    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Variant ID</th>
                <th>Weight/Size</th>
                <th>Base Price</th>
                <th>Discount Price</th>
                <th>Stock</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                variants.beforeFirst();
                while (variants.next()) { 
                    String variantId = variants.getString("VariantID");
            %>
                <tr id="variantRow<%= variantId %>">
                    <form action="" method="post">
                        <td><%= variantId %></td>
                        <td>
                            <input type="text" class="form-control" name="weightSize" id="weightSize<%= variantId %>" 
                                   value="<%= variants.getString("WeightOrSize") %>" disabled>
                        </td>
                        <td>
                            <input type="text" class="form-control" name="basePrice" id="basePrice<%= variantId %>" 
                                   value="<%= variants.getString("BasePrice") %>" disabled>
                        </td>
                        <td>
                            <input type="text" class="form-control" name="discountPrice" id="discountPrice<%= variantId %>" 
                                   value="<%= variants.getString("DiscountPrice") %>" disabled>
                        </td>
                        <td>
                            <input type="text" class="form-control" name="stock" id="stock<%= variantId %>" 
                                   value="<%= variants.getString("Stock") %>" disabled>
                        </td>
                        <td>
                            <input type="hidden" name="variantId" value="<%= variantId %>">
                            <button type="button" class="btn btn-warning btn-sm" id="editBtn<%= variantId %>"
                                    onclick="makeEditable('<%= variantId %>')">Edit</button>
                            <button type="submit" class="btn btn-primary btn-sm" id="updateBtn<%= variantId %>" 
                                    name="btnUpdateVariant" style="display: none;">Update</button>
                            <a href="?pid=<%= productId %>&deleteId=<%= variantId %>" 
                               onclick="return confirm('Are you sure you want to delete this variant?');"
                               class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </form>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script>
    function makeEditable(variantId) {
        document.getElementById("weightSize" + variantId).disabled = false;
        document.getElementById("basePrice" + variantId).disabled = false;
        document.getElementById("discountPrice" + variantId).disabled = false;
        document.getElementById("stock" + variantId).disabled = false;

        document.getElementById("editBtn" + variantId).style.display = "none";
        document.getElementById("updateBtn" + variantId).style.display = "inline-block";
    }
</script>

<%@ include file="../footer.jsp" %>
