<%@ page import="java.util.Hashtable" %>
<%@ page import="javazoom.upload.MultipartFormDataRequest" %>
<%@ page import="javazoom.upload.UploadFile" %>
<%@ page import="javazoom.upload.UploadBean" %>
<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String pName = "", cName = "", pInfo = "", pSize = "", pMPrice = "", pOPrice = "", pQty = "", pImgName = "";
    String path = request.getRealPath("/ProductImages/");

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("ntbtnadd") != null) {
            pName = mrequest.getParameter("productName");
            cName = mrequest.getParameter("categoryName");
            pInfo = mrequest.getParameter("productInfo");
            pSize = mrequest.getParameter("productSize");
            pMPrice = mrequest.getParameter("maxPrice");
            pOPrice = mrequest.getParameter("originalPrice");
            pQty = mrequest.getParameter("qty");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("productImage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    pImgName = uf.getFileName();
                    // Upload / Save File to server
                    UploadBean upBean = new UploadBean();
                    upBean.setFolderstore(path);
                    upBean.store(mrequest, "productImage");
                }
            }

            db.executeSql("INSERT INTO product (ProductName, CategoryName, ProductInfo, Size, MPrice, OPrice, Qty, ProductImage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", 
                pName, cName, pInfo, pSize, pMPrice, pOPrice, pQty, pImgName);

            successMsg = pName + " Product Added Successfully";
        }
    }
%>

<style>
    .form-container {
        background: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 30px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .form-container h2 {
        font-size: 1.8rem;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
        color: #495057;
    }

    .form-group label {
        font-weight: bold;
        color: #343a40;
    }

    .form-control, .form-control-file {
        border: 1px solid #ced4da;
        border-radius: 5px;
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
        font-size: 1rem;
        padding: 10px 15px;
        border-radius: 5px;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }
</style>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="form-container">
                <h2>Add Product</h2>
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group mb-3">
                        <label for="productName">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="categoryName">Category Name</label>
                        <select class="form-control" id="categoryName" name="categoryName" required>
                            <%
                                ResultSet rs = db.getRows("SELECT * FROM category");
                                while (rs.next()) {
                            %>
                                <option value="<%= rs.getString(2) %>"><%= rs.getString(2) %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="productInfo">Product Detail</label>
                        <textarea class="form-control" id="productInfo" name="productInfo" rows="3" required></textarea>
                    </div>
                    <div class="form-group mb-3">
                        <label for="productSize">Product Size</label>
                        <input type="text" class="form-control" id="productSize" name="productSize" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="maxPrice">Maximum Price</label>
                        <input type="number" class="form-control" id="maxPrice" name="maxPrice" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="originalPrice">Original Price</label>
                        <input type="number" class="form-control" id="originalPrice" name="originalPrice" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="qty">Quantity</label>
                        <input type="number" class="form-control" id="qty" name="qty" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="productImage">Product Image</label>
                        <input type="file" class="form-control-file" id="productImage" name="productImage" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" name="ntbtnadd" class="btn btn-primary">Add Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
