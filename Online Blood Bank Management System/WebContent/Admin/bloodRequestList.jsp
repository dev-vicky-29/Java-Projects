<%@page import="java.sql.*"%>
<%@ include file="../header.jsp" %>

<%
    // Fetch all blood requests
    ResultSet rs = db.getRows("SELECT * FROM BloodRequests");
%>

<div class="container mt-5">
    <h3 class="text-center">Blood Requests List</h3>
 

    <table class="table table-bordered table-striped mt-4">
        <thead>
            <tr>
                <th>#</th>
                <th>Requester Name</th>
                <th>User Type</th>
                <th>Blood Group</th>
                <th>Quantity</th>
                <th>Purpose</th>
                <th>Urgency</th>
                <th>Contact</th>
                <th>Location</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                int index = 1;
                while (rs != null && rs.next()) { 
                    int requestId = rs.getInt("id");
                    String requesterName = rs.getString("RequesterName");
                    String userType = rs.getString("UserType");
                    String bloodGroup = rs.getString("BloodGroup");
                    int quantity = rs.getInt("Quantity");
                    String purpose = rs.getString("Purpose");
                    String urgency = rs.getString("Urgency");
                    String contact = rs.getString("Contact");
                    String location = rs.getString("Location");
                    String status = rs.getString("Status");
            %>
                <tr>
                    <td><%= index++ %></td>
                    <td><%= requesterName %></td>
                    <td><%= userType %></td>
                    <td><%= bloodGroup %></td>
                    <td><%= quantity %></td>
                    <td><%= purpose %></td>
                    <td><%= urgency %></td>
                    <td><%= contact %></td>
                    <td><%= location %></td>
                    <td><%= status %></td>
                    <td>
                        <% if ("Pending".equalsIgnoreCase(status)) { %>
                            <form method="post" action="bloodRequestAction.jsp" style="display: inline;">
                                <input type="hidden" name="requestId" value="<%= requestId %>">
                                <input type="hidden" name="action" value="approve">
                                <button type="submit" class="btn btn-success btn-sm">Approve</button>
                            </form>
                            <form method="post" action="bloodRequestAction.jsp" style="display: inline;">
                                <input type="hidden" name="requestId" value="<%= requestId %>">
                                <input type="hidden" name="action" value="decline">
                                <button type="submit" class="btn btn-danger btn-sm">Decline</button>
                            </form>
                        <% } else { %>
                            <span class="badge bg-secondary"><%= status %></span>
                        <% } %>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
