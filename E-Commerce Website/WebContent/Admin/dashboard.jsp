<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>



<!-- Main Dashboard Content -->
<div class="container mt-4">
    <div class="row">
        <div class="col-md-3">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Categories</h5>
                    <% ResultSet rsCategories = db.getRows("SELECT COUNT(*) AS total FROM category");
                        int totalCategories = rsCategories.next() ? rsCategories.getInt("total") : 0; %>
                    <p class="card-text fs-4"><%= totalCategories %></p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Subcategories</h5>
                    <% ResultSet rsSubCategories = db.getRows("SELECT COUNT(*) AS total FROM subcategory");
                        int totalSubCategories = rsSubCategories.next() ? rsSubCategories.getInt("total") : 0; %>
                    <p class="card-text fs-4"><%= totalSubCategories %></p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-danger mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Customers</h5>
                    <% ResultSet rsCustomers = db.getRows("SELECT COUNT(*) AS total FROM customerlogin");
                        int totalCustomers = rsCustomers.next() ? rsCustomers.getInt("total") : 0; %>
                    <p class="card-text fs-4"><%= totalCustomers %></p>
                </div>
            </div>
        </div>
          <div class="col-md-3">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Products</h5>
                    <% ResultSet rsProducts = db.getRows("SELECT COUNT(*) AS total FROM product");
                        int totalProducts = rsProducts.next() ? rsProducts.getInt("total") : 0; %>
                    <p class="card-text fs-4"><%= totalProducts %></p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Orders</h5>
                    <% ResultSet rsOrders = db.getRows("SELECT COUNT(*) AS total FROM orders");
                        int totalOrders = rsOrders.next() ? rsOrders.getInt("total") : 0; %>
                    <p class="card-text fs-4"><%= totalOrders %></p>
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
            <table id="ordersTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Order Date</th>
                        <th>User Name</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% ResultSet rsRecentOrders = db.getRows("SELECT Id, OrderDateTime, UserName, OrderAmt, OrderStatus FROM orders ORDER BY OrderDateTime DESC LIMIT 5");
                        int rowCount = 1;
                        while (rsRecentOrders.next()) { %>
                    <tr>
                        <td><%= rowCount++ %></td>
                        <td><%= rsRecentOrders.getString("OrderDateTime") %></td>
                        <td><%= rsRecentOrders.getString("UserName") %></td>
                        <td><%= rsRecentOrders.getDouble("OrderAmt") %> Rs.</td>
                        <td><%= rsRecentOrders.getString("OrderStatus") %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Feedback Table -->
    <div class="card mt-4">
        <div class="card-header bg-dark text-white">
            <h5>Latest Feedback</h5>
        </div>
        <div class="card-body">
            <table id="feedbackTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% ResultSet rsFeedback = db.getRows("SELECT id, name, email, message, created_at FROM feedback ORDER BY created_at DESC LIMIT 5");
                        int feedbackCount = 1;
                        while (rsFeedback.next()) { %>
                    <tr>
                        <td><%= feedbackCount++ %></td>
                        <td><%= rsFeedback.getString("name") %></td>
                        <td><%= rsFeedback.getString("email") %></td>
                        <td><%= rsFeedback.getString("message") %></td>
                        <td><%= rsFeedback.getString("created_at") %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<!-- Initialize DataTables -->
<script>
    $(document).ready(function() {
        $('#ordersTable').DataTable();
        $('#feedbackTable').DataTable();
    });
</script>

