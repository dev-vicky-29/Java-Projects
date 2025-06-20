<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>

<%
    String pName = "", cName = "", brandName = "", gender = "", size = "", mPrice = "", oPrice = "", pQty = "", pImgName = "", status = "";
    String path = request.getRealPath("/ProductImages/");

    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("ntbtnadd") != null) {
            pName = mrequest.getParameter("productName");
            cName = mrequest.getParameter("categoryName");
            brandName = mrequest.getParameter("brandName");
            gender = mrequest.getParameter("gender");
            size = mrequest.getParameter("size");
            mPrice = mrequest.getParameter("mprice");
            oPrice = mrequest.getParameter("oprice");
            pQty = mrequest.getParameter("qty");
            status = mrequest.getParameter("status");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("productImage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    pImgName = uf.getFileName();
                    upBean.store(mrequest, "productImage");
                }
            }

            db.executeSql("INSERT INTO product (ProductName, CategoryName, BrandName, Gender, Size, MPrice, OPrice, Qty, ProductImage, Status) VALUES (?,?,?,?,?,?,?,?,?,?)",
                pName, cName, brandName, gender, size, mPrice, oPrice, pQty, pImgName, status);
            successMsg = pName + " Product Added Successfully";
            redirectUrlSuccess = "/Zara_Fashion/Admin/AddProduct.jsp";
        }
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Add Product</h2>
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>
                <div class="form-group">
                    <label for="categoryName">Category Name</label>
                    <select class="form-control" id="categoryName" name="categoryName" required>
                        <%
                            ResultSet rs = db.getRows("SELECT * FROM category");
                            while (rs.next()) {
                        %>
                            <option value="<%=rs.getString("CategoryName") %>"><%=rs.getString("CategoryName") %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="brandName">Brand Name</label>
                    <input type="text" class="form-control" id="brandName" name="brandName" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select class="form-control" id="gender" name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Kids">Kids</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="size">Size</label>
                    <input type="text" class="form-control" id="size" name="size" required>
                </div>
                <div class="form-group">
                    <label for="mprice">Main Price</label>
                    <input type="number" class="form-control" id="mprice" name="mprice" required>
                </div>
                <div class="form-group">
                    <label for="oprice">Offer Price</label>
                    <input type="number" class="form-control" id="oprice" name="oprice" required>
                </div>
                <div class="form-group">
                    <label for="qty">Quantity</label>
                    <input type="number" class="form-control" id="qty" name="qty" required>
                </div>
                <div class="form-group">
                    <label for="productImage">Product Image</label>
                    <input type="file" class="form-control-file" id="productImage" name="productImage" required>
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <select class="form-control" id="status" name="status" required>
                        <option value="Available">Available</option>
                        <option value="Out of Stock">Out of Stock</option>
                    </select>
                </div>
                <hr>
                <div class="text-center d-grid gap-2 mb-5">
                    <button type="submit" name="ntbtnadd" class="btn btn-dark">Add Product</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
