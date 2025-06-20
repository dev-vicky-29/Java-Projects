<%@page import="java.sql.*"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.HashMap"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>

<%
    String pName = "", description = "", cName = "", subCName = "", gender = "", pSize = "", mPrice = "", oPrice = "", pQty = "";
    String pImgName = "";

    String path = request.getRealPath("/ProductImages/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    // Categories Fetch Karna
    ResultSet rsCategories = db.getRows("SELECT * FROM category");

    // Subcategories ko HashMap me store karna
    HashMap<Integer, String> subcategoryMap = new HashMap<>();
    ResultSet rsSubcategories = db.getRows("SELECT * FROM subcategory");

    while (rsSubcategories.next()) {
        int subCatId = rsSubcategories.getInt("SubCategoryID");
        String subCatName = rsSubcategories.getString("SubCategoryName");
        int catId = rsSubcategories.getInt("CategoryID");
        subcategoryMap.put(subCatId, subCatName + ":" + catId);
    }

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("ntbtnadd") != null) {
            pName = mrequest.getParameter("productName");
            description = mrequest.getParameter("description");

            //  Category Name Fetch
            ResultSet rsCat = db.getRows("SELECT CategoryName FROM category WHERE CategoryID=" + mrequest.getParameter("categoryName"));
            if (rsCat.next()) {
                cName = rsCat.getString("CategoryName");
            }

            //  Sub-Category Name Fetch
            ResultSet rsSubCat = db.getRows("SELECT SubCategoryName FROM subcategory WHERE SubCategoryID=" + mrequest.getParameter("subCategoryName"));
            if (rsSubCat.next()) {
                subCName = rsSubCat.getString("SubCategoryName");
            }

            gender = mrequest.getParameter("gender");
            pSize = mrequest.getParameter("productSize");
            mPrice = mrequest.getParameter("mprice");
            oPrice = mrequest.getParameter("oprice");
            pQty = mrequest.getParameter("qty");

            //  Image Upload
            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("productImage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    pImgName = uf.getFileName();
                    upBean.store(mrequest, "productImage");
                }
            }

            //  Insert Query (CategoryName & SubCategoryName)
            db.executeSql("INSERT INTO product (ProductName, Description, CategoryName, SubCategoryName, Gender, Size, MPrice, OPrice, Qty, ProductImage) VALUES (?,?,?,?,?,?,?,?,?,?)",
                pName, description, cName, subCName, gender, pSize, mPrice, oPrice, pQty, pImgName);
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
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                </div>

                <!-- Category Dropdown -->
                <div class="form-group">
                    <label for="categoryName">Category Name</label>
                    <select class="form-control" id="categoryName" name="categoryName" required onchange="updateSubcategories()">
                        <option value="">Select Category</option>
                        <% while (rsCategories.next()) { %>
                            <option value="<%=rsCategories.getInt("CategoryID")%>"><%=rsCategories.getString("CategoryName")%></option>
                        <% } %>
                    </select>
                </div>

                <!-- Subcategory Dropdown -->
                <div class="form-group">
                    <label for="subCategoryName">Sub-Category Name</label>
                    <select class="form-control" id="subCategoryName" name="subCategoryName" required>
                        <option value="">Select Sub-Category</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select class="form-control" id="gender" name="gender" required>
                        <option value="Boy">Boy</option>
                        <option value="Girl">Girl</option>
                        <option value="Men">Men</option>
                        <option value="Women">Women</option>
                        <option value="Kids">Kids</option>
                        <option value="None">None</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="productSize">Product Size</label>
                    <input type="text" class="form-control" id="productSize" name="productSize" required>
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

                <div class="text-center d-grid gap-2 mb-5">
                    <button type="submit" name="ntbtnadd" class="btn btn-primary">Add Product</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    var subcategoryData = {
        <% for (int subId : subcategoryMap.keySet()) { 
            String[] subData = subcategoryMap.get(subId).split(":"); 
        %>
            "<%=subId%>": { name: "<%=subData[0]%>", categoryId: "<%=subData[1]%>" },
        <% } %>
    };

    function updateSubcategories() {
        var categoryId = document.getElementById("categoryName").value;
        var subCategoryDropdown = document.getElementById("subCategoryName");
        subCategoryDropdown.innerHTML = '<option value="">Select Sub-Category</option>';

        for (var subId in subcategoryData) {
            if (subcategoryData[subId].categoryId === categoryId) {
                var option = document.createElement("option");
                option.value = subId;
                option.text = subcategoryData[subId].name;
                subCategoryDropdown.appendChild(option);
            }
        }
    }
</script>

<%@ include file="../footer.jsp" %>
