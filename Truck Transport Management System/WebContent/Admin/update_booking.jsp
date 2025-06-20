<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String bookingId = request.getParameter("booking_id");
    String driverId = request.getParameter("driver_id");
    String message = "";

    if (bookingId != null && driverId != null) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            // Update booking status and assign driver
            String sql = "UPDATE bookings SET Status = 'On Work', driver_id = ? WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, driverId);
            ps.setInt(2, Integer.parseInt(bookingId));

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                message = "Driver assigned successfully!";
            } else {
                message = "Failed to assign driver.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error updating the booking.";
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "Invalid booking ID or driver ID.";
    }
%>

<div class="container mt-5">
    <h2 class="text-center text-success"><%= message %></h2>
    <div class="text-center mt-4">
        <a href="ManageBookings.jsp" class="btn btn-primary">Back to Manage Bookings</a>
    </div>
</div>

<%@ include file="../footer.jsp" %>