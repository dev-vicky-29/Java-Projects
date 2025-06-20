<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@ include file="../header.jsp" %>

<%
    String donorId = "", name = "", age = "", gender = "", bloodGroup = "", lastDonationDate = "", contactInfo = "", email = "", password = "", photo = "", createdAt = "";

    email = session.getAttribute("mail").toString();
    String path = request.getRealPath("/DonorPhotos/");

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mreq = new MultipartFormDataRequest(request);

        if (mreq.getParameter("updateProfileBtn") != null) {
            name = mreq.getParameter("name");
            age = mreq.getParameter("age");
            gender = mreq.getParameter("gender");
            bloodGroup = mreq.getParameter("bloodGroup");
            lastDonationDate = mreq.getParameter("lastDonationDate");
            contactInfo = mreq.getParameter("contactInfo");
            password = mreq.getParameter("password");

            try {
                db.executeSql("UPDATE donors SET name=?, age=?, gender=?, blood_group=?, last_donation_date=?, contact_info=?, password=? WHERE email=?", 
                    name, age, gender, bloodGroup, lastDonationDate, contactInfo, password, email);
                out.println("<script> showMsg('Profile Updated');</script>");
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
                    db.executeSql("UPDATE donors SET photo=? WHERE email=?", photo, email);
                    out.println("<script> showMsg('Photo Updated');</script>");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    ResultSet rs = db.getRows("SELECT * FROM donors WHERE email=?", email);
    if (rs.next()) {
        donorId = rs.getString("donor_id");
        name = rs.getString("name");
        age = rs.getString("age");
        gender = rs.getString("gender");
        bloodGroup = rs.getString("blood_group");
        lastDonationDate = rs.getString("last_donation_date");
        contactInfo = rs.getString("contact_info");
        password = rs.getString("password");
        photo = rs.getString("photo");
        createdAt = rs.getString("created_at");
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
                        <form method="post" name="form1" id="form1" enctype="multipart/form-data" class="form custom-border mt-8 rounded">
                            <div class="form-group">
                                <img src="/Online_Blood_Bank_Management_System/DonorPhotos/<%= photo %>" width="150" height="150" alt="Profile Picture" class="img-thumbnail rounded-circle mx-auto d-block"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Email ID</label>
                                <input type="email" class="form-control py-4" readonly value="<%= email %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Name</label>
                                <input type="text" class="form-control py-4" name="name" value="<%= name %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Age</label>
                                <input type="number" class="form-control py-4" name="age" value="<%= age %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Gender</label>
                                <select class="form-control py-4" name="gender">
                                    <option <%= "Male".equalsIgnoreCase(gender) ? "selected" : "" %>>Male</option>
                                    <option <%= "Female".equalsIgnoreCase(gender) ? "selected" : "" %>>Female</option>
                                    <option <%= "Other".equalsIgnoreCase(gender) ? "selected" : "" %>>Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Blood Group</label>
                                <input type="text" class="form-control py-4" name="bloodGroup" value="<%= bloodGroup %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Last Donation Date</label>
                                <input type="date" class="form-control py-4" name="lastDonationDate" value="<%= lastDonationDate %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Contact Info</label>
                                <input type="text" class="form-control py-4" name="contactInfo" value="<%= contactInfo %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Password</label>
                                <input type="password" class="form-control py-4" name="password" value="<%= password %>"/>
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
