<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<%
    String fromCity = request.getParameter("from_city");
    String toCity = request.getParameter("to_city");
    String truckId = request.getParameter("truck_id");
    String weight = request.getParameter("weight");
    String businessCategory = request.getParameter("business_category");
    String companyName = request.getParameter("company_name");
    String phone = request.getParameter("phone");
    String userEmail = (String) session.getAttribute("mail"); // Get email from session

    double baseFare = 0, distance = 0, addCharges = 0, totalFare = 0;
    String truckModel = "";

    if (fromCity != null && toCity != null && truckId != null) {
        Connection con = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs1 = null, rs2 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            // Fetch distance and additional charges
            String query1 = "SELECT distance, AddCharges FROM city_distances WHERE pickup_city = ? AND delivery_city = ?";
            ps1 = con.prepareStatement(query1);
            ps1.setString(1, fromCity);
            ps1.setString(2, toCity);
            rs1 = ps1.executeQuery();

            if (rs1.next()) {
                distance = rs1.getDouble("distance");
                addCharges = rs1.getDouble("AddCharges");
            } else {
                out.println("<h4 class='text-danger'>Truck not available for this area</h4>");
                return;
            }

            // Fetch truck details
            String query2 = "SELECT model, basefare FROM trucks WHERE truck_id = ?";
            ps2 = con.prepareStatement(query2);
            ps2.setString(1, truckId);
            rs2 = ps2.executeQuery();

            if (rs2.next()) {
                truckModel = rs2.getString("model");
                baseFare = rs2.getDouble("basefare");
            }

            // Calculate total fare
            totalFare = (baseFare * distance) + addCharges;

            // Store booking details in session
            session.setAttribute("bookingDetails", new String[]{fromCity, toCity, truckId, weight, businessCategory, companyName, phone, userEmail, String.valueOf(totalFare)});
        } catch (Exception e) {
            e.printStackTrace();
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
    <h2 class="text-center">Fare Calculation</h2>
    <div class="text-center">
        <p><strong>Pickup City:</strong> <%= fromCity %></p>
        <p><strong>Delivery City:</strong> <%= toCity %></p>
        <p><strong>Truck Model:</strong> <%= truckModel %></p>
        <p><strong>Distance:</strong> <%= distance %> km</p>
        <p><strong>Base Fare per km:</strong> Rs.<%= baseFare %></p>
        <p><strong>Additional Charges:</strong> Rs.<%= addCharges %></p>
        <hr>
        <h4 class="text-danger">Total Fare: Rs.<%= totalFare %></h4>
    </div>
    <form action="payment.jsp" method="POST">
        <input type="hidden" name="from_city" value="<%= fromCity %>">
        <input type="hidden" name="to_city" value="<%= toCity %>">
        <input type="hidden" name="truck_id" value="<%= truckId %>">
        <input type="hidden" name="weight" value="<%= weight %>">
        <input type="hidden" name="business_category" value="<%= businessCategory %>">
        <input type="hidden" name="company_name" value="<%= companyName %>">
        <input type="hidden" name="phone" value="<%= phone %>">
        <input type="hidden" name="total_fare" value="<%= totalFare %>">

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-success">Confirm Booking</button>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>