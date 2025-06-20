<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String driverId = request.getParameter("driver_id");
    String message = "";
    String driverName = "";
    double salary = 0;
    Date paymentDate = null;

    if (driverId != null) {
        Connection con = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs1 = null, rs2 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            // Fetch driver details
            String query1 = "SELECT name, salary FROM drivers WHERE driver_id = ?";
            ps1 = con.prepareStatement(query1);
            ps1.setString(1, driverId);
            rs1 = ps1.executeQuery();

            if (rs1.next()) {
                driverName = rs1.getString("name");
                salary = rs1.getDouble("salary");
            } else {
                message = "Driver not found.";
            }

            // Check payment status
            String query2 = "SELECT payment_date FROM payments WHERE driver_id = ? AND MONTH(payment_date) = MONTH(CURRENT_DATE()) AND YEAR(payment_date) = YEAR(CURRENT_DATE())";
            ps2 = con.prepareStatement(query2);
            ps2.setString(1, driverId);
            rs2 = ps2.executeQuery();

            if (rs2.next()) {
                paymentDate = rs2.getDate("payment_date");
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error fetching driver details.";
        } finally {
            // Close resources
            if (rs1 != null) rs1.close();
            if (ps1 != null) ps1.close();
            if (rs2 != null) rs2.close();
            if (ps2 != null) ps2.close();
            if (con != null) con.close();
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Driver Payment</h2>
    
    <!-- Search Form -->
    <form method="GET" action="DriverPayment.jsp" class="text-center mb-4">
        <input type="text" name="driver_id" placeholder="Enter Driver ID" required>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <div class="text-center">
        <p><strong>Driver ID:</strong> <%= driverId != null ? driverId : "N/A" %></p>
        <p><strong>Driver Name:</strong> <%= driverName %></p>
        <p><strong>Salary:</strong> Rs.<%= salary %></p>

        <%
            if (message.isEmpty()) {
                if (paymentDate == null) {
        %>
                    <form action="process_payment.jsp" method="POST">
                        <input type="hidden" name="driver_id" value="<%= driverId %>">
                        <input type="hidden" name="amount" value="<%= salary %>">
                        <button type="submit" class="btn btn-success">Make Payment</button>
                    </form>
        <%
                } else {
        %>
                    <p>Payment has already been made on: <%= paymentDate %></p>
        <%
                }
            } else {
        %>
            <h4 class="text-danger"><%= message %></h4>
        <%
            }
        %>
    </div>
</div>

<%@ include file="../footer.jsp" %>