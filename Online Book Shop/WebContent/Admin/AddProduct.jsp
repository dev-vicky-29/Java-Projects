<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>

<%
    String pName = "", cName = "", language = "", publisher = "", publishingDate = "", totalPages = "", author = "", bookDesc = "";
    String mPrice = "", oPrice = "", pQty = "", pImgName = "";
    String path = request.getRealPath("/ProductImages/");

    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("ntbtnadd") != null) {
            pName = mrequest.getParameter("productName");
            cName = mrequest.getParameter("categoryName");
            language = mrequest.getParameter("language");
            publisher = mrequest.getParameter("publisher");
            publishingDate = mrequest.getParameter("publishingDate");
            totalPages = mrequest.getParameter("totalPages");
            author = mrequest.getParameter("author");
            bookDesc = mrequest.getParameter("bookDesc");
            mPrice = mrequest.getParameter("mprice");
            oPrice = mrequest.getParameter("oprice");
            pQty = mrequest.getParameter("qty");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("productImage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    pImgName = uf.getFileName();
                    upBean.store(mrequest, "productImage");
                }
            }

            db.executeSql("INSERT INTO product (ProductName, CategoryName, Language, Publisher, PublishingDate, TotalPages, Author, BookDescription, MPrice, OPrice, Qty, ProductImage) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)",
                pName, cName, language, publisher, publishingDate, totalPages, author, bookDesc, mPrice, oPrice, pQty, pImgName);
            successMsg = pName + " Product Added Successfully";
            redirectUrlSuccess = "/Online_Book_Shop/Admin/AddProduct.jsp";
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
                    <label for="language">Language</label>
                    <select class="form-control" id="language" name="language" required>
                        <option value="English">English</option>
                        <option value="Hindi">Hindi</option>
                        <option value="Marathi">Marathi</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="publisher">Publisher</label>
                    <input type="text" class="form-control" id="publisher" name="publisher" required>
                </div>
                <div class="form-group">
                    <label for="publishingDate">Publishing Date</label>
                    <input type="date" class="form-control" id="publishingDate" name="publishingDate" required>
                </div>
                <div class="form-group">
                    <label for="totalPages">Total Pages</label>
                    <input type="number" class="form-control" id="totalPages" name="totalPages" required>
                </div>
                <div class="form-group">
                    <label for="author">Author</label>
                    <input type="text" class="form-control" id="author" name="author" required>
                </div>
                <div class="form-group">
                    <label for="bookDesc">Book Description</label>
                    <textarea class="form-control" id="bookDesc" name="bookDesc" rows="4" required></textarea>
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
                <hr>
                <div class="text-center d-grid gap-2 mb-5">
                    <button type="submit" name="ntbtnadd" class="btn btn-primary">Add Product</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
