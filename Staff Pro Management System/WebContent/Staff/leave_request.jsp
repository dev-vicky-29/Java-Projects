<%@ include file="../header.jsp" %>
<%
    // Fetch logged-in staff email from session
    String staffEmail = (String) session.getAttribute("mail");
    ResultSet staffRs = db.getRows("SELECT StaffID FROM staff WHERE EmailID=?", staffEmail);
    int staffID = -1;
    if (staffRs.next()) {
        staffID = staffRs.getInt("StaffID");
    }

    // Handle leave request submission
    if (request.getParameter("btnSubmit") != null) {
        String leaveType = request.getParameter("leaveType");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String reason = request.getParameter("reason");
        
        db.executeSql("INSERT INTO leave_requests (StaffID, EmailID, LeaveType, StartDate, EndDate, Reason, Status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')", 
            staffID, staffEmail, leaveType, startDate, endDate, reason);
        response.sendRedirect("leave_request.jsp?success=Leave request submitted successfully!");
    }

    // Fetch staff's leave requests
    ResultSet leaveRs = db.getRows("SELECT * FROM leave_requests WHERE StaffID=?", staffID);
%>

<div class="container mt-5 col-8 offset-2 border">
    <h2 class="text-center">Request Leave</h2>
    
    <%-- Display success message --%>
    <% if (request.getParameter("success") != null) { %>
        <div class="alert alert-success text-center"><%= request.getParameter("success") %></div>
    <% } %>
    
    <form action="" method="post" class="p-3">
        <div class="form-group">
            <label>Leave Type</label>
            <select name="leaveType" class="form-control" required>
                <option value="Sick Leave">Sick Leave</option>
                <option value="Casual Leave">Casual Leave</option>
                <option value="Annual Leave">Annual Leave</option>
            </select>
        </div>
        <div class="form-group">
            <label>Start Date</label>
            <input type="date" name="startDate" class="form-control" required />
        </div>
        <div class="form-group">
            <label>End Date</label>
            <input type="date" name="endDate" class="form-control" required />
        </div>
        <div class="form-group">
            <label>Reason</label>
            <textarea name="reason" class="form-control" required></textarea>
        </div>
        <div class="text-center d-grid">
        <input type="submit" name="btnSubmit" class="btn mt-4  btn-primary" value="Submit Request" />
        </div>
    </form>
    <hr>

    <h3 class="text-center mt-4">Your Leave Requests</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Leave Type</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Reason</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% while (leaveRs.next()) { %>
                <tr>
                    <td><%= leaveRs.getString("LeaveType") %></td>
                    <td><%= leaveRs.getString("StartDate") %></td>
                    <td><%= leaveRs.getString("EndDate") %></td>
                    <td><%= leaveRs.getString("Reason") %></td>
                    <td><%= leaveRs.getString("Status") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>