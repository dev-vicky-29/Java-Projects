<%@page import="java.sql.*"%>
<%@ include file="../header.jsp" %>

<%

    if (request.getParameter("btnSave") != null) {
        String productId = request.getParameter("productId");
        String weightOrSize = request.getParameter("weightOrSize");
        String basePrice = request.getParameter("basePrice");
        String discountPrice = request.getParameter("discountPrice");
        String stock = request.getParameter("stock");

        db.executeSql(
            "INSERT INTO product_variants (ProductID, WeightOrSize, BasePrice, DiscountPrice, Stock) VALUES (?, ?, ?, ?, ?)",
            productId, weightOrSize, basePrice, discountPrice, stock
        );

        successMsg = "Variant added successfully!";
    }

    ResultSet products = db.getRows("SELECT ProductID, ProductName FROM products");
%>

<div class="container mt-5">
    <h2 class="text-center text-success mb-4">Add Product Variant</h2>
    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <div class="row justify-content-center">
        <div class="col-12 col-md-10 col-lg-8">
            <form class="p-4 border rounded" method="post">
                <!-- Product -->
                <div class="mb-3">
                    <label for="productId" class="form-label">Product</label>
                    <select class="form-select" id="productId" name="productId" required>
                        <option value="" disabled selected>Select Product</option>
                        <% while (products.next()) { %>
                            <option value="<%= products.getString("ProductID") %>"><%= products.getString("ProductName") %></option>
                        <% } %>
                    </select>
                </div>

                <!-- Weight/Size -->
                <div class="mb-3">
                    <label for="weightOrSize" class="form-label">Weight/Size</label>
                    <input type="text" class="form-control" id="weightOrSize" name="weightOrSize" required>
                </div>

                <!-- Base Price -->
                <div class="mb-3">
                    <label for="basePrice" class="form-label">Base Price</label>
                    <input type="number" class="form-control" id="basePrice" name="basePrice" step="0.01" required>
                </div>

                <!-- Discount Price -->
                <div class="mb-3">
                    <label for="discountPrice" class="form-label">Discount Price</label>
                    <input type="number" class="form-control" id="discountPrice" name="discountPrice" step="0.01">
                </div>

                <!-- Stock -->
                <div class="mb-3">
                    <label for="stock" class="form-label">Stock</label>
                    <input type="number" class="form-control" id="stock" name="stock" required>
                </div>

                <!-- Save Button -->
                <div class="text-center  d-grid gap-2">
                    <button type="submit" name="btnSave" class="btn btn-primary btn-lg">Add Variant</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
