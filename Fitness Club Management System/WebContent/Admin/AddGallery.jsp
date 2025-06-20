<%@ page import="java.util.Hashtable" %>
<%@ page import="javazoom.upload.MultipartFormDataRequest" %>
<%@ page import="javazoom.upload.UploadFile" %>
<%@ page import="javazoom.upload.UploadBean" %>
<%@ page import="com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String title = "", imageName = "";
    String path = request.getRealPath("/GalleryImages/");

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddGallery") != null) {
            title = mrequest.getParameter("title");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("galleryImage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    imageName = uf.getFileName();
                    // Upload / Save File to server
                    UploadBean upBean = new UploadBean();
                    upBean.setFolderstore(path);
                    upBean.store(mrequest, "galleryImage");
                }
            }

            // Insert into database using DataAccess class
           
            try {
                db.executeSql("INSERT INTO gallery (Title, ImagePath, CreatedAt) VALUES (?, ?, NOW())", 
                    title, imageName);
                successMsg = "Gallery item '" + title + "' added successfully.";
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="form-container">
                <h2>Add Gallery Image</h2>
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group mb-3">
                        <label for="title">Image Title</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="galleryImage">Upload Image</label>
                        <input type="file" class="form-control-file" id="galleryImage" name="galleryImage" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" name="btnAddGallery" class="btn btn-primary">Add to Gallery</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
