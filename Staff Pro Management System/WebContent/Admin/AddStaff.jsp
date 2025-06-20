<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>

<%
    String teacherName = "", emailID = "", number = "", password = "";
    String department = "", education = "", designation = "", profilePDF = "";
    String teacherImage = "";
    

    String path = request.getRealPath("/Photos/");
    String pdfPath = request.getRealPath("/Resumes/");

    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path);

    UploadBean pdfBean = new UploadBean();
    pdfBean.setFolderstore(pdfPath);

    ResultSet rs = db.getRows("SELECT DepartmentName FROM department");

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("ntbtnadd") != null) {
            teacherName = mrequest.getParameter("txtteachername");
            emailID = mrequest.getParameter("txtemail");
            number = mrequest.getParameter("txtnumber");
            password = mrequest.getParameter("txtpassword");
            department = mrequest.getParameter("txtdepartment");
            education = mrequest.getParameter("txteducation");
            designation = mrequest.getParameter("txtdesignation");

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("ntimage");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    teacherImage = uf.getFileName();
                    upBean.store(mrequest, "ntimage");
                }

                UploadFile pdf = (UploadFile) ht.get("ntprofile");
                if (pdf != null && pdf.getFileName() != null && !pdf.getFileName().equals("")) {
                    profilePDF = pdf.getFileName();
                    pdfBean.store(mrequest, "ntprofile");
                }
            }

            try {
                db.executeSql("INSERT INTO staff (StaffName, EmailID, Number, Password, Department, Education, Designation, StaffImage, ProfilePDF) VALUES (?,?,?,?,?,?,?,?,?)",
                        teacherName, emailID, number, password, department, education, designation, teacherImage, profilePDF);
                successMsg = teacherName + " Staff Added Successfully";
            } catch (Exception e) {
                errorMsg = "Error: " + e.getMessage();
            }
        }
    }
%>

<!-- Display Success or Error Message -->
<% if (!successMsg.isEmpty()) { %>
    <script>alert("<%= successMsg %>");</script>
<% } else if (!errorMsg.isEmpty()) { %>
    <script>alert("<%= errorMsg %>");</script>
<% } %>

<!-- Staff Add Form -->
<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Staff</h4>
    </div>
    <div class="card-body">
        <form id="FormNT" action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
                Teacher Name
                <input name="txtteachername" class="form-control" placeholder="Enter Teacher Name" required/>
            </div>
            <div class="form-group">
                Email
                <input name="txtemail" class="form-control" placeholder="Enter Email ID" required/>
            </div>
            <div class="form-group">
                Number
                <input name="txtnumber" class="form-control" placeholder="Enter Phone Number" required/>
            </div>
            <div class="form-group">
                Password
                <input name="txtpassword" class="form-control" type="password"Enter Password" required/>
            </div>
            <div class="form-group">
                Department
                <select name="txtdepartment" class="form-control" required>
                    <option value="">Select Department</option>
                    <% while (rs != null && rs.next()) { %>
                        <option value="<%= rs.getString("DepartmentName") %>"><%= rs.getString("DepartmentName") %></option>
                    <% } %>
                </select>
            </div>
            <div class="form-group">
                Education
                <input name="txteducation" class="form-control" placeholder="Enter Education" required/>
            </div>
            <div class="form-group">
                Designation
                <input name="txtdesignation" class="form-control" placeholder="Enter Designation" required/>
            </div>
            <div class="form-group mb-3">
                <label for="formFile" class="form-label">Teacher Image</label>
                <input name="ntimage" class="form-control" type="file" id="formFile" required>
            </div>
            <div class="form-group mb-3">
                <label for="formFilePdf" class="form-label">Profile (Resume PDF)</label>
                <input name="ntprofile" class="form-control" type="file" id="formFilePdf" accept=".pdf" required>
            </div>
            <div class="text-center d-grid gap-2">
                <input Type="submit" value="Add Staff" name="ntbtnadd" class="btn btn-lg btn-primary"/>
            </div>
        </form>
    </div>
</div>
<%@ include file="../footer.jsp"%>
