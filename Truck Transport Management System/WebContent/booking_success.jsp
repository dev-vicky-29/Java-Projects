<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<%
    String bookingId = request.getParameter("booking_id");
    String message = "Your booking has been successfully confirmed!";
    String details = "";

    if (bookingId != null) {
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
                          "<p><strong>Payment Status:</strong> " + rs.getString("payment_status") + "</p>";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error fetching your booking details.";
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "Invalid booking ID.";
    }
%>

<style>
    .card {
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        margin: 20px auto;
        width: 80%;
        background-color: #fff;
    }
    .card-header {
        background-color: #007bff;
        color: white;
        padding: 10px;
        text-align: center;
        font-size: 24px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .card-body {
        padding: 20px;
    }
    .btn-print {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
    }
    .btn-print:hover {
        background-color: #0056b3;
    }
</style>

<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            Truck Transport Management System
        </div>
        <div class="card-body">
            <h4 class="text-success"><%= message %></h4>
            <div class="text-center">
                <%= details %>
            </div>
            <div class="text-center mt-4">
                <button class="btn-print" onclick="printCard();">Print Booking Details</button>
                <a href="BookTruck.jsp" class="btn btn-primary">Book Another Truck</a>
            </div>
        </div>
    </div>
</div>

<script>
    function printCard() {
        var printContents = document.querySelector('.card').innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
</script>

<%@ include file="footer.jsp" %>