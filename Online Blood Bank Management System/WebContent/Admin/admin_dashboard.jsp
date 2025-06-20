<%@ include file="../header.jsp" %>

<!-- Main Dashboard Content -->
<div class="container mt-4">
    <div class="row">
        <!-- Statistics Cards -->
        <div class="col-md-3">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Donors</h5>
                    <%
                        ResultSet rsDonors = db.getRows("SELECT COUNT(*) AS totalDonors FROM donors"); // Query to count total donors
                        int totalDonors = 0;
                        if (rsDonors.next()) {
                            totalDonors = rsDonors.getInt("totalDonors");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalDonors %></p> <!-- Display total donors -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Requesters</h5>
                    <%
                        ResultSet rsRequesters = db.getRows("SELECT COUNT(*) AS totalRequesters FROM users"); // Query to count total requesters
                        int totalRequesters = 0;
                        if (rsRequesters.next()) {
                            totalRequesters = rsRequesters.getInt("totalRequesters");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalRequesters %></p> <!-- Display total requesters -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-danger mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Requests</h5>
                    <%
                        ResultSet rsRequests = db.getRows("SELECT COUNT(*) AS totalRequests FROM bloodrequests"); // Query to count total requests
                        int totalRequests = 0;
                        if (rsRequests.next()) {
                            totalRequests = rsRequests.getInt("totalRequests");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalRequests %></p> <!-- Display total requests -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <%
                ResultSet rsBloodStock = db.getRows("SELECT SUM(Units) AS totalUnits FROM bloodstocks"); // Query to calculate total blood stock units
                int totalUnits = 0;
                if (rsBloodStock.next()) {
                    totalUnits = rsBloodStock.getInt("totalUnits");
                }
            %>
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Blood Stock Availability</h5>
                    <p class="card-text fs-4"><%= totalUnits %> units</p> <!-- Display the total units -->
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activity Table -->
    <div class="card mt-4">
        <div class="card-header bg-dark text-white">
            <h5>Recent Blood Requests</h5>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Requester Name</th>
                        <th>Blood Group</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Query to get the most recent blood requests
                        ResultSet rsRecentRequests = db.getRows("SELECT r.id, r.requestername, r.bloodgroup, r.status FROM bloodrequests r ORDER BY r.requestdate DESC LIMIT 5");
                        int rowCount = 1;
                        while (rsRecentRequests.next()) {
                            String requesterName = rsRecentRequests.getString("requestername");
                            String bloodGroup = rsRecentRequests.getString("bloodgroup");
                            String status = rsRecentRequests.getString("status");
                    %>
                    <tr>
                        <td><%= rowCount++ %></td>
                        <td><%= requesterName %></td>
                        <td><%= bloodGroup %></td>
                        <td><%= status %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
