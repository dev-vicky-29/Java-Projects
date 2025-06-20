<%@ include file="../header.jsp" %>
<%
    // Fetch all leave requests
    ResultSet leaveRs = db.getRows("SELECT lr.LeaveID, s.StaffName, s.EmailID, lr.LeaveType, lr.StartDate, lr.EndDate, lr.Reason, lr.Status FROM leave_requests lr JOIN staff s ON lr.StaffID = s.StaffID");

    // Handle leave approval/rejection
    if (request.getParameter("btnAction") != null) {
        int leaveID = Integer.parseInt(request.getParameter("leaveID"));
        String status = request.getParameter("btnAction");
        db.executeSql("UPDATE leave_requests SET Status=? WHERE LeaveID=?", status, leaveID);
        response.sendRedirect("approve_reject_leave.jsp?success=Leave request updated successfully!");
    }
%>

<div class="container mt-5 col-10 border">
    <h2 class="text-center">Manage Leave Requests</h2>
    
    <% if (request.getParameter("success") != null) { %>
        <div class="alert alert-success text-center"><%= request.getParameter("success") %></div>
    <% } %>
    
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Staff Name</th>
                <th>Email</th>
                <th>Leave Type</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Reason</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% while (leaveRs.next()) { %>
                <tr>
                    <td><%= leaveRs.getString("StaffName") %></td>
                    <td><%= leaveRs.getString("EmailID") %></td>
                    <td><%= leaveRs.getString("LeaveType") %></td>
                    <td><%= leaveRs.getString("StartDate") %></td>
                    <td><%= leaveRs.getString("EndDate") %></td>
                    <td><%= leaveRs.getString("Reason") %></td>
                    <td><%= leaveRs.getString("Status") != null ? leaveRs.getString("Status") : "N/A" %></td>
                    <td>
                        <% if ("Pending".equals(leaveRs.getString("Status"))) { %>
                            <form action="" method="post">
                                <input type="hidden" name="leaveID" value="<%= leaveRs.getInt("LeaveID") %>">
                                <button type="submit" name="btnAction" value="Approved" class="btn btn-success">Approve</button>
                                <button type="submit" name="btnAction" value="Rejected" class="btn btn-danger">Reject</button>
                            </form>
                        <% } %>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>