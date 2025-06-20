<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    String productId = request.getParameter("pid");
    ResultSet product = db.getRows("SELECT * FROM product WHERE ProductID=?", productId);
    product.next();

    if (request.getParameter("btnUpdateProduct") != null) {
        String productName = request.getParameter("productName");
        String categoryName = request.getParameter("categoryName");
        String productInfo = request.getParameter("productInfo");
        String unit = request.getParameter("unit");
        String size = request.getParameter("size");
        String mPrice = request.getParameter("mPrice");
        String oPrice = request.getParameter("oPrice");
        String qty = request.getParameter("qty");
        String status = request.getParameter("status");

        db.executeSql(
            "UPDATE product SET ProductName=?, CategoryName=?, ProductInfo=?, Unit=?, Size=?, MPrice=?, OPrice=?, Qty=?, Status=? WHERE ProductID=?",
            productName, categoryName, productInfo, unit, size, mPrice, oPrice, qty, status, productId
        );
        successMsg = "Product Updated successfully!";
        redirectUrlSuccess="/Online_Fertilizer_Shop/Admin/ProductList.jsp";
       
    }
%>

<div class="container mt-4">
    <h2 class="text-success">Edit Product</h2>
    <form action="" method="post">
        <!-- Product Name -->
        <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" name="productName" 
                   value="<%= product.getString("ProductName") %>" required>
        </div>
        
        <!-- Category Name -->
        <div class="mb-3">
            <label for="categoryName" class="form-label">Category Name</label>
            <input type="text" class="form-control" id="categoryName" name="categoryName" 
                   value="<%= product.getString("CategoryName") %>" required>
        </div>
        
        <!-- Product Info -->
        <div class="mb-3">
            <label for="productInfo" class="form-label">Product Info</label>
            <textarea class="form-control" id="productInfo" name="productInfo" required>
                <%= product.getString("ProductInfo") %>
            </textarea>
        </div>
        
        <!-- Unit -->
        <div class="mb-3">
            <label for="unit" class="form-label">Unit</label>
            <select class="form-select" id="unit" name="unit" required>
                <option value="Set" <%= "Set".equals(product.getString("Unit")) ? "selected" : "" %>>Set</option>
                <option value="Kg" <%= "Kg".equals(product.getString("Unit")) ? "selected" : "" %>>Kg</option>
                <option value="Ml" <%= "Ml".equals(product.getString("Unit")) ? "selected" : "" %>>Ml</option>
                <option value="Liter" <%= "Liter".equals(product.getString("Unit")) ? "selected" : "" %>>Liter</option>
            </select>
        </div>
        
        <!-- Size -->
        <div class="mb-3">
            <label for="size" class="form-label">Size</label>
            <input type="text" class="form-control" id="size" name="size" 
                   value="<%= product.getString("Size") %>" required>
        </div>
        
        <!-- Market Price -->
        <div class="mb-3">
            <label for="mPrice" class="form-label">Market Price</label>
            <input type="number" step="0.01" class="form-control" id="mPrice" name="mPrice" 
                   value="<%= product.getString("MPrice") %>" required>
        </div>
        
        <!-- Offer Price -->
        <div class="mb-3">
            <label for="oPrice" class="form-label">Offer Price</label>
            <input type="number" step="0.01" class="form-control" id="oPrice" name="oPrice" 
                   value="<%= product.getString("OPrice") %>" required>
        </div>
        
        <!-- Quantity -->
        <div class="mb-3">
            <label for="qty" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="qty" name="qty" 
                   value="<%= product.getString("Qty") %>" required>
        </div>
        
        <!-- Status -->
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status" required>
                <option value="Active" <%= "Active".equals(product.getString("Status")) ? "selected" : "" %>>Active</option>
                <option value="Inactive" <%= "Inactive".equals(product.getString("Status")) ? "selected" : "" %>>Inactive</option>
            </select>
        </div>
        
        <!-- Submit Button -->
        <div class="text-center d-grid gap-2">
            <button type="submit" name="btnUpdateProduct" class="btn btn-primary">Update Product</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
