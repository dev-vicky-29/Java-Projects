<%@ include file="../header.jsp"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
// Get product ID from request
String productId = request.getParameter("productId");
if (productId == null) {
    productId = (String) session.getAttribute("productId");
}

// Retrieve product details from database
String productQuery = "SELECT p.*, c.CategoryName FROM product p JOIN category c ON p.CategoryName = c.CategoryName WHERE p.ProductID = ?";
ResultSet rs = db.getRows(productQuery, productId);

if (rs.next()) {
%>

<div class="container mt-4">
    <h1 class="text-center mb-4"><%= rs.getString("ProductName") %></h1>
    
    <!-- Product Image and Details Grid -->
    <div class="row">
        <!-- Image -->
        <div class="col-md-6">
            <img src="/Online_Furniture_Shop/ProductImages/<%= rs.getString("ProductImage") %>" class="img-fluid rounded shadow" alt="Product Image">
        </div>
        
        <!-- Details -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <form id="productForm" action="UpdateProductServlet" method="post" class="form-view">
                        <input type="hidden" name="productId" value="<%= productId %>">
                        
                        <!-- Product Name -->
                        <div class="mb-3">
                            <label for="productName" class="form-label">Product Name:</label>
                            <input type="text" class="form-control" id="productName" name="productName" value="<%= rs.getString("ProductName") %>" readonly>
                        </div>
                        
                        <!-- Category -->
                        <div class="mb-3">
                            <label for="category" class="form-label">Category:</label>
                            <input type="text" class="form-control" id="category" name="category" value="<%= rs.getString("CategoryName") %>" readonly>
                        </div>
                        
                        <!-- Other fields -->
                        <div class="mb-3">
                            <label for="weight" class="form-label">Weight:</label>
                            <input type="text" class="form-control" id="weight" name="weight" value="<%= rs.getString("Weight") %>" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label for="dimensions" class="form-label">Dimensions:</label>
                            <input type="text" class="form-control" id="dimensions" name="dimensions" value="<%= rs.getString("Dimensions") %>" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label for="mPrice" class="form-label">MRP:</label>
                            <input type="text" class="form-control" id="mPrice" name="mPrice" value="<%= rs.getString("MPrice") %>" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label for="oPrice" class="form-label">Discount Price:</label>
                            <input type="text" class="form-control" id="oPrice" name="oPrice" value="<%= rs.getString("OPrice") %>" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label for="qty" class="form-label">Quantity:</label>
                            <input type="text" class="form-control" id="qty" name="qty" value="<%= rs.getString("Qty") %>" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label for="warranty" class="form-label">Warranty:</label>
                            <input type="text" class="form-control" id="warranty" name="warranty" value="<%= rs.getString("Warranty") %>" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label for="brand" class="form-label">Brand:</label>
                            <input type="text" class="form-control" id="brand" name="brand" value="<%= rs.getString("Brand") %>" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label for="material" class="form-label">Primary Material:</label>
                            <input type="text" class="form-control" id="material" name="material" value="<%= rs.getString("PrimaryMaterial") %>" readonly>
                        </div>
                        
                      
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<%
} else {
    out.println("<div class='alert alert-danger'>Product not found.</div>");
}
rs.close();
%>

<%@ include file="../footer.jsp"%>