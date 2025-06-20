<%@ page import="java.util.Hashtable" %>
<%@ page import="javazoom.upload.MultipartFormDataRequest" %>
<%@ page import="javazoom.upload.UploadFile" %>
<%@ page import="javazoom.upload.UploadBean" %>
<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String  pName="", cName="", pInfo="", pSize="", pMPrice="", pOPrice="", pQty="", pImgName="";
    String path=request.getRealPath("/ProductImages/");
    
    if(MultipartFormDataRequest.isMultipartFormData(request)){
        MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
        
        if(mrequest.getParameter("ntbtnadd")!=null){
            
            pName=mrequest.getParameter("productName");
            cName=mrequest.getParameter("categoryName");
            pInfo=mrequest.getParameter("productInfo");
            pSize=mrequest.getParameter("productSize");
            pMPrice=mrequest.getParameter("maxPrice");
            pOPrice=mrequest.getParameter("originalPrice");
            pQty=mrequest.getParameter("qty");
            
            Hashtable ht=mrequest.getFiles();
            if(ht!=null && ht.size()>0){
                UploadFile uf=(UploadFile)ht.get("productImage");
                if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
                    pImgName=uf.getFileName();
                    // Upload / Save File to server
                    UploadBean upBean=new UploadBean();
                    upBean.setFolderstore(path);
                    upBean.store(mrequest, "productImage");
                }
            }
            
            
            db.executeSql("INSERT INTO product ( ProductName, CategoryName, ProductInfo, Size, MPrice, OPrice, Qty, ProductImage) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)", pName, cName, pInfo, pSize, pMPrice, pOPrice, pQty, pImgName);
             
                
               successMsg = pName + " Product Added Successfully";
                // You can use successMsg as needed
        }
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4 fw-bold text-center" >Add Product</h2>
            <form method="post" enctype="multipart/form-data">
                
                <div class="form-group">
                    <label for="productName" class="fw-bold">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>
                <div class="form-group">
                    <label for="categoryName" class="fw-bold">Category Name</label>
                    <select class="form-control" id="categoryName" name="categoryName" required>
                    <%
                    ResultSet rs=db.getRows("select * from category");
                    		while(rs.next()){
                    			
                    		
                    %>
                        <option value="<%=rs.getString(2) %>"><%=rs.getString(2) %></option>

                        <%
                    		}
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="productInfo" class="fw-bold">Product Detail</label>
                    <textarea class="form-control" id="productInfo" name="productInfo" rows="3" required></textarea>
                </div>
                <div class="form-group">
                    <label for="productSize" class="fw-bold">Product Size</label>
                    <input type="text" class="form-control" id="productSize" name="productSize" required>
                </div>
                <div class="form-group">
                    <label for="maxPrice" class="fw-bold">Maximum Price</label>
                    <input type="number" class="form-control" id="maxPrice" name="maxPrice" required>
                </div>
                <div class="form-group">
                    <label for="originalPrice" class="fw-bold">Original Price</label>
                    <input type="number" class="form-control" id="originalPrice" name="originalPrice" required>
                </div>
                <div class="form-group">
                    <label for="qty" class="fw-bold">Quantity</label>
                    <input type="number" class="form-control" id="qty" name="qty" required>
                </div>
                <br>
                <div class="form-group">
                    <label for="productImage" class="fw-bold">Product Image</label>
                    <input type="file" class="form-control-file" id="productImage" name="productImage" required>
                </div> <br>
                <hr>
                <div class="text-center d-grid gap-2 mb-5">
                    <button type="submit" name="ntbtnadd" class="btn btn-primary">Add Product</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
