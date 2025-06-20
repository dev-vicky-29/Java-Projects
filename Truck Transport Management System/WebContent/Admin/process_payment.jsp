<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String driverId = request.getParameter("driver_id");
    String amount = request.getParameter("amount");
    String message = "";

    if (driverId != null && amount != null) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            String query = "INSERT INTO payments (driver_id, payment_date, amount) VALUES (?, NOW(), ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, driverId);
            ps.setDouble(2, Double.parseDouble(amount));
            ps.executeUpdate();

            message = "Payment has been successfully processed!";
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error processing payment.";
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "Invalid payment details.";
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Payment Status</h2>
    <div class="text-center">
        <h4 class="text-success"><%= message %></h4>
        <a href="DriverPayment.jsp" class="btn btn-primary">Back to Driver Payment</a>
    </div>
</div>

<%@ include file="../footer.jsp" %>