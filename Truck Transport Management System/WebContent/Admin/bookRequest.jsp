<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    String message = "Pending Booking Requests";
    StringBuilder tableRows = new StringBuilder();

    try {
        // Fetch all pending bookings
        ResultSet rs = db.getRows("SELECT * FROM bookings WHERE Status = 'Pending'");

        while (rs.next()) {
            int bookingId = rs.getInt("id");
            String fromCity = rs.getString("from_city");
            String toCity = rs.getString("to_city");
            String truckType = rs.getString("truck_type");
            String weight = rs.getString("weight");
            String businessCategory = rs.getString("business_category");
            String companyName = rs.getString("company_name");
            String phone = rs.getString("phone");
            double totalPrice = rs.getDouble("total_price");
            String paymentStatus = rs.getString("payment_status");
            String status = rs.getString("Status");

            // Fetch available drivers
            ResultSet driverRs = db.getRows("SELECT driver_id, name FROM drivers WHERE Status = 'Free'");

            StringBuilder driverOptions = new StringBuilder();
            while (driverRs.next()) {
                driverOptions.append("<option value='").append(driverRs.getInt("driver_id")).append("'>")
                             .append(driverRs.getString("name")).append("</option>");
            }

            tableRows.append("<tr>")
                      .append("<td>").append(bookingId).append("</td>")
                      .append("<td>").append(fromCity).append("</td>")
                      .append("<td>").append(toCity).append("</td>")
                      .append("<td>").append(truckType).append("</td>")
                      .append("<td>").append(weight).append("</td>")
                      .append("<td>").append(businessCategory).append("</td>")
                      .append("<td>").append(companyName).append("</td>")
                      .append("<td>").append(phone).append("</td>")
                      .append("<td>").append(totalPrice).append("</td>")
                      .append("<td>").append(paymentStatus).append("</td>")
                      .append("<td>").append(status).append("</td>")
                      .append("<td>")
                      .append("<form action='update_booking1.jsp' method='POST'>")
                      .append("<input type='hidden' name='booking_id' value='").append(bookingId).append("'>")
                      .append("<select name='driver_id' required>")
                      .append("<option value=''>Select Driver</option>")
                      .append(driverOptions.toString())
                      .append("</select>")
                      .append("<button type='submit' class='btn btn-success'>Assign Driver</button>")
                      .append("</form>")
                      .append("</td>")
                      .append("</tr>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "There was an error fetching the bookings.";
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
