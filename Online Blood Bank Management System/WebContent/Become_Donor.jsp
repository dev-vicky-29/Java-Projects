
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="header.jsp"%>

<%
    String msg = "";
    String path = request.getRealPath("/DonorPhotos/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path); // Profile photo upload path

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnBecomeDonor") != null) {
            String name = mrequest.getParameter("txtName");
            String age = mrequest.getParameter("txtAge");
            String gender = mrequest.getParameter("txtGender");
            String bloodGroup = mrequest.getParameter("txtBloodGroup");
            String lastDonationDate = mrequest.getParameter("txtLastDonationDate");
            String contactInfo = mrequest.getParameter("txtContactInfo");
            String email = mrequest.getParameter("txtEmail");
            String password = mrequest.getParameter("password");
            String profilePhotoName = "";
            String status = "Pending"; // Default status
            

            Hashtable ht = mrequest.getFiles();
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("profilePhoto");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    profilePhotoName = uf.getFileName();
                    upBean.store(mrequest, "profilePhoto"); // Save file to server
                }
            }

            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbankdb", "root", "VICK2909"); 
                String query = "INSERT INTO donors (name, age, gender, blood_group, last_donation_date, contact_info, email, password, photo, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, age);
                ps.setString(3, gender);
                ps.setString(4, bloodGroup);
                ps.setString(5, lastDonationDate);
                ps.setString(6, contactInfo);
                ps.setString(7, email);
                ps.setString(8, password);
                ps.setString(9, profilePhotoName);
                ps.setString(10, status);
                
                int rows = ps.executeUpdate();

                if (rows > 0) {
                    msg = "Registration Successful! Please wait for admin approval.";
                    
                    // Send email confirmation
                    String subject = "Blood Donor Registration Successful!";
                    String body = "Dear " + name + ",\n\nThank you for registering as a blood donor. Your request is under review. You will be notified once your account is approved.\n\nRegards,\nBlood Bank Team";
                    SendMail.send(email, subject, body);
                } else {
                    msg = "Error! Please try again.";
                }
                con.close();
            } catch (Exception e) {
                msg = "Database Error: " + e.getMessage();
            }
        }
    }
%>

<div class="container mt-5">
    <div class="card col-md-6 offset-md-3">
        <div class="card-header bg-danger text-white text-center">
            <h4>Become a Blood Donor</h4>
        </div>
        <div class="card-body">
            <%
                if (!msg.equals("")) {
            %>
                <div class="alert alert-info"><%= msg %></div>
            <%
                }
            %>
            <form action="" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="txtName" class="form-control" required />
                </div>

                <div class="form-group">
                    <label>Age</label>
                    <input type="number" name="txtAge" class="form-control" min="18" required />
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <select name="txtGender" class="form-select" required>
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Blood Group</label>
                    <select name="txtBloodGroup" class="form-select" required>
                        <option value="">Select Blood Group</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Last Donation Date</label>
                    <input type="date" name="txtLastDonationDate" class="form-control" />
                </div>

                <div class="form-group">
                    <label>Contact Info</label>
                    <input type="text" name="txtContactInfo" class="form-control" pattern="[0-9]{10}" required />
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="txtEmail" class="form-control" required />
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required />
                </div>

                <div class="form-group">
                    <label>Profile Photo</label>
                    <input type="file" name="profilePhoto" class="form-control" required />
                </div>

                <div class="form-group text-center mt-3">
                    <input type="submit" value="Register as Donor" name="btnBecomeDonor" class="btn btn-danger" />
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
