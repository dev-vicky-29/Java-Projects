<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>

<%
  String pID="", pName="", pPrice="";
  String pImgName="";
     
  String path=request.getRealPath("/ProductImage/");
  
  UploadBean upBean=new UploadBean();
  upBean.setFolderstore(path);
  
  if(MultipartFormDataRequest.isMultipartFormData(request)){
    MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
    
    if(mrequest.getParameter("pbtnadd")!=null){
      pID=mrequest.getParameter("pid");
      pName=mrequest.getParameter("pname");
      pPrice=mrequest.getParameter("pprice");
      Hashtable ht=mrequest.getFiles();
      if(ht!=null && ht.size()>0){
       UploadFile uf=(UploadFile)ht.get("pimage");
         if(uf!=null && uf.getFileName()!=null && !uf.getFileName().equals("")){
          pImgName=uf.getFileName();
          upBean.store(mrequest, "pimage");
         }
      }
      
      // Validation checks
      if(pID.isEmpty() || pName.isEmpty() || pPrice.isEmpty() || pImgName.isEmpty()) {
        errorMsg = "Please fill in all fields.";
      } else {
        db.executeSql("insert into animalfeed (ProductID,ProductName,ProductPrice,ProductImage)  values (?,?,?,?)", pID, pName, pPrice, pImgName);
        successMsg = "Animal Feed Added Successfully";
      }
    }
  }
%>
  
<div class="card  mt-5 col-7 offset-3 ">
  <div class="card-header bg-info text-white">
    <h4 class="text-center">Animal Feed Form</h4>
  </div>
  <div class="card-body custom-border rounded">
    <%-- Display errorMsg if it's not empty --%>
    <% if (!errorMsg.isEmpty()) { %>
      <div class="alert alert-danger" role="alert">
        <%= errorMsg %>
      </div>
    <% } %>
    <form id="afform " action="" method="post" enctype="multipart/form-data">
      <div class="form-group">
        Product ID
        <input name="pid" id="pid" class="form-control" autofocus  value="Product-<%=pID%>"  placeholder="Enter Product ID"  />
      </div>
      <div class="form-group">
        Product Name
        <input name="pname" id="pname" class="form-control" value="<%=pName%>" placeholder="Enter Product Name"/>
      </div>
      <div class="form-group">
        Product Price
        <input name="pprice" id="pprice" class="form-control" value="<%=pPrice%>"  placeholder="Enter Product Price" value="RS-"/>
      </div>
      <div class="form-group mb-3">
        <label for="formFile" class="form-label">Product Image</label>
        <input name="pimage" class="form-control" value="<%=pImgName %>" type="file" id="formFile">
      </div>
      <div class="mt-2 mb-5 text-center d-grid gap-2">
        <input Type="submit" value="Add Product" name="pbtnadd" id="" class="btn btn-lg btn-primary"/>
      </div>
    </form>
  </div>
</div> 

<%@ include file="../footer.jsp"%>
<script>

$(document).ready(function () {
  // Set the initial value of Product ID input field
  $('#pid').val('Product-' + $('#pid').val().slice(8));
});

  $(document).ready(function () {
    $("#afform").validate({
      rules: {
        pid: {
          required: true
        },
        pname: {
          required: true
        },
        pprice: {
          required: true
        },
        pimage: {
          required: true
        }
      },
      messages: {
        pid: {
          required: 'Please enter Product ID'
        },
        pname: {
          required: 'Please enter Product Name'
        },
        pprice: {
          required: 'Please enter Product Price'
        },
        pimage: {
          required: 'Please select Product Image'
        }
      }
    });
  });
</script>
