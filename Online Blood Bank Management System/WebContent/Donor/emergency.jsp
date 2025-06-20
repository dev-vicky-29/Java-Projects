<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
    // Fetch urgent blood requests
    ResultSet rs = db.getRows("SELECT RequesterName, BloodGroup, Quantity, Purpose, Urgency, Contact, Location, Status, RequestDate FROM bloodrequests WHERE Urgency='Urgent'");
%>

<div class="container mt-5">
    <h2 class="text-center">Emergency Blood Requests</h2>
    <div class="row mt-4">
        <% 
            while (rs != null && rs.next()) {
                String requesterName = rs.getString("RequesterName");
                String bloodGroup = rs.getString("BloodGroup");
                int quantity = rs.getInt("Quantity");
                String purpose = rs.getString("Purpose");
                String urgency = rs.getString("Urgency");
                String contact = rs.getString("Contact");
                String location = rs.getString("Location");
                String status = rs.getString("Status");
                String requestDate = rs.getString("RequestDate");
        %>
        <!-- Card for each blood request -->
        <div class="col-md-4 mb-4">
            <div class="card shadow">
                <div class="card-header bg-danger text-white">
                    <h5 class="card-title mb-0"><%= bloodGroup %> Blood Request</h5>
                </div>
                <div class="card-body">
                    <p><strong>Requester:</strong> <%= requesterName %></p>
                    <p><strong>Quantity:</strong> <%= quantity %> Units</p>
                    <p><strong>Purpose:</strong> <%= purpose %></p>
                    <p><strong>Contact:</strong> <%= contact %></p>
                    <p><strong>Location:</strong> <%= location %></p>
                    <p><strong>Status:</strong> 
                        <% if ("Approved".equalsIgnoreCase(status)) { %>
                            <span class="badge bg-success text-white"><%= status %></span>
                        <% } else if ("Pending".equalsIgnoreCase(status)) { %>
                            <span class="badge bg-warning text-dark"><%= status %></span>
                        <% } else { %>
                            <span class="badge bg-danger text-white"><%= status %></span>
                        <% } %>
                    </p>
                    <p><strong>Requested On:</strong> <%= requestDate %></p>
                </div>
            </div>
        </div>
        <% 
            }
        %>
    </div>
</div>

<%@ include file="../footer.jsp"%>

