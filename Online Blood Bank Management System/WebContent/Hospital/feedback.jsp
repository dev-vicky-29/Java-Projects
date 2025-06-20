<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@ include file="../header.jsp"%>

<%
    String role = "", name = "", email = "", msg = "", feedbackPhoto = "";
    String path = request.getRealPath("/FeedbackPhotos/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path); // Store uploaded files in this folder

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnSubmitFeedback") != null) {
            role = mrequest.getParameter("txtRole");
            name = mrequest.getParameter("txtName");
            email = mrequest.getParameter("txtEmail");
            msg = mrequest.getParameter("txtMessage");

            Hashtable ht = mrequest.getFiles(); // Hashtable - collection of key/value pairs
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("feedbackPhoto");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    feedbackPhoto = uf.getFileName();
                    upBean.store(mrequest, "feedbackPhoto"); // Upload/save file to server
                }
            }

            db.executeSql(
                "INSERT INTO feedback (role, name, email, msg, photo) VALUES (?, ?, ?, ?, ?)",
                role, name, email, msg, feedbackPhoto
            );
            successMsg = "Feedback submitted successfully!";
        }
    }
%>

<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Feedback Form</h4>
    </div>
    <div class="card-body">
        <form id="FormFeedback" action="" method="post" enctype="multipart/form-data">
            <!-- Role -->
            <div class="form-group">
                Role
                <select name="txtRole" class="form-select" required>
                    <option value="">Select Role</option>
                    <option value="Requester">Requester</option>
                    <option value="Hospital">Hospital</option>
                    <option value="Donor">Donor</option>
                    <option value="Visitor">Visitor</option>
                    
                </select>
            </div>

            <!-- Name -->
            <div class="form-group">
                Name
                <input name="txtName" class="form-control" placeholder="Enter Your Name" required />
            </div>

            <!-- Email -->
            <div class="form-group">
                Email
                <input name="txtEmail" type="email" class="form-control" placeholder="Enter Your Email" required />
            </div>

            <!-- Message -->
            <div class="form-group">
                Message
                <textarea name="txtMessage" class="form-control" placeholder="Write your feedback here" rows="5" required></textarea>
            </div>

            <!-- Photo -->
            <div class="form-group mb-3">
                <label for="feedbackPhoto" class="form-label">Photo (Optional)</label>
                <input name="feedbackPhoto" class="form-control" type="file" id="feedbackPhoto" />
            </div>

            <!-- Submit Button -->
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Submit Feedback" name="btnSubmitFeedback" class="btn btn-lg btn-primary" />
            </div>
        </form>
    </div>
</div>
<%@ include file="../footer.jsp" %>
