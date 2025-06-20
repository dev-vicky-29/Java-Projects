  <%@ include file="../header.jsp" %>
  <%
  // Fetch logged-in staff email from session
  String staffEmail = (String) session.getAttribute("mail");
  ResultSet staffRs = db.getRows("SELECT StaffID FROM staff WHERE EmailID=?", staffEmail);
  int staffID = -1;
  if (staffRs.next()) {
      staffID = staffRs.getInt("StaffID");
  }
  %>
  
  <h3 class="text-center mt-4">My Leave Requests</h3>
  <div class="container col-8 mt-4">
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
            <% 
            ResultSet leaveRs = db.getRows("SELECT * FROM leave_requests WHERE StaffID=?", staffID);
            while (leaveRs.next()) {
            	%>
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