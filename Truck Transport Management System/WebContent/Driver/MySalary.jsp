<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    // Retrieve driver email from session
    String driverEmail = (String) session.getAttribute("mail");
    String message = "My Salary Details";
    StringBuilder tableRows = new StringBuilder();

    // Declare variables outside the try block
    int driverId = -1;
    String driverName = "";
    double salary = 0.0;

    if (driverEmail != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            // Fetch driver details (driver_id, name, salary) using email
            String driverQuery = "SELECT driver_id, name, salary FROM drivers WHERE EmailID = ?";
            ps = con.prepareStatement(driverQuery);
            ps.setString(1, driverEmail);
            rs = ps.executeQuery();

            if (rs.next()) {
                driverId = rs.getInt("driver_id");
                driverName = rs.getString("name");
                salary = rs.getDouble("salary");
            }

            if (driverId == -1) {
                message = "Driver details not found!";
            } else {
                // Close previous result set & statement before reusing them
                rs.close();
                ps.close();

                // Fetch salary payments for the driver
                String salaryQuery = "SELECT payment_date, amount FROM payments WHERE driver_id = ? ORDER BY payment_date DESC";
                ps = con.prepareStatement(salaryQuery);
                ps.setInt(1, driverId);
                rs = ps.executeQuery();

                while (rs.next()) {
                    tableRows.append("<tr>")
                              .append("<td>").append(rs.getDate("payment_date")).append("</td>")
                              .append("<td>Rs.").append(rs.getDouble("amount")).append("</td>")
                              .append("</tr>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error fetching salary details.";
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "You need to log in to view your salary details.";
    }
%>

<style>
    .table-container {
        margin: 20px auto;
        width: 60%;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
    }
    .table th, .table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    .table th {
        background-color: #28a745;
        color: white;
    }
</style>

<div class="container mt-5">
    <h2 class="text-center text-success"><%= message %></h2>

    <% if (driverEmail != null && driverId != -1) { %>
        <div class="text-center mb-4">
            <p><strong>Driver Name:</strong> <%= driverName %></p>
            <p><strong>Monthly Salary:</strong> Rs.<%= salary %></p>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Payment Date</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <%= tableRows.length() > 0 ? tableRows.toString() : "<tr><td colspan='2' class='text-center'>No salary records found.</td></tr>" %>
                </tbody>
            </table>
        </div>
    <% } %>
</div>

<%@ include file="../footer.jsp" %>
