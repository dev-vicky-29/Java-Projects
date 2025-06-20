<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String driverEmail = (String) session.getAttribute("mail"); // Get email from session
    String message = "Your Bookings";
    StringBuilder tableRows = new StringBuilder();

    if (driverEmail != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            // Handle status update if form is submitted
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String driverStatus = request.getParameter("driver_status");
                int bookingId = Integer.parseInt(request.getParameter("booking_id"));

                // Update the driver status in the database
                String updateQuery = "UPDATE bookings SET driver_status = ? WHERE id = ?";
                ps = con.prepareStatement(updateQuery);
                ps.setString(1, driverStatus);
                ps.setInt(2, bookingId);
                ps.executeUpdate();
                message = "Trip status updated successfully!";
            }

            // Fetch bookings for the logged-in driver
            String query = "SELECT b.*, d.driver_id FROM bookings b JOIN drivers d ON b.driver_id = d.driver_id WHERE d.EmailID = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, driverEmail);
            rs = ps.executeQuery();

            while (rs.next()) {
                tableRows.append("<tr>")
                          .append("<td>").append(rs.getString("from_city")).append("</td>")
                          .append("<td>").append(rs.getString("to_city")).append("</td>")
                          .append("<td>").append(rs.getString("truck_type")).append("</td>")
                          .append("<td>").append(rs.getString("company_name")).append("</td>")
                          .append("<td>").append(rs.getString("phone")).append("</td>")
                          .append("<td>").append(rs.getString("email")).append("</td>")
                          .append("<td>").append(rs.getString("driver_status")).append("</td>")
                          .append("<td>").append(rs.getInt("driver_id")).append("</td>")
                          .append("<td>")
                          .append("<form method='POST'>")
                          .append("<select name='driver_status'>")
                          .append("<option value='Accept' ").append(rs.getString("driver_status").equals("Accept") ? "selected" : "").append(">Accept</option>")
                          .append("<option value='Success' ").append(rs.getString("driver_status").equals("Success") ? "selected" : "").append(">Success</option>")
                          .append("<option value='Canceled' ").append(rs.getString("driver_status").equals("Canceled") ? "selected" : "").append(">Canceled</option>")
                          .append("</select>")
                          .append("<input type='hidden' name='booking_id' value='").append(rs.getInt("id")).append("'>")
                          .append("<input type='submit' value='Update' class='btn btn-primary'>")
                          .append("</form>")
                          .append("</td>")
                          .append("</tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error fetching your bookings.";
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "You need to log in to view your bookings.";
    }
%>

<style>
    .table-container {
        margin: 20px auto;
        width: 80%;
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
        background-color: #007bff;
        color: white;
    }
</style>

<div class="container mt-5">
    <h2 class="text-center text-success"><%= message %></h2>
    <div class="table-container">
        <table class="table">
            <thead>
                <tr>
                    <th>From City</th>
                    <th>To City</th>
                    <th>Truck Type</th>
                    <th>Company Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th >MyTrip Status</th>
                    <th>Driver ID</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%= tableRows.toString() %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="../footer.jsp" %>