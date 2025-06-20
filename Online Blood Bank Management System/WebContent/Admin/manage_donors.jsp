<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    // Approve or Reject Donor
    if (request.getParameter("approve_id") != null) {
        String donorId = request.getParameter("approve_id");
        db.executeSql("UPDATE donors SET status='Approved' WHERE donor_id=?", donorId);

        // Send approval email
        ResultSet donorData = db.getRows("SELECT email, name FROM donors WHERE donor_id=?", donorId);
        if (donorData.next()) {
            String email = donorData.getString("email");
            String name = donorData.getString("name");
            String subject = "Blood Donation Approval";
            String message = "Dear " + name + ",\n\nYour donor registration has been approved.\nThank you for your support!\n\nBest Regards,\nBlood Bank Team";
            SendMail.send(email, subject, message);
        }
    } else if (request.getParameter("reject_id") != null) {
        String donorId = request.getParameter("reject_id");
        db.executeSql("UPDATE donors SET status='Rejected' WHERE donor_id=?", donorId);

        // Send rejection email
        ResultSet donorData = db.getRows("SELECT email, name FROM donors WHERE donor_id=?", donorId);
        if (donorData.next()) {
            String email = donorData.getString("email");
            String name = donorData.getString("name");
            String subject = "Blood Donation Registration Rejected";
            String message = "Dear " + name + ",\n\nUnfortunately, your donor registration has been rejected.\nPlease contact support for further details.\n\nBest Regards,\nBlood Bank Team";
            SendMail.send(email, subject, message);
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Donors</h2>

    <!-- Search Bar -->
    <div class="input-group mb-3">
        <input type="text" id="searchInput" class="form-control" placeholder="Search by Name or Blood Group" onkeyup="filterDonors();">
    </div>

    <!-- Donors Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Image</th>
                    <th>Donor ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Blood Group</th>
                    <th>Last Donation Date</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="donorTableBody">
                <%
                    ResultSet rs = db.getRows("SELECT * FROM donors");
                    while (rs.next()) {
                        String donorId = rs.getString("donor_id");
                        String photo = rs.getString("photo");
                        String name = rs.getString("name");
                        String age = rs.getString("age");
                        String gender = rs.getString("gender");
                        String bloodGroup = rs.getString("blood_group");
                        String lastDonationDate = rs.getString("last_donation_date");
                        String contactInfo = rs.getString("contact_info");
                        String email = rs.getString("email");
                        String status = rs.getString("status");
                %>
                <tr>
                    <td>
                        <img src="/Online_Blood_Bank_Management_System/DonorPhotos/<%= photo %>" alt="Donor Image" style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%;">
                    </td>
                    <td><%= donorId %></td>
                    <td><%= name %></td>
                    <td><%= age %></td>
                    <td><%= gender %></td>
                    <td><%= bloodGroup %></td>
                    <td><%= lastDonationDate %></td>
                    <td><%= contactInfo %></td>
                    <td><%= email %></td>
                    <td>
                        <span class="badge bg-<%= status.equals("Approved") ? "success" : status.equals("Rejected") ? "danger" : "warning" %>">
                            <%= status %>
                        </span>
                    </td>
                    <td>
                        <% if (status.equals("Pending")) { %>
                            <!-- Approve Button -->
                            <a href="manage_donors.jsp?approve_id=<%= donorId %>" class="btn btn-success btn-sm">Approve</a>
                            <!-- Reject Button -->
                            <a href="manage_donors.jsp?reject_id=<%= donorId %>" class="btn btn-danger btn-sm">Reject</a>
                        <% } else { %>
                            <span class="text-muted">No Actions</span>
                        <% } %>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function filterDonors() {
        const query = document.getElementById('searchInput').value.toLowerCase();
        document.querySelectorAll('#donorTableBody tr').forEach(row => {
            row.style.display = row.innerText.toLowerCase().includes(query) ? '' : 'none';
        });
    }
</script>

<%@ include file="../footer.jsp"%>
