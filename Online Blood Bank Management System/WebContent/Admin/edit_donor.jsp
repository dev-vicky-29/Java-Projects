<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
    String donorId = request.getParameter("donor_id");
    String name = "", age = "", gender = "", bloodGroup = "", lastDonationDate = "", contactInfo = "", email = "", photo = "";

    if (donorId != null) {
        ResultSet rs = db.getRows("SELECT * FROM donors WHERE donor_id=?", donorId);
        if (rs.next()) {
            name = rs.getString("name");
            age = rs.getString("age");
            gender = rs.getString("gender");
            bloodGroup = rs.getString("blood_group");
            lastDonationDate = rs.getString("last_donation_date");
            contactInfo = rs.getString("contact_info");
            email = rs.getString("email");
            photo = rs.getString("photo");
        } else {
            out.println("<div class='alert alert-danger'>Invalid Donor ID.</div>");
            return;
        }
    } else {
        out.println("<div class='alert alert-danger'>Donor ID is required.</div>");
        return;
    }

    if (request.getParameter("update") != null) {
        String newName = request.getParameter("name");
        String newAge = request.getParameter("age");
        String newGender = request.getParameter("gender");
        String newBloodGroup = request.getParameter("blood_group");
        String newLastDonationDate = request.getParameter("last_donation_date");
        String newContactInfo = request.getParameter("contact_info");
        String newEmail = request.getParameter("email");

        Part photoPart = request.getPart("photo");
        String newPhoto = photo; // Default to existing photo
        if (photoPart != null && photoPart.getSize() > 0) {
            newPhoto = System.currentTimeMillis() + "_" + photoPart.getSubmittedFileName();
            String photoPath = getServletContext().getRealPath("/DonorPhotos/") + newPhoto;
            File photoFile = new File(photoPath);
            photoPart.write(photoFile.getAbsolutePath());
        }

        int result = db.executeSql(
            "UPDATE donors SET name=?, age=?, gender=?, blood_group=?, last_donation_date=?, contact_info=?, email=?, photo=? WHERE donor_id=?",
            newName, newAge, newGender, newBloodGroup, newLastDonationDate, newContactInfo, newEmail, newPhoto, donorId
        );

        if (result > 0) {
            response.sendRedirect("manage_donors.jsp?msg=success");
        } else {
            out.println("<div class='alert alert-danger'>Failed to update donor details. Please try again.</div>");
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center mb-4">Edit Donor Details</h2>
    <form method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
        <div class="row">
            <!-- Donor Photo -->
            <div class="col-md-4 text-center mb-3">
                <img src="/Online_Blood_Bank_Management_System/DonorPhotos/<%= photo %>" alt="Donor Photo" style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%;">
                <div class="mt-3">
                    <label for="photo" class="form-label">Update Photo</label>
                    <input type="file" class="form-control" id="photo" name="photo">
                </div>
            </div>
            <!-- Donor Information -->
            <div class="col-md-8">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
                </div>
                <div class="mb-3">
                    <label for="age" class="form-label">Age</label>
                    <input type="number" class="form-control" id="age" name="age" value="<%= age %>" required>
                </div>
                <div class="mb-3">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-select" id="gender" name="gender" required>
                        <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= gender.equals("Other") ? "selected" : "" %>>Other</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="bloodGroup" class="form-label">Blood Group</label>
                    <select class="form-select" id="bloodGroup" name="blood_group" required>
                        <option value="A+" <%= bloodGroup.equals("A+") ? "selected" : "" %>>A+</option>
                        <option value="A-" <%= bloodGroup.equals("A-") ? "selected" : "" %>>A-</option>
                        <option value="B+" <%= bloodGroup.equals("B+") ? "selected" : "" %>>B+</option>
                        <option value="B-" <%= bloodGroup.equals("B-") ? "selected" : "" %>>B-</option>
                        <option value="O+" <%= bloodGroup.equals("O+") ? "selected" : "" %>>O+</option>
                        <option value="O-" <%= bloodGroup.equals("O-") ? "selected" : "" %>>O-</option>
                        <option value="AB+" <%= bloodGroup.equals("AB+") ? "selected" : "" %>>AB+</option>
                        <option value="AB-" <%= bloodGroup.equals("AB-") ? "selected" : "" %>>AB-</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="lastDonationDate" class="form-label">Last Donation Date</label>
                    <input type="date" class="form-control" id="lastDonationDate" name="last_donation_date" value="<%= lastDonationDate %>" required>
                </div>
                <div class="mb-3">
                    <label for="contactInfo" class="form-label">Contact Info</label>
                    <input type="text" class="form-control" id="contactInfo" name="contact_info" value="<%= contactInfo %>" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" name="update" class="btn btn-success">Update Donor</button>
                    <a href="/Online_Blood_Bank_Management_System/Admin/manage_donors.jsp" class="btn btn-secondary">Cancel</a>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp"%>
