<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    String userId = "", fullName = "", email = "", password = "", contactNumber = "", address = "", role = "", hospitalName = "", bloodGroup = "";

    // Retrieve the logged-in user's email from the session
    email = session.getAttribute("mail").toString();

    // Handle form submissions for profile update
    if (request.getParameter("updateProfileBtn") != null) {
        fullName = request.getParameter("fullName");
        contactNumber = request.getParameter("contactNumber");
        address = request.getParameter("address");
        role = request.getParameter("role");
        hospitalName = request.getParameter("hospitalName");
        bloodGroup = request.getParameter("bloodGroup");
        password = request.getParameter("password");

        try {
            db.executeSql(
                "UPDATE users SET full_name=?, contact_number=?, address=?, role=?, hospital_name=?, blood_group=?, password=? WHERE email=?", 
                fullName, contactNumber, address, role, hospitalName, bloodGroup, password, email
            );
            out.println("<script> showMsg('Profile Updated');</script>");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // Fetch user details from the database
    ResultSet rs = db.getRows("SELECT * FROM users WHERE email=?", email);
    if (rs.next()) {
        userId = rs.getString("user_id");
        fullName = rs.getString("full_name");
        contactNumber = rs.getString("contact_number");
        address = rs.getString("address");
        role = rs.getString("role");
        hospitalName = rs.getString("hospital_name");
        bloodGroup = rs.getString("blood_group");
        password = rs.getString("password");
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
                        <form method="post" class="form custom-border mt-8 rounded">
                            <div class="form-group">
                                <label class="small mb-1">Email ID</label>
                                <input type="email" class="form-control py-4" readonly value="<%= email %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Full Name</label>
                                <input type="text" class="form-control py-4" name="fullName" value="<%= fullName %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Contact Number</label>
                                <input type="text" class="form-control py-4" name="contactNumber" value="<%= contactNumber %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Address</label>
                                <input type="text" class="form-control py-4" name="address" value="<%= address %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Role</label>
                                <select class="form-control py-4" name="role">
                                    <option <%= "Hospital".equalsIgnoreCase(role) ? "selected" : "" %>>Hospital</option>
                                    <option <%= "Requester".equalsIgnoreCase(role) ? "selected" : "" %>>Requester</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Hospital Name (if applicable)</label>
                                <input type="text" class="form-control py-4" name="hospitalName" value="<%= hospitalName %>"/>
                            </div>
                            <div class="form-group">
                                <label class="small mb-1">Blood Group</label>
                                <input type="text" class="form-control py-4" name="bloodGroup" value="<%= bloodGroup %>"/>
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

<%@ include file="../footer.jsp" %>
