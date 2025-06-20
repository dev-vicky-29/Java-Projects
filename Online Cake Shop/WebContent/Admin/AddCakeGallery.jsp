<%@ page import="java.util.Hashtable" %>
<%@ page import="javazoom.upload.MultipartFormDataRequest" %>
<%@ page import="javazoom.upload.UploadFile" %>
<%@ page import="javazoom.upload.UploadBean" %>
<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String cakeName = "", cakeImgName = "";
    String path = request.getRealPath("/CakeGalleryImages/");

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddCake") != null) {
            cakeName = mrequest.getParameter("cakeName");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("cakeImage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    cakeImgName = uf.getFileName();
                    // Upload / Save File to server
                    UploadBean upBean = new UploadBean();
                    upBean.setFolderstore(path);
                    upBean.store(mrequest, "cakeImage");
                }
            }

            db.executeSql("INSERT INTO cakegallery (CakeName, CakeImage) VALUES (?, ?)", 
                cakeName, cakeImgName);

            successMsg = "Cake '" + cakeName + "' added successfully.";
        }
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-container">
                <h2>Add Cake</h2>
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group mb-3">
                        <label for="cakeName">Cake Name</label>
                        <input type="text" class="form-control" id="cakeName" name="cakeName" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="cakeImage">Cake Image</label>
                        <input type="file" class="form-control-file" id="cakeImage" name="cakeImage" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" name="btnAddCake" class="btn btn-primary">Add Cake</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
