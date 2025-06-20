<%@ include file="../header.jsp" %>

<!-- Main Dashboard Content -->
<div class="container mt-4">
    <div class="row">
        <!-- Statistics Cards -->
        <div class="col-md-3">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Products</h5>
                    <%
                        ResultSet rsProducts = db.getRows("SELECT COUNT(*) AS totalProducts FROM product"); // Query to count total products
                        int totalProducts = 0;
                        if (rsProducts.next()) {
                            totalProducts = rsProducts.getInt("totalProducts");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalProducts %></p> <!-- Display total products -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Categories</h5>
                    <%
                        ResultSet rsCategories = db.getRows("SELECT COUNT(*) AS totalCategories FROM category"); // Query to count total categories
                        int totalCategories = 0;
                        if (rsCategories.next()) {
                            totalCategories = rsCategories.getInt("totalCategories");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalCategories %></p> <!-- Display total categories -->
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-danger mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Users</h5>
                    <%
                        ResultSet rsUsers = db.getRows("SELECT COUNT(*) AS totalUsers FROM customerlogin"); // Query to count total users
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
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Orders</h5>
                    <%
                        ResultSet rsOrders = db.getRows("SELECT COUNT(*) AS totalOrders FROM orders"); // Query to count total orders
                        int totalOrders = 0;
                        if (rsOrders.next()) {
                            totalOrders = rsOrders.getInt("totalOrders");
                        }
                    %>
                    <p class="card-text fs-4"><%= totalOrders %></p> <!-- Display total orders -->
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Orders Table -->
    <div class="card mt-4">
        <div class="card-header bg-dark text-white">
            <h5>Recent Orders</h5>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Order Date & Time</th>
                        <th>User Name</th>
                        <th>Order Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Query to get the most recent orders
                        ResultSet rsRecentOrders = db.getRows("SELECT Id, OrderDateTime, UserName, OrderAmt, OrderStatus FROM orders ORDER BY OrderDateTime DESC LIMIT 5");
                        int rowCount = 1;
                        while (rsRecentOrders.next()) {
                            int orderId = rsRecentOrders.getInt("Id");
                            String orderDateTime = rsRecentOrders.getString("OrderDateTime");
                            String userName = rsRecentOrders.getString("UserName");
                            double orderAmt = rsRecentOrders.getDouble("OrderAmt");
                            String orderStatus = rsRecentOrders.getString("OrderStatus");
                    %>
                    <tr>
                        <td><%= rowCount++ %></td>
                        <td><%= orderDateTime %></td>
                        <td><%= userName %></td>
                        <td><%= orderAmt %> Rs.</td>
                        <td><%= orderStatus %></td>
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
