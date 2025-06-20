<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="javazoom.upload.UploadBean" %>
<%@ page import="javazoom.upload.UploadFile" %>
<%@ page import="javazoom.upload.MultipartFormDataRequest" %>
<%@ include file="../header.jsp" %>

<%
    String staffId = "", name = "", mobile = "", email = "", password = "", department = "", designation = "", photo = "", profilePDF = "", salary = "";
    email = session.getAttribute("mail").toString();
    String path = request.getRealPath("/Photos/");

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mreq = new MultipartFormDataRequest(request);

        if (mreq.getParameter("updateProfileBtn") != null) {
            name = mreq.getParameter("name");
            mobile = mreq.getParameter("mobile");
            department = mreq.getParameter("department");
            designation = mreq.getParameter("designation");
            password = mreq.getParameter("password");
            
            try {
                db.executeSql("UPDATE staff SET StaffName=?, Number=?, Department=?, Designation=?, Password=? WHERE EmailID=?", 
                    name, mobile, department, designation, password, email);
                out.println("<script> alert('Profile Updated Successfully!'); </script>");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else if (mreq.getParameter("updatePhotoBtn") != null) {
            Hashtable ht = mreq.getFiles();
            UploadFile ufile = (UploadFile) ht.get("photo");
            if (ufile != null) {
                photo = ufile.getFileName();
                UploadBean ub = new UploadBean();
                ub.setFolderstore(path);
                ub.store(mreq, "photo");

                try {
                    db.executeSql("UPDATE staff SET StaffImage=? WHERE EmailID=?", photo, email);
                    out.println("<script> alert('Photo Updated Successfully!'); </script>");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    ResultSet rs = db.getRows("SELECT * FROM staff WHERE EmailID=?", email);
    if (rs.next()) {
        staffId = rs.getString("StaffID");
        name = rs.getString("StaffName");
        mobile = rs.getString("Number");
        password = rs.getString("Password");
        department = rs.getString("Department");
        designation = rs.getString("Designation");
        photo = rs.getString("StaffImage");
        profilePDF = rs.getString("ProfilePDF");
        salary = rs.getString("Salary");
    }
%>

<section id="form" class="mt-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header">
                        <h3 class="text-center font-weight-light my-4">Manage Your Profile</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" enctype="multipart/form-data" class="form custom-border mt-8 rounded">
                            <div class="form-group">
                                <img src="/Staff_Pro_Management_System/Photos/<%= photo %>" width="150" height="150" alt="Profile Picture" class="img-thumbnail rounded-circle mx-auto d-block"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Email ID</label>
                                <input type="email" class="form-control py-4" readonly value="<%= email %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Name</label>
                                <input type="text" class="form-control py-4" name="name" value="<%= name %>" required/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Mobile Number</label>
                                <input type="text" class="form-control py-4" name="mobile" value="<%= mobile %>" required/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Department</label>
                                <input type="text" class="form-control py-4" name="department" readonly value="<%= department %>" required/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Designation</label>
                                <input type="text" class="form-control py-4" name="designation" readonly value="<%= designation %>" required/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Salary</label>
                                <input type="text" class="form-control py-4" readonly value="<%= salary %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Password</label>
                                <input type="password" class="form-control py-4" name="password"  value="<%= password %>" required/>
                            </div>
                            <div class="form-group mt-4 mb-0">
                                <div class="text-center d-grid gap-2">
                                    <button type="submit" name="updateProfileBtn" class="btn btn-primary btn-block">Update Profile</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="photo" class="mt-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header">
                        <h3 class="text-center font-weight-light my-4">Update Your Photo</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="small mb-1">Upload Photo</label>
                                <input type="file" name="photo" class="form-control"/>
                            </div>
                            <div class="form-group mt-4 mb-0">
                                <div class="text-center d-grid gap-2">
                                    <button type="submit" name="updatePhotoBtn" class="btn btn-primary btn-block">Update Photo</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
