<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String bookingId = request.getParameter("booking_id");
    String message = "";
    String details = "";

    if (bookingId != null && !bookingId.isEmpty()) {
        // Fetch booking details from the database
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            String query = "SELECT * FROM bookings WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(bookingId));
            rs = ps.executeQuery();

            if (rs.next()) {
                details = "<p><strong>Booking ID:</strong> " + rs.getInt("id") + "</p>" +
                          "<p><strong>From City:</strong> " + rs.getString("from_city") + "</p>" +
                          "<p><strong>To City:</strong> " + rs.getString("to_city") + "</p>" +
                          "<p><strong>Truck Type:</strong> " + rs.getString("truck_type") + "</p>" +
                          "<p><strong>Weight:</strong> " + rs.getString("weight") + "</p>" +
                          "<p><strong>Business Category:</strong> " + rs.getString("business_category") + "</p>" +
                          "<p><strong>Company Name:</strong> " + rs.getString("company_name") + "</p>" +
                          "<p><strong>Phone:</strong> " + rs.getString("phone") + "</p>" +
                          "<p><strong>Email:</strong> " + rs.getString("email") + "</p>" +
                          "<p><strong>Total Price:</strong> Rs. " + rs.getDouble("total_price") + "</p>" +
                          "<p><strong>Payment Status:</strong> " + rs.getString("payment_status") + "</p>" +
                          "<p><strong>Status:</strong> " + rs.getString("Status") + "</p>" +
                          "<p><strong>Driver ID:</strong> " + rs.getString("driver_id") + "</p>";
            } else {
                message = "No booking found with the provided ID.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error fetching the booking details.";
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "Please enter a valid booking ID.";
    }
%>



<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <h4>Find Your Booking</h4>
        </div>
        <div class="card-body">
            <form method="get" action="FindBooking.jsp">
                <div class="form-group">
                    <label for="booking_id">Enter Booking ID:</label>
                    <input type="text" id="booking_id" name="booking_id" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
            <h4 class="text-danger mt-3"><%= message %></h4>
            <div class="mt-3">
                <%= details %>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>


<%@ include file="../footer.jsp" %>