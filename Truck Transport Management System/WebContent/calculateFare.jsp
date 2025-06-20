<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<%
    String pickup = request.getParameter("pickup");
    String delivery = request.getParameter("delivery");
    String truckId = request.getParameter("truck_id");
    

    double baseFare = 0, distance = 0, addCharges = 0, totalFare = 0;
    String truckModel = "";

    if (pickup != null && delivery != null && truckId != null) {
    	Connection con = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs1 = null, rs2 = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
    		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb","root","VICK2909");
    		// Ensure you have a method that returns a Connection

            // Fetch distance and additional charges
            String query1 = "SELECT distance, AddCharges FROM city_distances WHERE pickup_city = ? AND delivery_city = ?";
            ps1 = con.prepareStatement(query1);
            ps1.setString(1, pickup);
            ps1.setString(2, delivery);
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

<div class="container text-center mt-5">
    <h2 class="text-white fw-bold">Transport Fare Calculation</h2>
    <div class="row justify-content-center mt-4">
        <div class="col-md-6">
            <div class="fare-details bg-white p-4 rounded shadow">
                <h4 class="mb-3 text-primary">Booking Details</h4>
                <p><strong>Pickup City:</strong> <%= pickup %></p>
                <p><strong>Delivery City:</strong> <%= delivery %></p>
                <p><strong>Truck Model:</strong> <%= truckModel %></p>
                <p><strong>Distance:</strong> <%= distance %> km</p>
                <p><strong>Base Fare per km:</strong> Rs.<%= baseFare %></p>
                <p><strong>Additional Charges:</strong> Rs.<%= addCharges %></p>
                <hr>
                <h4 class="text-danger">Total Fare: Rs.<%= totalFare %></h4>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
