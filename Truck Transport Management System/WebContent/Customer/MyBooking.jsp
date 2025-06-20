<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String userEmail = (String) session.getAttribute("mail"); // Get email from session
    String message = "Your Bookings";
    StringBuilder tableRows = new StringBuilder();

    if (userEmail != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            String query = "SELECT * FROM bookings WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, userEmail);
            rs = ps.executeQuery();

            while (rs.next()) {
                tableRows.append("<tr>")
                          .append("<td>").append(rs.getInt("id")).append("</td>")
                          .append("<td>").append(rs.getString("from_city")).append("</td>")
                          .append("<td>").append(rs.getString("to_city")).append("</td>")
                          .append("<td>").append(rs.getString("truck_type")).append("</td>")
                          .append("<td>").append(rs.getString("weight")).append("</td>")
                          .append("<td>").append(rs.getString("business_category")).append("</td>")
                          .append("<td>").append(rs.getString("company_name")).append("</td>")
                          .append("<td>").append(rs.getString("phone")).append("</td>")
                          .append("<td>").append(rs.getDouble("total_price")).append("</td>")
                          .append("<td>").append(rs.getString("payment_status")).append("</td>")
                          .append("<td>").append(rs.getString("Status")).append("</td>")
                          .append("<td><a href='booking_success.jsp?booking_id=").append(rs.getInt("id")).append("' class='btn btn-info'>View</a></td>")
                          .append("<td>")
                          .append("<form action='cancel_booking.jsp' method='POST'>")
                          .append("<input type='hidden' name='booking_id' value='").append(rs.getInt("id")).append("'>")
                          .append("<button type='submit' class='btn btn-danger' ")
                          .append(rs.getString("Status").equals("Pending") ? "" : "disabled")
                          .append(">Cancel</button>")
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
                    <th>Booking ID</th>
                    <th>From City</th>
                    <th>To City</th>
                    <th>Truck Type</th>
                    <th>Weight</th>
                    <th>Business Category</th>
                    <th>Company Name</th>
                    <th>Phone</th>
                    <th>Total Price</th>
                    <th>Payment Status</th>
                    <th>Status</th>
                    <th>View</th>
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