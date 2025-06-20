<%@ include file="../header.jsp" %>
<%
    String staffEmail = session.getAttribute("mail").toString();
    ResultSet staffRs = db.getRows("SELECT * FROM staff WHERE EmailID=?", staffEmail);
    ResultSet attendanceRs = db.getRows("SELECT * FROM attendance WHERE EmailID=?", staffEmail);
    ResultSet leaveRs = db.getRows("SELECT * FROM leave_requests WHERE EmailID=?", staffEmail);
    ResultSet salaryRs = db.getRows("SELECT * FROM payment WHERE EmailID=?", staffEmail);

    String staffName = "";
    if (staffRs.next()) {
        staffName = staffRs.getString("StaffName");
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Welcome, <%= staffName %>!</h2>
    
    <h3 class="mt-4">Attendance Record</h3>
    <table class="table table-bordered">
        <tr><th>Date</th><th>Status</th></tr>
        <% while (attendanceRs.next()) { %>
            <tr><td><%= attendanceRs.getString("Date") %></td><td><%= attendanceRs.getString("AttendanceStatus") %></td></tr>
        <% } %>
    </table>
    
    <h3 class="mt-4">Leave Requests</h3>
    <table class="table table-bordered">
        <tr><th>Leave Type</th><th>Start Date</th><th>End Date</th><th>Status</th></tr>
        <% while (leaveRs.next()) { %>
            <tr><td><%= leaveRs.getString("LeaveType") %></td><td><%= leaveRs.getString("StartDate") %></td><td><%= leaveRs.getString("EndDate") %></td><td><%= leaveRs.getString("Status") %></td></tr>
        <% } %>
    </table>
    
    <h3 class="mt-4">Salary Details</h3>
    <table class="table table-bordered">
        <tr><th>Month</th><th>Year</th><th>Salary</th><th>Payment Method</th><th>Paid Date</th></tr>
        <% while (salaryRs.next()) { %>
            <tr><td><%= salaryRs.getString("Month") %></td><td><%= salaryRs.getString("Year") %></td><td><%= salaryRs.getString("Salary") %></td><td><%= salaryRs.getString("PaymentMethod") %></td><td><%= salaryRs.getString("PaidDate") %></td></tr>
        <% } %>
    </table>
</div>

<%@ include file="../footer.jsp" %>