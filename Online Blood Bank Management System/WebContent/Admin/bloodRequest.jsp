<%@page import="java.util.Date"%>
<%@page import="java.sql.*, java.text.SimpleDateFormat, java.util.*"%>
<%@ include file="../header.jsp" %>

<%
    // Format date function
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentDate = sdf.format(new Date());

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String action = request.getParameter("action");
        String requestId = request.getParameter("requestId");
        String selectedBloodAvailableDate = request.getParameter("bloodAvailableDate");

        try {
            if ("approve".equals(action)) {
                ResultSet rs = db.getRows("SELECT BloodGroup, Quantity, Email FROM BloodRequests WHERE id = ?", requestId);
                if (rs != null && rs.next()) {
                    String bloodGroup = rs.getString("BloodGroup");
                    int quantity = rs.getInt("Quantity");
                    String requesterEmail = rs.getString("Email");

                    ResultSet stockRs = db.getRows("SELECT Units FROM bloodstocks WHERE BloodGroup = ?", bloodGroup);
                    if (stockRs != null && stockRs.next()) {
                        int currentStock = stockRs.getInt("Units");

                        if (currentStock >= quantity) {
                            // Blood available: Approve request, set ApprovedDate & BloodAvailableDate
                            db.executeSql("UPDATE bloodstocks SET Units = Units - ? WHERE BloodGroup = ?", quantity, bloodGroup);
                            db.executeSql("UPDATE BloodRequests SET Status = 'Approved', ApprovedDate = ?, BloodAvailableDate = ? WHERE id = ?", 
                                currentDate, selectedBloodAvailableDate, requestId);
                            successMsg = "Request approved, stock updated, and Blood Available Date set.";

                            // Send email
                            String subject = "Blood Request Approved";
                            String message = "Dear Requester,\n\nYour blood request for " + quantity + 
                                " unit(s) of " + bloodGroup + " has been approved.\n\nApproval Date: " + currentDate + 
                                "\nBlood Available Date: " + selectedBloodAvailableDate + "\n\nThank you!";
                            SendMail.send(requesterEmail, subject, message);

                        } else {
                            errorMsg = "Not enough stock available to approve this request.";
                        }
                    }
                }
            } else if ("decline".equals(action)) {
                db.executeSql("UPDATE BloodRequests SET Status = 'Declined' WHERE id = ?", requestId);
                successMsg = "Request declined successfully.";

                ResultSet rs = db.getRows("SELECT Email FROM BloodRequests WHERE id = ?", requestId);
                if (rs != null && rs.next()) {
                    String requesterEmail = rs.getString("Email");

                    // Send decline email
                    String subject = "Blood Request Declined";
                    String message = "Dear Requester,\n\nUnfortunately, your blood request has been declined. Please contact the admin for further details.";
                    SendMail.send(requesterEmail, subject, message);
                }
            }
        } catch (Exception e) {
            errorMsg = "Error while processing request: " + e.getMessage();
            e.printStackTrace();
        }
    }

    // Fetch all pending blood requests
    ResultSet requests = db.getRows("SELECT * FROM BloodRequests WHERE Status = 'Pending'");
%>

<div class="container mt-5">
    <h3 class="text-center">Admin Blood Request Panel</h3>
    
    <% if (successMsg != null && !successMsg.isEmpty()) { %>
        <div class="alert alert-success">
            <%= successMsg %>
        </div>
    <% } %>
    
    <% if (errorMsg != null && !errorMsg.isEmpty()) { %>
        <div class="alert alert-danger">
            <%= errorMsg %>
        </div>
    <% } %>
    
    <table class="table table-striped table-hover mt-3">
        <thead>
            <tr>
                <th>Request ID</th>
                <th>Requester Name</th>
                <th>User Type</th>
                <th>Blood Group</th>
                <th>Quantity</th>
                <th>Purpose</th>
                <th>Contact</th>
                <th>Location</th>
                <th>Approval Date</th>
                <th>Blood Available Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (requests != null) {
                    while (requests.next()) {
                        String approvalDate = requests.getString("ApprovedDate") != null ? requests.getString("ApprovedDate") : "Not Approved";
                        String bloodAvailableDate = requests.getString("BloodAvailableDate") != null ? requests.getString("BloodAvailableDate") : "Not Available";
                        int stockAvailable = 0;

                        ResultSet stockRs = db.getRows("SELECT Units FROM bloodstocks WHERE BloodGroup = ?", requests.getString("BloodGroup"));
                        if (stockRs != null && stockRs.next()) {
                            stockAvailable = stockRs.getInt("Units");
                        }

                        boolean canApprove = stockAvailable >= requests.getInt("Quantity");
            %>
            <tr>
                <td><%= requests.getInt("id") %></td>
                <td><%= requests.getString("RequesterName") %></td>
                <td><%= requests.getString("UserType") %></td>
                <td><%= requests.getString("BloodGroup") %></td>
                <td><%= requests.getInt("Quantity") %></td>
                <td><%= requests.getString("Purpose") %></td>
                <td><%= requests.getString("Contact") %></td>
                <td><%= requests.getString("Location") %></td>
                <td><%= approvalDate %></td>
                <td><%= bloodAvailableDate %></td>
                <td>
                    <form method="post">
                        <input type="hidden" name="requestId" value="<%= requests.getInt("id") %>">
                        
                        <label for="bloodAvailableDate">Select Available Date</label>
                        <input type="date" name="bloodAvailableDate"  class="form-control mb-2">
                        
                        <button type="submit" name="action" value="approve" class="btn btn-success btn-sm" <%= canApprove ? "" : "disabled" %>>Approve</button>
                        <button type="submit" name="action" value="decline" class="btn btn-danger btn-sm">Decline</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="11" class="text-center">No pending requests at the moment.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
