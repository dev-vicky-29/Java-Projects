<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp" %>



  
  <%
 	String  pName="", cName="", pSize="", mPrice="", oPrice="", pQty="";
 	String pImgName="";
			  
 	String path=request.getRealPath("/ProductImages/");
 	//
 	//
 	UploadBean upBean=new UploadBean();
 	upBean.setFolderstore(path); //Store Uploaded Files In This Folder.
 	
 		if(MultipartFormDataRequest.isMultipartFormData(request)){
 			MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
 			//request (MP) ==> Wrapper ==> MultiFormDataRequest
 				//Add Button Operation
 				if(mrequest.getParameter("ntbtnadd")!=null){
 					
 					pName=mrequest.getParameter("productName");
 					cName=mrequest.getParameter("categoryName");
 					pSize=mrequest.getParameter("productSize");
 					mPrice=mrequest.getParameter("mprice");
 					oPrice=mrequest.getParameter("oprice");
 					pQty=mrequest.getParameter("qty");
 					
 					Hashtable ht=mrequest.getFiles(); //Hashtable - collection of Key/Value Pair
 					if(ht!=null && ht.size()>0){
 						UploadFile uf=(UploadFile)ht.get("productImage"); //Return Type ==> Object
 								if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
 									pImgName=uf.getFileName();
 									//Upload / Save File to server
 									upBean.store(mrequest, "productImage");
 								}
 					}
 								db.executeSql("insert into product ( ProductName, CategoryName, Size, MPrice, OPrice, Qty, ProductImage)  values (?,?,?,?,?,?,?)", pName, cName,pSize,mPrice,oPrice,pQty, pImgName); //This Line For Insert Record Into Database Product table	
			successMsg=pName+" Product Added Successfully";
			}
  	
  		 		}

%>
  
  



<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Add Product</h2>
            <form  method="post" enctype="multipart/form-data">
               
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>
                <div class="form-group">
                    <label for="categoryName">Category Name</label>
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
                <br>
                <div class="form-group">
                    <label for="productImage">Product Image</label>
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

<script>
$(document).ready(function() {
    $('#productId').on('blur', function() {
        var id = $(this).val();
        $.ajax({
            type: 'POST',
            url: 'checkid.jsp',
            data: {id: id},
            success: function(response) {
                console.log(response); // Log the response to the console for debugging
                if (response.idExists) {
                    // Display error message
                    $('#id-error').text('Product ID already exists. Please enter another ID.');
                    $('#productId').addClass('is-invalid'); // Add Bootstrap class for invalid input
                } else {
                    // Clear error message
                    $('#id-error').text('');
                    $('#productId').removeClass('is-invalid'); // Remove Bootstrap class for invalid input
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    });
});


</script>

<%@ include file="../footer.jsp" %>