<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>

<%
    String pName = "", cName = "", weight = "", mPrice = "", oPrice = "", pQty = "", warranty = "", dimensions = "", brand = "", primaryMaterial = "";
    String pImgName = "";
    String path = request.getRealPath("/ProductImages/");

    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("ntbtnadd") != null) {
            pName = mrequest.getParameter("productName");
            cName = mrequest.getParameter("categoryName");
            weight = mrequest.getParameter("weight");
            mPrice = mrequest.getParameter("mprice");
            oPrice = mrequest.getParameter("oprice");
            pQty = mrequest.getParameter("qty");
            warranty = mrequest.getParameter("warranty");
            dimensions = mrequest.getParameter("dimensions");
            brand = mrequest.getParameter("brand");
            primaryMaterial = mrequest.getParameter("primaryMaterial");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("productImage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    pImgName = uf.getFileName();
                    upBean.store(mrequest, "productImage");
                }
            }

            db.executeSql("INSERT INTO product (ProductName, CategoryName, Weight, MPrice, OPrice, Qty, Warranty, Dimensions, Brand, PrimaryMaterial, ProductImage) VALUES (?,?,?,?,?,?,?,?,?,?,?)",
                pName, cName, weight, mPrice, oPrice, pQty, warranty, dimensions, brand, primaryMaterial, pImgName);
            successMsg = pName + " Product Added Successfully";
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
                            <option value="<%=rs.getString(2) %>"><%=rs.getString(2) %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="weight">Weight</label>
                    <input type="text" class="form-control" id="weight" name="weight" required>
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
                    <label for="warranty">Warranty</label>
                    <input type="text" class="form-control" id="warranty" name="warranty">
                </div>
                <div class="form-group">
                    <label for="dimensions">Dimensions</label>
                    <input type="text" class="form-control" id="dimensions" name="dimensions">
                </div>
                <div class="form-group">
                    <label for="brand">Brand</label>
                    <input type="text" class="form-control" id="brand" name="brand">
                </div>
                <div class="form-group">
                    <label for="primaryMaterial">Primary Material</label>
                    <input type="text" class="form-control" id="primaryMaterial" name="primaryMaterial">
                </div>
                <div class="form-group">
                    <label for="productImage">Product Image</label>
                    <input type="file" class="form-control-file" id="productImage" name="productImage" required>
                </div>
                <hr>
                <div class="text-center d-grid gap-2 mb-5">
                    <button type="submit" name="ntbtnadd" class="btn btn-primary">Add Product</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
