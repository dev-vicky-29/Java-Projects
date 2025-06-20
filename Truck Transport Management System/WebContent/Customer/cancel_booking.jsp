<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String bookingId = request.getParameter("booking_id");
    String message = "";

    if (bookingId != null) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            String sql = "UPDATE bookings SET Status = 'Cancelled' WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(bookingId));

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                message = "Booking cancelled successfully!";
            } else {
                message = "Failed to cancel booking.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error cancelling the booking.";
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "Invalid booking ID.";
    }
%>

<div class="container mt-5">
    <h2 class="text-center text-success"><%= message %></h2>
    <div class="text-center mt-4">
        <a href="MyBooking.jsp" class="btn btn-primary">Back to My Bookings</a>
    </div>
</div>

<%@ include file="../footer.jsp" %>