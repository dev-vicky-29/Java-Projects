<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@ include file="../header.jsp"%>

<%
    String name = "", age = "", gender = "", bloodGroup = "", lastDonationDate = "", contactInfo = "", email = "", password = "";
    String profilePhotoName = "";

    String path = request.getRealPath("/DonorPhotos/");
    UploadBean upBean = new UploadBean();
    upBean.setFolderstore(path); // Store uploaded files in this folder

    if (MultipartFormDataRequest.isMultipartFormData(request)) {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        if (mrequest.getParameter("btnAddDonor") != null) {
            name = mrequest.getParameter("txtName");
            age = mrequest.getParameter("txtAge");
            gender = mrequest.getParameter("txtGender");
            bloodGroup = mrequest.getParameter("txtBloodGroup");
            lastDonationDate = mrequest.getParameter("txtLastDonationDate");
            contactInfo = mrequest.getParameter("txtContactInfo");
            email = mrequest.getParameter("txtEmail"); // Retrieve the email
            password = mrequest.getParameter("password"); // Retrieve the password

            Hashtable ht = mrequest.getFiles(); // Hashtable - collection of key/value pairs
            if (ht != null && ht.size() > 0) {
                UploadFile uf = (UploadFile) ht.get("profilePhoto");
                if (uf != null && uf.getFileName() != null && !uf.getFileName().equals("")) {
                    profilePhotoName = uf.getFileName();
                    upBean.store(mrequest, "profilePhoto"); // Upload/save file to server
                }
            }

            // Add email and password fields to the database query
            db.executeSql(
                "INSERT INTO donors (name, age, gender, blood_group, last_donation_date, contact_info, email, photo, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                name, age, gender, bloodGroup, lastDonationDate, contactInfo, email, profilePhotoName, password
            );
            successMsg = name + " Donor Added Successfully!";
        }
    }
%>


<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/Online_Blood_Bank_Management_System/DonorList.jsp">Donor List</a>
</div>
<div class="card mt-5 col-7 offset-3">
    <div class="card-header bg-info text-white">
        <h4 class="text-center">Add Donor</h4>
    </div>
    <div class="card-body">
        <!-- Donor Registration Form -->
        <form id="FormDonor" action="" method="post" enctype="multipart/form-data">
            <!-- Name -->
            <div class="form-group">
                Full Name
                <input name="txtName" class="form-control" placeholder="Enter Full Name" required />
            </div>

            <!-- Age -->
            <div class="form-group">
                Age
                <input name="txtAge" type="number" class="form-control" placeholder="Enter Age (18+)" min="18" required />
            </div>

            <!-- Gender -->
            <div class="form-group">
                Gender
                <select name="txtGender" class="form-select" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <!-- Blood Group -->
            <div class="form-group">
                Blood Group
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

            <!-- Last Donation Date -->
            <div class="form-group">
                Last Donation Date
                <input name="txtLastDonationDate" type="date" class="form-control" />
            </div>

            <!-- Contact Info -->
            <div class="form-group">
                Contact Info
                <input name="txtContactInfo" class="form-control" placeholder="Enter Contact Number" pattern="[0-9]{10}" required />
                <div class="form-text">Must be a 10-digit number.</div>
            </div>
            
			  <!-- Email -->
			<div class="form-group">
			    <label for="email" class="form-label">Email Address</label>
			    <input type="email" class="form-control" id="email" name="txtEmail" placeholder="Enter Email" required>
			</div>
            
            <!-- Password -->
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
            

            <!-- Profile Photo -->
            <div class="form-group mb-3">
                <label for="profilePhoto" class="form-label">Profile Photo</label>
                <input name="profilePhoto" class="form-control" type="file" id="profilePhoto" required />
            </div>

            <!-- Submit Button -->
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Add Donor" name="btnAddDonor" class="btn btn-lg btn-primary" />
            </div>
        </form>
    </div>
</div>
<%@ include file="../footer.jsp" %>
