<%@ include file="../header.jsp" %>

<!-- Main Dashboard Content -->
<div class="container mt-4">
    <div class="row">
        <!-- Statistics Cards -->
        <div class="col-md-3">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Users</h5>
                    <%
                        ResultSet rsUsers = db.getRows("SELECT COUNT(*) AS totalUsers FROM users"); // Query to count total users
                        int totalUsers = 0;
                        if (rsUsers.next()) {
                            totalUsers = rsUsers.getInt("totalUsers");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalUsers %></p> <!-- Display total users -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Drivers</h5>
                    <%
                        ResultSet rsDrivers = db.getRows("SELECT COUNT(*) AS totalDrivers FROM drivers"); // Query to count total drivers
                        int totalDrivers = 0;
                        if (rsDrivers.next()) {
                            totalDrivers = rsDrivers.getInt("totalDrivers");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalDrivers %></p> <!-- Display total drivers -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-danger mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Trucks</h5>
                    <%
                        ResultSet rsTrucks = db.getRows("SELECT COUNT(*) AS totalTrucks FROM trucks"); // Query to count total trucks
                        int totalTrucks = 0;
                        if (rsTrucks.next()) {
                            totalTrucks = rsTrucks.getInt("totalTrucks");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalTrucks %></p> <!-- Display total trucks -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Cities</h5>
                    <%
                        ResultSet rsCities = db.getRows("SELECT COUNT(*) AS totalCities FROM cities"); // Query to count total cities
                        int totalCities = 0;
                        if (rsCities.next()) {
                            totalCities = rsCities.getInt("totalCities");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalCities %></p> <!-- Display total cities -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Bookings</h5>
                    <%
                        ResultSet rsBookings = db.getRows("SELECT COUNT(*) AS totalBookings FROM bookings"); // Query to count total bookings
                        int totalBookings = 0;
                        if (rsBookings.next()) {
                            totalBookings = rsBookings.getInt("totalBookings");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalBookings %></p> <!-- Display total bookings -->
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Bookings Table -->
    <div class="card mt-4">
        <div class="card-header bg-dark text-white">
            <h5>Recent Bookings</h5>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>From City</th>
                        <th>To City</th>
                        <th>Truck Type</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Query to get the most recent bookings
                        ResultSet rsRecentBookings = db.getRows("SELECT b.id, b.from_city, b.to_city, b.truck_type, b.Status FROM bookings b ORDER BY b.created_at DESC LIMIT 5");
                        int rowCount = 1;
                        while (rsRecentBookings.next()) {
                            String fromCity = rsRecentBookings.getString("from_city");
                            String toCity = rsRecentBookings.getString("to_city");
                            String truckType = rsRecentBookings.getString("truck_type");
                            String status = rsRecentBookings.getString("Status");
                    %>
                    <tr>
                        <td><%= rowCount++ %></td>
                        <td><%= fromCity %></td>
                        <td><%= toCity %></td>
                        <td><%= truckType %></td>
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