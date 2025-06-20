<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    // Status Update Logic
    if (request.getParameter("updateStatus") != null) {
        String bookingId = request.getParameter("booking_id");
        String newStatus = request.getParameter("status");

        // Update booking status
        db.executeSql("UPDATE bookings SET Status=? WHERE id=?", newStatus, bookingId);

        // If trip is completed (Success), set driver status to "Free"
        if ("Success".equals(newStatus)) {
            ResultSet rsDriver = db.getRows("SELECT driver_id FROM bookings WHERE id=?", bookingId);
            if (rsDriver.next()) {
                String driverId = rsDriver.getString("driver_id");
                if (driverId != null && !driverId.isEmpty()) {
                    db.executeSql("UPDATE drivers SET status='Free' WHERE driver_id=?", driverId);
                }
            }
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Bookings</h2>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>From City</th>
                    <th>To City</th>
                    <th>Phone</th>
                    <th>Total Price</th>
                    <th>Payment Status</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Driver</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet rs = db.getRows("SELECT b.id, b.from_city, b.to_city, b.phone, b.total_price, b.payment_status, b.created_at, b.Status, b.driver_id, d.name AS driver_name FROM bookings b LEFT JOIN drivers d ON b.driver_id = d.driver_id");
                    while (rs.next()) {
                        String bookingId = rs.getString("id");
                        String fromCity = rs.getString("from_city");
                        String toCity = rs.getString("to_city");
                        String phone = rs.getString("phone");
                        String totalPrice = rs.getString("total_price");
                        String paymentStatus = rs.getString("payment_status");
                        String created_at = rs.getString("created_at");
                        String status = rs.getString("Status");
                        String driverName = rs.getString("driver_name") != null ? rs.getString("driver_name") : "Not Assigned";
                %>
                <tr>
                    <td><%= bookingId %></td>
                    <td><%= fromCity %></td>
                    <td><%= toCity %></td>
                    <td><%= phone %></td>
                    <td>Rs.<%= totalPrice %></td>
                    <td><%= paymentStatus %></td>
                    <td><%= created_at %></td>
                    <td>
                        <% if (!status.equals("Canceled")) { %>
                            <form method="post" class="d-inline">
                                <input type="hidden" name="booking_id" value="<%= bookingId %>">
                                <select name="status" class="form-select form-select-sm d-inline w-auto">
                                    <option value="Pending" <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
                                    <option value="Success" <%= status.equals("Success") ? "selected" : "" %>>Success</option>
                                    <option value="Canceled" <%= status.equals("Canceled") ? "selected" : "" %>>Canceled</option>
                                </select>
                                <button type="submit" name="updateStatus" class="btn btn-sm btn-success">Update</button>
                            </form>
                        <% } else { %>
                            <span class="text-danger">Canceled</span>
                        <% } %>
                    </td>
                    <td><%= driverName %></td>
                    <td>
                        <a href="booking_success.jsp?booking_id=<%= bookingId %>" class="btn btn-primary btn-sm">View</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="../footer.jsp"%>
