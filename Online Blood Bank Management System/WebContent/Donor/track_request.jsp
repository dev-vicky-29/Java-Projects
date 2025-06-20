<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<div class="container mt-5">
    <h2 class="text-center">Donor Blood Requests</h2>

    <%
        String userType = (String) session.getAttribute("type");
        String userEmail = (String) session.getAttribute("mail");

        // Handle decline request action
        if (request.getParameter("btnDecline") != null) {
            String requestId = request.getParameter("declineRequestId");
            if (requestId != null) {
                try {
                    db.executeSql("UPDATE bloodrequests SET Status = 'Declined' WHERE ID = ? AND Contact = ?", 
                        requestId, userEmail);
                    out.println("<div class='alert alert-success'>Request ID " + requestId + " has been declined successfully.</div>");
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error while declining request: " + e.getMessage() + "</div>");
                }
            }
        }
    %>

    <!-- Table for Blood Requests -->
    <div class="mt-4">
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Request ID</th>
                    <th>Requester Name</th>
                    <th>Blood Group</th>
                    <th>Quantity</th>
                    <th>Purpose</th>
                    <th>Urgency</th>
                    <th>Contact</th>
                    <th>Location</th>
                    <th>Status</th>
                    <th>Request Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (userEmail != null && "Donor".equalsIgnoreCase(userType)) {
                        // Fetch all requests for the logged-in hospital
                         ResultSet rs = db.getRows(
                            "SELECT ID, RequesterName, BloodGroup, Quantity, Purpose, Urgency, Contact, Location, Status, RequestDate FROM bloodrequests WHERE RequesterName = (SELECT name FROM donors WHERE email = ?)",
                            userEmail
                        );

                        if (rs != null) {
                            boolean hasRequests = false;
                            while (rs.next()) {
                                hasRequests = true;
                %>
                                <tr>
                                    <td><%= rs.getInt("ID") %></td>
                                    <td><%= rs.getString("RequesterName") %></td>
                                    <td><%= rs.getString("BloodGroup") %></td>
                                    <td><%= rs.getInt("Quantity") %></td>
                                    <td><%= rs.getString("Purpose") %></td>
                                    <td><%= rs.getString("Urgency") %></td>
                                    <td><%= rs.getString("Contact") %></td>
                                    <td><%= rs.getString("Location") %></td>
                                    <td><%= rs.getString("Status") %></td>
                                    <td><%= rs.getDate("RequestDate") %></td>
                                    <td>
                                        <% 
                                            String status = rs.getString("Status");
                                            if ("Pending".equalsIgnoreCase(status)) { 
                                        %>
                                            <form method="post" style="display:inline;">
                                                <input type="hidden" name="declineRequestId" value="<%= rs.getInt("ID") %>">
                                                <button type="submit" name="btnDecline" class="btn btn-danger btn-sm">Decline</button>
                                            </form>
                                        <% 
                                            } else if ("Approved".equalsIgnoreCase(status)) { 
                                        %>
                                            <span class="badge badge-success">Approved</span>
                                        <% 
                                            } else if ("Declined".equalsIgnoreCase(status)) { 
                                        %>
                                            <span class="badge badge-secondary">Declined</span>
                                        <% 
                                            } 
                                        %>
                                    </td>
                                </tr>
                <%
                            }

                            if (!hasRequests) {
                %>
                                <tr>
                                    <td colspan="11" class="text-center">No requests found for your hospital account.</td>
                                </tr>
                <%
                            }
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="11" class="text-center text-danger">
                                Invalid session. Please log in as a hospital to view your requests.
                            </td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="../footer.jsp"%>
