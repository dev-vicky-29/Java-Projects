<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@ include file="header.jsp" %>

<%
    String careerId = request.getParameter("careerId");
    String jobTitle = request.getParameter("jobTitle");
%>

<div class="container mt-5">
    <h2 class="mb-4">Apply for <%= jobTitle %></h2>
    <form method="post" enctype="multipart/form-data">
        <input type="hidden" name="careerId" value="<%= careerId %>">
        <input type="hidden" name="jobTitle" value="<%= jobTitle %>">
        <div class="form-group">
            <label for="applicantName">Your Name</label>
            <input type="text" class="form-control" id="applicantName" name="applicantName" required>
        </div>
        <div class="form-group">
            <label for="mobile">Mobile Number</label>
            <input type="text" class="form-control" id="mobile" name="mobile" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="photo">Upload Photo</label>
            <input type="file" class="form-control-file" id="photo" name="photo" required>
        </div>
        <div class="form-group">
            <label for="resume">Upload Resume</label>
            <input type="file" class="form-control-file" id="resume" name="resume" required>
        </div>
        <div class="text-center">
            <button type="submit" name="btnApply" class="btn btn-success">Submit Application</button>
        </div>
    </form>
</div>

<%
    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
        String applicantName = mrequest.getParameter("applicantName");
        String mobile = mrequest.getParameter("mobile");
        String email = mrequest.getParameter("email");
        String careerIdParam = mrequest.getParameter("careerId");
        String jobTitleParam = mrequest.getParameter("jobTitle");

        String photoName = "", resumeName = "";
        String path = getServletContext().getRealPath("/ApplicantFiles/");
        UploadBean upBean = new UploadBean();
        upBean.setFolderstore(path);

        Hashtable ht = mrequest.getFiles();
        if (ht != null) {
            UploadFile photo = (UploadFile) ht.get("photo");
            UploadFile resume = (UploadFile) ht.get("resume");

            if (photo != null) {
                photoName = photo.getFileName();
                upBean.store(mrequest, "photo");
            }
            if (resume != null) {
                resumeName = resume.getFileName();
                upBean.store(mrequest, "resume");
            }
        }

        db.executeSql("INSERT INTO applications (CareerId, JobTitle, ApplicantName, Mobile, Email, Photo, Resume) VALUES (?, ?, ?, ?, ?, ?, ?)",
            careerIdParam, jobTitleParam, applicantName, mobile, email, photoName, resumeName);

        successMsg = "Your Job Application has been submitted successfully!";
        redirectUrlSuccess="career.jsp";
    }
%>

<%@ include file="footer.jsp" %>
