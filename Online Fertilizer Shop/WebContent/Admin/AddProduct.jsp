<%@page import="java.sql.*"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>

<%
    String productName = "", categoryName = "", productInfo = "", unit = "", size = "", mPrice = "", oPrice = "", qty = "", imagePath = "", status = "";
    String uploadedImageName = "";

    String path = request.getRealPath("/ProductImages/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddProduct") != null) {
            productName = mrequest.getParameter("productName");
            categoryName = mrequest.getParameter("categoryName");
            productInfo = mrequest.getParameter("productInfo");
            unit = mrequest.getParameter("unit");
            size = mrequest.getParameter("size");
            mPrice = mrequest.getParameter("mPrice");
            oPrice = mrequest.getParameter("oPrice");
            qty = mrequest.getParameter("qty");
            status = mrequest.getParameter("status");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("productImage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    uploadedImageName = uf.getFileName();
                    upBean.store(mrequest, "productImage");
                }
            }

            db.executeSql(
                "INSERT INTO product (ProductName, CategoryName, ProductInfo, Unit, Size, MPrice, OPrice, Qty, ProductImage, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                productName, categoryName, productInfo, unit, size, mPrice, oPrice, qty, uploadedImageName, status
            );

            successMsg = "Product '" + productName + "' added successfully!";
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center text-success mb-4">Add Product</h2>
    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <div class="row justify-content-center">
        <div class="col-12 col-md-10 col-lg-8">
            <form class="p-4 border rounded" action="" method="post" enctype="multipart/form-data">
                <!-- Product Name -->
                <div class="mb-3">
                    <label for="productName" class="form-label">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>

                <!-- Category Name -->
                <%
                    ResultSet categories = db.getRows("SELECT ID, CategoryName FROM category");
                %>
                <div class="mb-3">
                    <label for="categoryName" class="form-label">Category Name</label>
                    <select class="form-select" id="categoryName" name="categoryName" required>
                        <option value="" disabled selected>Select Category</option>
                        <% while (categories.next()) { %>
                            <option value="<%= categories.getString("CategoryName") %>">
                                <%= categories.getString("CategoryName") %>
                            </option>
                        <% } %>
                    </select>
                </div>

                <!-- Product Info -->
                <div class="mb-3">
                    <label for="productInfo" class="form-label">Product Info</label>
                    <textarea class="form-control" id="productInfo" name="productInfo"></textarea>
                </div>

                <!-- Unit -->
                <div class="mb-3">
                    <label for="unit" class="form-label">Unit</label>
                    <select class="form-select" id="unit" name="unit" required>
                        <option value="Set">Set</option>
                        <option value="Kg">Kg</option>
                        <option value="Ml">Ml</option>
                        <option value="Liter">Liter</option>
                    </select>
                </div>

                <!-- Size -->
                <div class="mb-3">
                    <label for="size" class="form-label">Size</label>
                    <input type="text" class="form-control" id="size" name="size">
                </div>

                <!-- Market Price -->
                <div class="mb-3">
                    <label for="mPrice" class="form-label">Market Price</label>
                    <input type="number" step="0.01" class="form-control" id="mPrice" name="mPrice" required>
                </div>

                <!-- Our Price -->
                <div class="mb-3">
                    <label for="oPrice" class="form-label">Our Price</label>
                    <input type="number" step="0.01" class="form-control" id="oPrice" name="oPrice" required>
                </div>

                <!-- Quantity -->
                <div class="mb-3">
                    <label for="qty" class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="qty" name="qty" required>
                </div>

                <!-- Product Image -->
                <div class="mb-3">
                    <label for="productImage" class="form-label">Product Image</label>
                    <input type="file" class="form-control" id="productImage" name="productImage" required>
                </div>

                <!-- Status -->
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="Active" selected>Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>

                <!-- Save Button -->
                <div class="text-center d-grid gap-2">
                    <button type="submit" name="btnAddProduct" class="btn btn-primary btn-lg">Add Product</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
