
<%@ include file="../header.jsp" %>
<%
    ResultSet staffCount = db.getRows("SELECT COUNT(*) AS total FROM staff");
    ResultSet leaveCount = db.getRows("SELECT COUNT(*) AS pending FROM leave_requests WHERE Status='Pending'");
    ResultSet paymentCount = db.getRows("SELECT COUNT(*) AS total FROM payment");
    ResultSet staffRs = db.getRows("SELECT * FROM staff");
    ResultSet leaveRs = db.getRows("SELECT * FROM leave_requests ORDER BY AppliedOn DESC");
    ResultSet paymentRs = db.getRows("SELECT * FROM payment ORDER BY PaidDate DESC");
    
    staffCount.next();
    leaveCount.next();
    paymentCount.next();
%>

<div class="container mt-5">
    <h2 class="text-center">Admin Dashboard</h2>
    
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Staff</h5>
                    <p class="card-text"><%= staffCount.getInt("total") %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Pending Leave Requests</h5>
                    <p class="card-text"><%= leaveCount.getInt("pending") %></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Payments</h5>
                    <p class="card-text"><%= paymentCount.getInt("total") %></p>
                </div>
            </div>
        </div>
    </div>

    <h3 class="mt-4">Staff List</h3>
    <table class="table table-bordered">
        <tr><th>Staff ID</th><th>Name</th><th>Email</th><th>Department</th><th>Designation</th><th>Salary</th></tr>
        <% while (staffRs.next()) { %>
            <tr>
                <td><%= staffRs.getInt("StaffID") %></td>
                <td><%= staffRs.getString("StaffName") %></td>
                <td><%= staffRs.getString("EmailID") %></td>
                <td><%= staffRs.getString("Department") %></td>
                <td><%= staffRs.getString("Designation") %></td>
                <td><%= staffRs.getString("Salary") %></td>
            </tr>
        <% } %>
    </table>

    <h3 class="mt-4">Recent Leave Requests</h3>
    <table class="table table-bordered">
        <tr><th>Staff Name</th><th>Email</th><th>Leave Type</th><th>Start Date</th><th>End Date</th><th>Status</th></tr>
        <% while (leaveRs.next()) { %>
            <tr>
                <td><%= leaveRs.getString("StaffID") %></td>
                <td><%= leaveRs.getString("EmailID") %></td>
                <td><%= leaveRs.getString("LeaveType") %></td>
                <td><%= leaveRs.getString("StartDate") %></td>
                <td><%= leaveRs.getString("EndDate") %></td>
                <td><%= leaveRs.getString("Status") %></td>
            </tr>
        <% } %>
    </table>

    <h3 class="mt-4">Recent Payments</h3>
    <table class="table table-bordered">
        <tr><th>Staff Name</th><th>Email</th><th>Salary</th><th>Month</th><th>Year</th><th>Payment Method</th><th>Paid Date</th></tr>
        <% while (paymentRs.next()) { %>
            <tr>
                <td><%= paymentRs.getString("StaffName") %></td>
                <td><%= paymentRs.getString("EmailID") %></td>
                <td><%= paymentRs.getString("Salary") %></td>
                <td><%= paymentRs.getString("Month") %></td>
                <td><%= paymentRs.getString("Year") %></td>
                <td><%= paymentRs.getString("PaymentMethod") %></td>
                <td><%= paymentRs.getString("PaidDate") %></td>
            </tr>
        <% } %>
    </table>
</div>

<%@ include file="../footer.jsp" %>